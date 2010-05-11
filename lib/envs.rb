require 'find'

module Envs
  def self.ainekodir
    File.expand_path("~/.aineko")
  end

  def self.reloadPrep(name)
    $".delete(name + ".rb")
  end

  def self.giturl2name(url)
    # Extracting: git://github.com/rimar/tttbot.git => tttbot
    url.split('/').last.sub(/\.git/, '')
  end

  def self.name2path(name)
    Envs.ainekodir + '/' + name
  end

  def self.path2name(path)
    path.split('/').last
  end

  def self.each_pap
    Find.find(Envs.ainekodir) do |path|
      next if path == Envs.ainekodir
      if FileTest.directory?(path)
        yield path
        Find.prune
      end
    end
  end

  def self.loadPrep(name)
    # Add the directory where it's checked out to the load path
    path = name2path(name)
    $LOAD_PATH<<path if !$LOAD_PATH.include?(path)
  end


end

