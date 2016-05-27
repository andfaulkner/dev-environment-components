module FileHandlers
	def self.cur_dir
		Dir.pwd
	end
	def self.dir_content(dir = Dir.pwd)
		Dir.glob("#{dir}/*.*")
	end
end