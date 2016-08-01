DEFINITION
==========
*   GraphQL: an application layer query language, which queries and mutates (or updates) data.
    *   not tied to a database
*   consists of:
    *   a type system
    *   a query language and execution semantics
    *   static validation
    *   type introspection

SHORTHAND
=========

Defining a type (shorthand)
---------------------------

    type Human {
      id: String
      name: String
      homePlanet: String
    }

Defining an enum (shorthand)
----------------------------

    enum Episode { NEWHOPE, EMPIRE, JEDI, AWAKENS }

Defining an interface (shorthand)
---------------------------------

    interface Character {
      id: String
      name: String
      friends: [Character]
      appearsIn: [Episode]
    }

Using an interface with a type (shorthand)
------------------------------------------

    type Human : Character {
      id: String
      name: String
      friends: [Character]
      appearsIn: [Episode]
      homePlanet: String
    }

Non-nullable fields
-------------------
    
    interface Character {
      id: String!          <<< str ends w/ !, so id can't be null. Any not ending in ! are nullable.
      ...
    }





QUERIES
=======
*   Essentially a JS object consisting only of keys with no vals.
*   actual query data is a key-value pair in brackets next to the name of the type
    **  e.g. user(id: 1294) { ... }

##Example Query

{
  user(id: 3500401) {
    id,
    name,
    isViewerFriend,
    profilePicture(size: 50)  {
      uri,
      width,
      height
    }
  }
}

##Response to example query

{
  "user" : {
    "id": 3500401,
    "name": "Jing Chen",
    "isViewerFriend": true,
    "profilePicture": {
      "uri": "http://someurl.cdn/pic.jpg",
      "width": 50,
      "height": 50
    }
  }
}

