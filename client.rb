require 'remote'
require 'gitty'

class Client
  def main
    @remote = Remote.new
    @remote.register
    j = @remote.getJobs
    for job in j do
      JobStarter.new.startJob(job)
    end
    @remote.reportStatistics
  end
end

class JobStarter
  def startJob(job)
    @all = {}
    initAll(job)
    introduceAll
    startAll

    puts "DEBUG: " + @all.to_s
  end

  def initAll(job)
    # Load the bots and agents from their gits
    for key in job.urls.keys
      url = job.urls[key]
      puts("url=" + url)
      git = Gitty.new(url)
      updated = git.update
      require git.name
      loaded = init()
      @all[key] = loaded
    end
  end
  def introduceAll
    # Introduce between bots and agents if they want to
    for key in @all.keys
      bot = @all[key]
      if (bot.respond_to?('introduce'))
        for otherKey in @all.keys
          if (key != otherKey)
            bot.introduce(key, @all[key])
          end
        end
      end
    end
  end
  def startAll
    for key in @all.keys
      bot = @all[key]

      if (bot.respond_to?('start'))
        bot.start
      end
    end
  end

end

if $0 == __FILE__
  c = Client.new
  c.main
end

