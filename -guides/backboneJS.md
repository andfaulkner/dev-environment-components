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

##Surrogate key (in a database)
*   unique identifier for either an entity in the modeled world or an object in the database
*   by definition it is not derived from application data (unlike a 'business key', which is)
*   in practice: key identifying a specific row in a table.
*   Surrogate keys do not change while the row exists
*

##Natural key / business key
*   key formed of attributes already in a data row in a database. 
*   A surrogate key is generally a generated uuid, whereas a natural key is created from attributes 
    of the row - either a conglomerate of bits of data from multiple columns, from a particular
    column that acts as an effective identifier (e.g. someone's SIN number), etc..
*   No special 'primary key' column required

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

###initialize
*   initialize (no params) function triggered when new model instance created e.g.

      var BearData = Backbone.Model.extend({
  	      //Called on new BearData
  	      initialize: function initialize(){ 
              console.log('\'dummy\' BearData initialized!');
  	      }
      });

      var meekaBearData = new BearData();    //--> output: 'dummy BearData initialized'

###initialize with attributes / data
*   set initial attributes on model, during instantiation.
*   example:

        var meekaBearData = new BearData({ 
  	      firstName: 'Meeka',
  	      lastName: 'PeekaFaulkner'
        }); 

    *   now meekaBearData has firstName and lastName attributes set.

###Model.set({ data: 'data', ... })
*   set attributes on an existing model
*   example:

      meekaBearData.set({ 
      	'favoriteBear': 'Sun Bear',
      	'colour': 'black',
  	    'rar': true
      });

    *   now meekaBearData also has properties 'favoriteBear', 'colour', and 'rar' set.

###Model.get('nameOfDataItem')
*   get attributes previously set on the model
*   example:

        meekaBearData.get('favoriteBear'); //--> will return 'Sun Bear'


###Model.defaults: { }
*   Set default values for data entity stored by the model
*   example:

    var BearData = Backbone.Model.extend({

        //Values model instance will have if no attributes declared
        defaults: {
  	        firstName: '',
  	        lastName: '',
      	    colour: 'brown',
  	        favoriteBear: 'Grizzly',
  	        rar: false
        },

        initialize: function initialize(){
            //initialization code here
        }
    });

    var mostlyDefaultBearData = new BearData({ firstName: 'Meekamoo' });
    mostlyDefaultBearData.get('firstName');  //--> 'Meekamoo'
    mostlyDefaultBearData.get('favoriteBear');  //--> 'Grizzly'

###Custom model methods
*   put as many there as you want, and call them whatever you want.
        
###Model.on()
*   register change events.
*   can be registered anywhere - preferably in the initialization sequence, however.
*   example:

				//... in model definition i.e. Backbone.Model.extend({
				Backbone.Model.extend({
  		              //... extra model definition code in here e.g. defaults
            initialize: function(){
                this.on('change:favoriteBear', function(model){
                    var favoriteBear = model.get('favoriteBear');
                    console.log('favourite bear has been changed to: ' + favoriteBear)
                });
            }
                    //... rest of model definition
        });

        var meekaPeekaBearData = new BearData({ firstName: 'Meeka', lastName: 'Peeka' });
        meekaPeekaBearData.set({ favoriteBear: 'Sun Bear' }); 
            //--> favoriteBear has been changed to: Sun Bear


  var meekaPeekaBearData = new BearData({ firstName: 'Meeka', lastName: 'Peeka' });
  console.log(meekaPeekaBearData.get('firstName'));
  meekaPeekaBearData.set({ favoriteBear: 'Sun Bear' });


Backbone.Collection
-------------------
*   simply an ordered set of models
	*    or...manages a set of models
*   also syncs with REST services
*   examples (conceptual):

        Model: Animal;    Collection: Zoo
        Model: Todo Item; Collection: Todo list

*   models can go in more than one type of collection:

        Model: Student;   Collection: Gym Class
        Model: Student;   Collection: Art Class
        Model: Student;   Collection: English Class

*   ...but collections typically have only one type of model.


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
Misc Notes
==========

Calls to super
--------------
*   when overriding a core Backbone method, call this after your custom code:

        Backbone.View.prototype.initialize.call(this)

    *   Result: you run the method of the same name on the parent object from which your own 
        Backbone object inherited

*   full example:

        var MyModel = Backbone.Model.extend({
            initialize: function() {
                // custom code here
                Backbone.View.prototype.initialize.call(this); //runs Backbone.Model initialize fn
            }
        });


Plugins
=======
backbone-route-control
----------------------







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