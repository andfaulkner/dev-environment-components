task default: %w[hello]

task :hello do
  puts "hello world!!"
end


namespace :task do
  desc 'Get a list of all tasks'
  task :tasks do
    puts Rake.application.tasks
  end
  desc 'Call a Rake task from a Rake task'
  task :testcallothertask do
        Rake::Task["multiply"].invoke(20, 20)
  end
end

desc 'Task to multiply two given numbers'
task :multiply, [:num1, :num2] do |task, args|
  puts "Total is #{args.num1 * args.num2}"
end

# aliasing tasks
task "-t" => :tasks

# RANDOM NOTE: you cannot sleep in a rake task