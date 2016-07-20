desc 'list all tasks'
task "tsk" do
  puts Rake.application.tasks
end