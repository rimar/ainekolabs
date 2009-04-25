#!/usr/bin/ruby
require 'rubygems'
require 'git'
require 'envs'

class Gitty
  def update(url)
    name = Envs.giturl2name(url)
    path = Envs.name2path(name)
    if (FileTest.exist?(path + "/.git"))
      pull(path)
    else 
      init(url, path)
    end
  end

  def init(url, path)
    puts("cloning " + path)
    Git.clone(url, path)
  end

  def pull(path)
    puts("pulling " + path)
    repo = Git.open(path)
    repo.fetch
    repo.merge("origin/master")
  end	

  def updateAll
    Envs.each_pap do |path| 
      pull(path)
    end
  end
end	

if $0 == __FILE__
  puts($*)
  g = Gitty.new
  if ($*.size == 0)
    g.updateAll
  else
    g.update($*[0])
  end
end

