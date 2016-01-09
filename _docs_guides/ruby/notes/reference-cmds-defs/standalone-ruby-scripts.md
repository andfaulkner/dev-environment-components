Writing Standalone Ruby Scripts
===============================

-   ...aka writing scripts that can be run without 'ruby' as the 1st terminal command
-   simple to implement - add this to the top of the file:

<<<<<<< HEAD
		#!/usr/bin/ruby
=======
		#!/usr/local/bin/ruby
>>>>>>> 11577ce428cdac2cf57847116b2ee6b431bbd597

(I've built an abstraction for this: rubify)