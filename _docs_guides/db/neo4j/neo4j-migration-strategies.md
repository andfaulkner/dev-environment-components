Progress report
===============
- Connected to Neo4j in Node.js
- Programmatically created a Neo4j data node
- Returned data from Neo4j


----------------------------------------------------------------------------------------------------
Migration to Neo4j notes
========================
Strategies
----------
### Conversion - should run a script that performs the conversion in a one-off
1.  Use a conversion tool (fully or partially)
    -   1.  Create foreign key relations in DB before migrating, so relationships are generated
    -   2.  Manually create relationships after conversion tool adds all base data to nodes
            -   This is actually my vote because it makes data loss the least likely

2.  Write manually from scratch? Script to pull data from SQL then feed it to Neo4j appropriately
    -   1.  Just put the must-have data in, get a MVP working, gradually convert all SQL calls to
            Cypher calls, loading data into Neo4J as needed on a per-call basis
            -   Continue calling SQL indefinitely, until all are replaced
            -   Problematic, because data can end up being stored in Neo4J but retrieved
                from SQL; or vice versa
    -   2.  Do it all in one go, waterfall style
            -   To make this easier: write an entire "framework" manually for doing basic operations,
                set it up such that calls that previously went to SQL instead go to Neo4J and return
                equivalent data

##### Confirmation
-   For each location SQL is called, write a matching Cypher query (suggested by Tomass)
    -   Ensure the 2 match before getting rid of the SQL code


----------------------------------------------------------------------------------------------------
Wrapper - needed concrete functions
===================================
- Get all tooltips project CAN_USE

Wrapper - needed abstract functions
===================================
Needed queries
--------------
- Get all nodes of type [label]
- Get all nodes of type [label] with matching [properties] - i.e. matching [label:properties]
- Get all nodes with matching [label1:properties] that have matching [relationship type] connecting
  them to any node matching [label2]

- Get all nodes matching [label1:properties] with matching incoming [relationship type] from node matching [label2]
- Get all nodes matching [label:properties] with no incoming relationships of given [type]
- Given node [s_label:properties], get all target nodes of type [t_label] pointed to by given [relationship type]
    e.g. something like:
        MATCH (s:ProjectInfo {id: "some_id"})-[:HAS_START]->(t:Surface)
        RETURN t

- Get all relationships of type [label]


----------------------------------------------------------------------------------------------------
Needed CREATE syntax
--------------------
- Create node with [label]
- Create node with [label] + properties
- Create relationship between node with [label_1:properties_1] and node with [label_2:properties_2]

Needed SET syntax
-----------------
- Get node of type [label] with given match property/ies, set given value property(ies)

