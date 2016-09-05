require 'sysinfo'

class SystemInfo < DelegateClass(SysInfo)
	def initialize(instance_note, lock_info = false)
		@instance_note = instance_note
		@lock_info = false
	end
	def home_dir
		Dir.home
	end
	def cur_dir
		Dir.pwd
	end
end

sysinfo = SystemInfo.new("test initialization")

# TODO get this to launch

