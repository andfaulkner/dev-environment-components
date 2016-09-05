
Shoes.app do
  # basic button
  button("Click me!") { alert("Good job.") }

  # stack of buttons
  stack {
    button "A bed of clams"
    button "A coalition of cheetahs"
    button "A gulp of swallows"
  }

  # stack of buttons with a margin
  stack(margin: 8) {
    button "A bed of clams"
    button "A coalition of cheetahs"
    button "A gulp of swallows"
  }

end