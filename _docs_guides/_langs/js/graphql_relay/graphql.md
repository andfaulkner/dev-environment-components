DEFINITIONS
===========
*   GraphQL: an application layer query language, which queries and mutates (or updates) data.
    *   not tied to a database
*   consists of:
    *   a type system
    *   a query language and execution semantics
    *   static validation
    *   type introspection

Type system
===========
*   near-identical to Typescript


SHORTHAND - SCHEMAS
===================

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


