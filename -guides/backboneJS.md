**********************************************************************************************
BackboneJS notes
===================
**********************************************************************************************

*   [Annotated source](http://backbonejs.org/docs/backbone.html)
*   [Why use Backbone?](http://beletsky.net/2012/09/why-use-backbonejs.html)
*   [Intro to Backbone](http://www.clock.co.uk/blog/an-introduction-to-backbonejs)
*   [Pragmatic backbone - must-read](http://pragmatic-backbone.com/)

----------------------------------------------------------------------------------------------
Definitions
===========
##Model
manages an internal table of data attributes.  Triggers 'change' events when any of its
data are modified. Handles syncing of data w/ a persistence layer: usually a db-backed RESTApi

##View
Atomic 'chunk' of UI.  Can either:
    1.   render the data from a specific model or number of models
    2.   be a dataless standalone chunk of UI
Should listen for model 'change' events, then re-render itself
* this & view are only 2 essential parts

##Collection
Helper / handler for dealing with groups of related models.
Handles loading & saving of new models to server
Provides helper functions for performing aggregations or computations against a list of models


----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
Components
==========

Backbone.View
-------------
*   connects a model or collection to its representation in the HTML DOM
*   essentially a set of components for displaying a model or a collection

*   can use other Views, but should not RELY on other Views
    *   rendering a view on its own should never cause issues, even if all others are missing

###this.render
*   render method should be the only piece of the view that interacts with the DOM
    *   if data in the model changes, just re-render the view.

*   should be a "destructive" operation that completely replaces the previous contents of the DOM
    *   no appending data with calls to this.render
	    *   calling this.render repeatedly should not break the view


###this.template
*   defines the template, into which (when this.render is run) the model (this.model or
    this.collection) is passed to generate the markup to insert at the View's defined
    DOM location (e.g. this.$el).
    *   really the whole process is just the following (within this.render):

            this.$el.html(this.template(this.model));

    *   put another way (not code, but more visual):

            (model => template) --output--> $el

Backbone.Model
--------------
*   stores application data
*   syncs with REST services
*   should have no awareness of Views whatsoever
    *    communication with views should be done by emitting events


Backbone.Collection
-------------------
*   Manages a set of models
*   also syncs with REST services


Backbone.Router (RESTful resources)
-----------------------------------
*   provides methods for routing client-side pages, and connecting them to actions and events
*

Backbone.history
----------------
*   serves as a global router (per frame) to:

    1.   handle hashchange events or pushState
    2.   match the appropriate route; and
    3.   trigger callbacks


###Backbone.history.start
*   must be called to start the application - nothing will run otherwise


Presenter
---------
*   NOT PART OF BACKBONE  -  this is a concept
*   special type of object - wrapper for model/collection
*   contains solely presentation-related logic
*   instantiated by passing in a Model; after which the Presenter instance is passed to a view
*   Model --> Presenter --> View

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
Existing events
===============


----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

Api
===

Backbone.View
-------------
*   connects a model to its representation in the HTML DOM


Components
==========



----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

Tips
====