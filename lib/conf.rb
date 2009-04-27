require 'rubygems'

module Aineko
  module Conf
    # Add support for conf :x, :y notation
    def conf(*names)
      # add all names to the @@confs class variable and a getter
      self.instance_eval do
        @confs = names 
        def confs() @confs end
      end
      # add methods named 'name' that return configuration value with the key 'name'
      names.each do |name| 
        module_eval <<-"end;"
        def #{name}
          Configuration.get(self, "#{name}")
        end
      end;
      end
    end
  end

  # Encapsulate bot's configuration
  class Configuration
    attr_accessor :id, :type, :params
    def self.get(obj, name)
      # TODO: read from file/git
      cfg = Configuration.new
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
