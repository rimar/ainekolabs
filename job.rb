require 'yaml'

class Job
  START=0
  STOP=1
  attr_accessor :name, :command, :urls
  def initialize(name, command, urls) 
    @name = name
    @command = command
    @urls = urls 
  end

end
