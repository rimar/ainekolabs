require 'rubygems'
require 'rake/gempackagetask'
require 'rake/clean'

AI_VERSION = "0.1.0"
AI_GEMNAME = "aineko"
spec = Gem::Specification.new do |s|
  s.name       = AI_GEMNAME
  s.version    = AI_VERSION
  s.author     = "Yuavl Rimar"
  s.email      = "yuval dot rimar at gmail dot com"
  s.homepage   = "http://ainekolabs.org"
  s.platform   = Gem::Platform::RUBY
  s.summary    = "Aineko personal automation platform"
  s.files      = FileList["{bin,docs,lib,test}/**/*"].exclude("rdoc").to_a
  s.bindir       = "bin"
  s.executables  = %w( ai )
  s.description       = "Aineko is used to run bots and agents"
  s.rubyforge_project = s.name
  s.require_path      = "lib"
  s.test_file         = "test/runtest.rb"
  s.has_rdoc          = true
  s.extra_rdoc_files  = ['README']
  s.add_dependency "git"
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

task :default => [:package]

task :test do
  ruby "test/runtest.rb"
end

task :install do
  puts `sudo gem install -l pkg/#{AI_GEMNAME}-#{AI_VERSION}.gem`
end

task :remove do
  puts `sudo gem uninstall -x #{AI_GEMNAME}`
end

CLEAN.include("pkg") 
