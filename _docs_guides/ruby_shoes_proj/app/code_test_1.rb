oval(left: 10, top: 10, radius: 40)
button TEST_CONSTANT

Draw = self

Draw.stack(margin_left: 20, margin_top: 20) {
  Draw.button "hello everyone!"
}

class Badass
  def initialize(d)
    puts "badass works!"
    d.stack(margin_left: 40, margin_top: 50) {
      d.button "yo yo yo"
    }
  end
end

Badass.new(self)

# second method of launching class with access to Shoes. Note that the capital letter is
# important in "Draw." Using draw = self then referencing draw.stack etc. doesn't work.
# Note that Draw can be any name, it was chosen arbitrarily.
class BadassTwo
  def initialize
    puts "badassTwo works!"
    Draw.stack(margin_left: 60, margin_top: 70) {
      Draw.button "yo homeslice I be worksin too ya"
    }
  end
end

BadassTwo.new