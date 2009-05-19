require 'rubygems'

module Aineko
  module Conf
    # Add support for conf :x, :y notation
    def conf(*names)
      __declare__(:conf, names)
      # add methods named 'name' that return configuration value with the key 'name'
      __inject__(names) { |n| Config.get(self, n.to_s)} 
      Configured.list << self
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

  class Configured
    class<<self
      def list
        @list ||= []
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
