Shoes.app do

  # paragraphs. Basically for text.
  para strong("Q."), "Are you beginning to grasp hold of Shoes?"

  # stacks - can be styled in a group
  stack(margin_left: 20, margin_top: 20) {
    button "hello everyone!"
  }

  # flow: keeps things side-by-side.
  flow(margin_left: 20, margin_top: 60) {
    edit_line
    button "OK" # will appear to the right of edit_line
  }

end