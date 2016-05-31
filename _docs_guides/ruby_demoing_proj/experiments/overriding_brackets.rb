class OverridingBrackets

  attr_reader :items # accessors

  def initialize
    @items = {}  
  end

  def [](index)
    @items[index] || "Not Found"
  end

  def []=(index, value)
     puts "Storing: #{value} at #{index}!"
    @items[index] = value
  end

  def to_s
    @items.each {|item|
      puts item
    }
  end

end

overrider = OverridingBrackets.new
overrider[:asdf]="ok!"
puts overrider.to_s

puts OverridingBrackets.to_s