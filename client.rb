require 'remote'
require 'gitty'

class Client
  def main
    @remote = Remote.new
    @remote.register
    j = @remote.getJobs
    for job in j do
      git = Gitty.new(job.url)
      updated = git.update
      require git.name
    end
    @remote.reportStatistics
  end
end



if $0 == __FILE__
  c = Client.new
  c.main
end

