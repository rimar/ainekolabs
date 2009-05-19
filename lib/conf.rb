
module Aineko
  module Conf
    # Add support for conf :x, :y notation
    def conf(*names)
      __declare__(:conf, names)
      # add methods named 'name' that return configuration value with the key 'name'
      __inject__(names) { |n| Config.get(self, n.to_s)} 
      Configurator.list << self
    end

    def __declare__(sym, names)
      define_method(sym.to_s + "_list", lambda { names })
    end

    def __inject__(names, &block)
      names.each do |name| 
        self.send(:define_method, name, lambda {block.call(name)})
      end
    end
  end

  class Configurator
    class<<self
      def list
        @list ||= []
      end
      def cfg(path)
        load(path)
        clazz = @list[@list.size - 1]
        bot = clazz.new
        config = Config.new
        config.type = clazz.to_s
        print "Insert " + clazz.to_s + " ID: "
        config.id = STDIN.gets.chop

        bot.conf_list.each do |meth| 
          print "Insert the value of " + meth.to_s + ": "
          config.params[meth] = STDIN.gets.chop
        end
        puts config.to_yaml
      end
    end
  end

  # Encapsulate bot's configuration
  class Config
    attr_accessor :id, :type, :params
    def initialize
      @params = {}
    end

    def self.get(obj, name)
      # TODO: read from file/git
      cfg = self.new
      cfg.params = {}
      cfg.params["a"] = "AHA"
      cfg.params["b"] = "UHU"
      cfg.params[name]
    end
  end
end

class Module
  include Aineko::Conf
end

class Array
  def to_s
    reduce{|a,b| a.to_s + "," + b.to_s}
  end
end
