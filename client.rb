#!/usr/bin/ruby
require 'date'
require 'envs'

class Client
  def initialize() @shouldRun = true end
  def main
    papsload
    papsconf
    papsstart
    while (@shouldRun) do
      puts DateTime.now
      sleep(2)
    end
  end

  def papsload
    Envs.each_pap do |path|
      name = Envs.path2name(path)
      puts "name=#{name}, path=#{path}"
      Envs.loadPrep(name)
      require name
    end
  end

  def papsconf
    @container = {}
    Envs.each_pap do |path|
      conf_file = File.expand_path("conf.yaml", path)
      next if !File.file?(conf_file)
      conf = YAML::load(File.open(conf_file))
      conf.each{|entry| 
        bot = entry['bot']
        id = bot['id']
        pap = bot['type']
        #TODO handle properties of different types, e.g. simple/bot/private
        properties = bot['properties']
        #TODO handle dependencies
        bot_inst = method(pap).call
        @container[id] = bot_inst
        if properties 
          properties.each{|key, value|
            bot_inst.instance_variable_set("@#{key}", @container[value])
          } 
        end
      }
    end
  end

  def papsstart
    puts "Papstart, contaner = #{@container.to_yaml}"
    @container.each{|key, value|
      if value.respond_to?('start')
        value.start
      end
    }
  end

end

if $0 == __FILE__
  c = Client.new
  c.main
end

