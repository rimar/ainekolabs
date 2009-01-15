require 'fileutils'
require 'remote'
require 'gitb'

class Client
    def initialize
        @remote = Remote.new
		@git = Git.new
    end
	def main
	    @remote.register
        j = @remote.getJobs
        for job in j do
			# Use the last part of the url as the name
			name = job.url.split('/').last
			# Add the directory where it's checked out to the load path
			$LOAD_PATH<<"./#{name}" if !$LOAD_PATH.include?("./#{name}")
			FileUtils.mkdir_p(name)
			f = File.new("#{name}/#{name}.rb", "w")
			f.puts("puts(\"name=#{name}\")")
			f.close
			$".delete("#{name}.rb")
			require name

            #puts @git.update(job.url)

        end
		@remote.reportStatistics
    end
end



#if $0 == __FILE__
	c = Client.new
	c.main
#end

