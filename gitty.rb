require 'fileutils'
require 'rubygems'
require 'git'
require 'envs'

class Gitty
  attr_reader :name, :url, :path
  def initialize(url) @url = url end
  def update
    parseUrl
    if (FileTest.exist?(@path + "/.git"))
      puts (@path + " has git repo")
      pull
    else 
      puts(@path + " has no git repo")
      init
    end
    loadPrep
  end

  def init
    Git.clone(@url, @path)
  end

  def pull
    repo = Git.open(@path)
    repo.fetch
    repo.merge("origin/master")
  end	

  def loadPrep
    # Add the directory where it's checked out to the load path
    $LOAD_PATH<<@path if !$LOAD_PATH.include?(@path)
    $".delete(@name + "rb")
  end

  def parseUrl
    # Extracting: git://github.com/rimar/tttbot.git => tttbot
    @name = @url.split('/').last.sub(/\.git/, '')
    @path = Envs.ainekodir + '/' + @name
  end	

end	

#
#f = File.new("#{name}/#{@name}.rb", "w")
#f.puts("puts(\"Executing file: #{@name}.rb\")")
#f.close
