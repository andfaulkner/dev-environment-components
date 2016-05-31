module AccessPrivateMethods
  # includes SomeModule # mixins

  # attr_accessor :name_of_accessor # accessors

  # class methods here

  # instance methods here

  # private methods here
  private
  def secret_hello
    puts "shh...youre not supposed to hear my hello"
  end

end


class Yo
  include AccessPrivateMethods
end

yo = Yo.new.send(:secret_hello)

