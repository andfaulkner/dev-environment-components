# Wrap apps in Shoes.app:
 # Shoes.app { button("Click me!") { alert("Good job.") } }

# OR...

Shoes.app do
  background "#DFA" # paint the background this colour
  para "Welcome to Shoes"
  alert "Here we are!"
  my_name = ask "what's your name?"

  stack {
    # groups things
    fill red
    button "OK"
    button "not OK"
    # both are now red
  }
end
