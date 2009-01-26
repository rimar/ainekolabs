require 'find'
require 'date'
require 'envs'

class Client
  def initialize() @shouldRun = true end
  def main
    while (@shouldRun) do
      Find.find(Envs.ainekodir) do |path|
        next if path == Envs.ainekodir
        if FileTest.directory?(path)
          puts(path)
          Find.prune
        end
      end
      puts DateTime.now
      sleep(2)
    end
  end
end

if $0 == __FILE__
  c = Client.new
  c.main
end

