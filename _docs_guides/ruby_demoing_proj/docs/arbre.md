# Consider arbre to make html in ruby syntax is regular ruby files
# Arbre: 	https://github.com/activeadmin/arbre
# e.g. use:

``` ruby
html = Arbre::Context.new do
  h2 "Why is Arbre awesome?"

  ul do
    li "The DOM is implemented in ruby"
    li "You can create object oriented views"
    li "Templates suck"
  end
end

puts html.to_s # =>
```
