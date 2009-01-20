class Job
  START=0
  STOP=1
  attr_accessor :urls, :command
  def initialize(command, urls) 
    @command = command
    @urls = urls 
  end
end
