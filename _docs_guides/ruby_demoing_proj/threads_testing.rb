require "thread"

queue = Queue.new

thr = Thread.new { sleep 2; puts "Whats the big deal" }.join

producer = Thread.new do
  5.times do |i|
     sleep rand(i) # simulate expense
     queue << i
     puts "#{i} produced"
  end
end

consumer = Thread.new do
  5.times do |i|
     value = queue.pop
     sleep rand(i/2) # simulate expense
     puts "consumed #{value}"
  end
end.join

# note: anywhere you use join, it will wait for the thread to finish before continuing regular control flow