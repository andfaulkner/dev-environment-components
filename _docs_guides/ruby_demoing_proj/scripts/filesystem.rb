# require './testables/mixins/mixins' # always relative to root file app launched from

class FilesystemExtras
	def self.cur_dir_files
		self.dir_content
	end

end