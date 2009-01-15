class Git
	def update(url)
		puts "#{url}"
		return `git clone #{url}`
	end
end	
