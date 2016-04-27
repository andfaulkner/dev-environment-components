module ShellInterop
    def run_shell_cmd cmd
        shell_input = Shellwords.shellsplit(cmd).join(' ')
        shell_multi_cmds = shell_input.split(";")
        shell_multi_cmds.each_with_index {|cur_cmd, index|
            puts "\n______________________________"
            puts "COMMAND #{index}: #{cur_cmd}\n"
            puts %x( #{cur_cmd} ).split("\n")
            puts "______________________________\n"
        }
        #puts shell_multi_cmds
        #%x( #{shell_input} ).split("\n")
    end
end

