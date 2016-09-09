
Shoes.app do
  background white
  oval(left: 10,
       top: 10,
       radius: 40) # black oval: defaults are always black
  stack {
    fill red
    rect(left: 50,
         top: 10,
         width: 40) # red because we styled everything in the stack red. Also, overlaps the oval.
  }
  # horizontal line, 90 pixels wide: ---------
  @line = line(10, 10, 100, 10)

  # deprecated: stars, arrows

end