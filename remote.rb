require 'job'

class Remote
    def register

    end

    def getJobs
        job1 = Job.new("git://x/z")
        job2 = Job.new("git://x/y")
        return [job1, job2]
    end

    def reportStatistics

    end
end

