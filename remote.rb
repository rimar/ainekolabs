require 'job'

class Remote
    def register

    end

    def getJobs
        job1 = Job.new("/tmp/z")
        job2 = Job.new("/tmp/y")
        return [job1, job2]
    end

    def reportStatistics

    end
end

