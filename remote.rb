require 'job'

class Remote
  def register

  end

  def getJobs
    [Job.new(Job::START, ["/tmp/z","/tmp/y"])]
  end

  def reportStatistics

  end
end

