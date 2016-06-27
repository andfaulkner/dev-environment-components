puts "got patches!"

class String
  def drop_first(number=1)
    if number.kind_of? Integer
      if number == 1
        self[0] = ''
      else
        number.times { self[0] = '' }
      end
    else
      raise "wrong argument type in String#drop_first: argument \"integer\" must be an Integer."
    end
    self
  end
end

class NilClass
  def falsy?
    true
  end
  def truthy?
    false
  end
end