Decorator
=========


Draper gem
==========
*   adds an object-oriented layer of presentation logic
*   wrap models with presentation-related logic to organise & test presentation logic

Why?
----
*   presentation logic should not go in the model
*   it also shouldn't go in the view, because views are templates, & templates shouln't have logic
*   if it goes in a helper, it pollutes a global namespace shared by all helpers,
		views, & controllers, so this is hard to maintain
*   The view does not have access to the controller - it's a one-way render (generally)
*   so...where to put it?
		*   A: a decorator
