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
        helpstr = "    " + meth.to_s
        desc_method = meth.to_s + "_help"
        helpstr += " : " + send(desc_method) if respond_to?(desc_method, true)
        puts helpstr
      end
    end

    def git(urls)
      Gitty.new.update(urls[0])
    end

    def conf(path)
      load(path[0])
      p Configured.list
    end

    private
    def conf_help
      "Display bot conf"
    end

    def git_help
      "fetch bot from git repo"
    end

    def help_help
      "this message"
    end
  end
end

