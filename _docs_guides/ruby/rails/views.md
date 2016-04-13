#Location: app/views/**/*.html.erb
##Magic methods that can go into erb tags

###<%= %>
*   assigns return value of anything inside the braces to the location in the html document

###<% %>
*   executes Ruby code within the braces

###<%= link_to "Text", "relative/path/to/location" %>
*   create a link, pointing to relative/path/to/location, with text "Text"


### <nav>
*   formally unneccessary. Purpose: more clearly communicate the purpose of a set of nav links

### <div class="container">
*   special meaning to bootstrap (if you're using it)

### <%= image_tag("relative/path/to/img.png", alt: "alt text here", "http://www.root.path.com/") %>
*   create an image tag
*   path at the end is the path the relative path at he beginning is relative to
		*   optional

