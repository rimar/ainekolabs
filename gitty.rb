require 'rubygems'
require 'git'

class Gitty
	attr_reader :name
	def update(url)
		@name = url.split('/').last.delete(".git")
		# Add the directory where it's checked out to the load path
		$LOAD_PATH<<"./#{@name}" if !$LOAD_PATH.include?("./#{@name}")
		#FileUtils.mkdir_p(@name)
		#f = File.new("#{name}/#{@name}.rb", "w")
		#f.puts("puts(\"Executing file: #{@name}.rb\")")
		#f.close
		Git.
		$".delete("#{@name}.rb")

	end
end	
