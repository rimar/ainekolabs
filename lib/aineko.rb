AI_PATH = File.dirname(__FILE__)
$LOAD_PATH<<AI_PATH if !$LOAD_PATH.include?(AI_PATH)
require 'client'
require 'conf'
require 'gitty'

module Aineko
  class Runner
    def __run__(args)
      if args.length == 0 
        help
        return
      end
      meth = args.shift
      begin
        send(meth, args)
      rescue NoMethodError
        puts "Method not supported: #{meth}"
      end
    end

    protected
    def show(pap)
      puts "inspecting #{pap[0]}"
      #load pap
    end

    def help(*args)
      puts "usage: ai command [bot] [options]"
      puts "  Commands:"
      protected_methods.each do |meth|
        puts "    " + meth.to_s
      end
    end

    def git(urls)
      Gitty.new.update(urls[0])
    end

  end
end

