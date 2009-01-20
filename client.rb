require 'remote'
require 'gitty'

class Client
  def main
    @remote = Remote.new
    @remote.register
    j = @remote.getJobs
    for job in j do
      for url in job.urls
        git = Gitty.new(url)
        updated = git.update
        require git.name
      end
    end
    @remote.reportStatistics
  end
end



if $0 == __FILE__
  c = Client.new
  c.main
end

