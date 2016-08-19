
puts 'yep'

# Methods for outputting commands to terminal and gradle
module ShellHelpers
  # run a system command, streaming the arguments into terminal while it runs
  # sys_cmd     {String}  bash/terminal command to run e.g. `./gradlew clean`
  # show_stdout {Boolean} if true, show output of command in a stream
  def sys_run(cmd)
    run_cmd = lambda do |sys_cmd|
      IO.popen(sys_cmd) do |io|
        while (line = io.gets)
          puts line if verbose
        end
      end
    end
    verbose ? (puts run_cmd.call cmd) : (run_cmd.call cmd)
  end

  # wrapper for calls to project-level gradle
  def gradlew(gradle_command)
    # inject infer compile-type analyzer into gradle commands
    base_command = "#{(ARGS.infer ? 'infer -- ' : '')} #{ROOT_DIR}/gradlew #{gradle_command}"
    puts base_command
    return sys_run("#{base_command} --stacktrace --debug") if ARGS.silly
    return sys_run("#{base_command} --stacktrace") if verbose
    if ARGS.lint
      sys_run("#{base_command} #{gradle_command}")
    else
      sys_run("#{base_command} #{gradle_command} -x lint")
    end
  end
end

# $$$$$$$$$ CONV
# run a system command, streaming the arguments into terminal while it runs
# sys_cmd     {String}  bash/terminal command to run e.g. `./gradlew clean`
# show_stdout {Boolean} if true, show output of command in a stream
def sys_run(cmd)
  run_cmd = lambda do |sys_cmd|
    IO.popen(sys_cmd) do |io|
      while (line = io.gets)
        puts line if verbose
      end
    end
  end
  verbose ? (puts run_cmd.call cmd) : (run_cmd.call cmd)
end

# $$$$$$$$$ CONV
# wrapper for calls to project-level gradle
def gradlew(gradle_command)
  # inject infer compile-type analyzer into gradle commands
  base_command = "#{(ARGS.infer ? 'infer -- ' : '')} #{ROOT_DIR}/gradlew #{gradle_command}"
  puts base_command
  return sys_run("#{base_command} --stacktrace --debug") if ARGS.silly
  return sys_run("#{base_command} --stacktrace") if verbose
  if ARGS.lint
    sys_run("#{base_command} #{gradle_command}")
  else
    sys_run("#{base_command} #{gradle_command} -x lint")
  end
end

# $$$$$$$$$ CONV
def section_title(title)
  puts "\n\n\n#{title.to_s.upcase}\n#{'-' * title.length}"
end

# $$$$$$$$$ CONV
# make multiline strings display in a sane manner
def unindent(s)
  s.gsub(/^#{s.scan(/^[ \t]+(?=\S)/).min}/, '')
end

# $$$$$$$$$ CONV
# block received will run with warnings suppressed
def suppress_warnings
  warn_level = $VERBOSE
  $VERBOSE = nil
  yield if block_given?
  $VERBOSE = warn_level
end

# Convenience methods for rake script logging
module Loggable
  def section_title(title)
    puts "\n\n\n#{title.to_s.upcase}\n#{'-' * title.length}"
  end

  # make multiline strings display in a sane manner
  def unindent(s)
    s.gsub(/^#{s.scan(/^[ \t]+(?=\S)/).min}/, '')
  end

  # block received will run with warnings suppressed
  def suppress_warnings
    warn_level = $VERBOSE
    $VERBOSE = nil
    yield if block_given?
    $VERBOSE = warn_level
  end
end
