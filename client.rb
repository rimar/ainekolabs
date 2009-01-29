#!/usr/bin/ruby
require 'date'
require 'envs'

class Client
  def initialize() @shouldRun = true end
  def main
    while (@shouldRun) do
      Envs.each_pap do |path|
        run(path)
      end
      puts DateTime.now
      sleep(2)
    end
  end

  def run(path)
    puts "path=" + path
    name = Envs.path2name(path)
    puts "name=" + name
  end
end

if $0 == __FILE__
  c = Client.new
  c.main
end

