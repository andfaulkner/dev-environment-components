Shoes.app do
  @push = button "Push me"
  @note = para "Nothing pushed yet..."
  @push.click {
    @note.replace "button clicked!"
  }

  stack {
    # create tiny rectangle that hovers below the mouse
    @rect_width = 10
    @block = rect(width: @rect_width)
    motion do |left, top|
      @block.move left - (@rect_width/2), top + (-35 - (@rect_width / 2))
    end
  }
end