Creation
========
### Create nodes

Example

    CREATE (p:Dog { name: "Meeka Faulkner" })
    //      |  |   \_______________________/
    //      | label    |
    //      |  [!]     Add label + property (key-value pair)
    //      |
    //  Variable to reference this
    //  node later in the statement.

-   [!] label after node variable name = Node type

More examples:

    CREATE (p:Dog { name: "Callie Peeke" })
    CREATE (p:Dog { name: "Jake Gibeault" })

WARNING :: GENERALLY USE MERGE, IT WON'T CREATE DUPLICATES



----------------------------------------------------------------------------------------------------
Editing
=======

### Edit property on existing node

General syntax:

    MATCH (var:Label { key: 'value' })
    SET var.key2 = 'value2'
    RETURN var.key, var.key2

-   ...where:
    -   `var` can be anything - it's a placeholder variable for reference

Example:

    MATCH (n:Person { name: 'Meeka' })
    SET n.surname = 'Faulkner'
    RETURN n.name, n.surname



----------------------------------------------------------------------------------------------------
Deletion
--------

### Clear the DB - delete all nodes and relationships

    MATCH (n) DETACH DELETE n



----------------------------------------------------------------------------------------------------
Counting
--------

### Count all nodes

    MATCH (n)
    RETURN count(n)

### Count all relationships (edges)

    MATCH ()-->()
    RETURN count(*);



----------------------------------------------------------------------------------------------------
Metadata
--------

### List all node labels

    CALL db.labels()

### List all relationship types

    CALL db.relationshipTypes()



----------------------------------------------------------------------------------------------------
WHERE
=====
-   Filter out rows that don't meet the given conditions

### Example - only include rows where project user is 'guest'

    MATCH (p:Project)-[:HAS]->()
    WHERE p.user = 'guest'
    RETURN DISTINCT p.name as project_id, p.user;

### Example - only include rows where project user is NOT 'guest'

    MATCH (p:Project)-[:HAS]->()
    WHERE NOT p.user = 'guest'
    RETURN DISTINCT p.name as project_id, p.user;

-   Takehome here: You can't do `!=`, it doesn't work in Cypher.

### Example - only match on rows where branch = 'dev' and user isn't 'guest'

    MATCH (p:Project)-[:HAS]->()
    WHERE p.branch = 'dev' AND NOT p.user = 'guest'
    RETURN DISTINCT p.name as project_id, p.user;



----------------------------------------------------------------------------------------------------
MATCH
=====
-   "get" queries

Match on node
-------------

### Get all nodes with label

    MATCH (n:Tipbase)
    RETURN n;

### Limit to a certain number of results

    MATCH (n:Tipbase)
    RETURN n
    LIMIT 100;

### Get all nodes matching a given property

    MATCH (n { number_of_base_atoms: 11 })
    RETURN n;

-   Warning: don't do this, it has really poor performance. Always specify a label.

### Get all nodes with label matching a given property

    MATCH (n:Tipbase { number_of_base_atoms: 11 })
    RETURN n;

Match on relationship
---------------------

### Get all relationships of a given type, in any direction, between any 2 nodes

    MATCH ()-[r:HAS]-()
    RETURN r
    LIMIT 20;

----------------------------------------------------------------------------------------------------
DISTINCT
========
-   Only retrieve unique rows

----------------------------------------------------------------------------------------------------
WITH
====
Description
-----------
-   Lets you manipulate a query part's output before passing it on to other query parts.
-   i.e. allows chaining of fragments of statements together, like in a data-flow pipeline

-   Only columns declared in the WITH clause are available in subsequent query parts.

### Uses
-   WITH allows you to:
    -   Change data shape
    -   Sort data when paired with ORDER BY
    -   Modify the number of entries via:
        -   Aggregation - when paired with utilities like collect
        -   Limiting number of results - when paired with LIMIT
        -   Filtering
            -   ...including Filtering on aggregates when paired with WHERE

### Example

Code:

    MATCH (person:Person)-[:ACTED_IN]->(m:Movie)
    WITH person, count(*) AS appearances, collect(m.title) AS movies
    WHERE appearances > 1
    RETURN person.name, appearances, movies

Returns:

    | "Tom Hanks" | 2           | ["Cloud Atlas", "Forrest Gump"] |



----------------------------------------------------------------------------------------------------
UNWIND
------
-   Transform a list into a sequence of rows
-   Commonly used to:
    -   Make distinct lists
    -   Create data from parameter lists passed to the query


### Example - get list of all distinct git branches used by projects

    MATCH(p:Project)
    WITH collect(DISTINCT p.branch) as branches
    UNWIND branches AS branch_rows
    RETURN branch_rows;

Collection is created with only unique branch names via `collect(DISTINCT p.branch)`,
then "unwound" back into a list with `UNWIND branches AS branch_rows`

### Example - Use UNWIND on list-returning expression to create combined users & git branches

Code:

    MATCH(p:Project)
    WITH collect(p.branch) as branch,
         collect(p.user) as user
    UNWIND branch + user AS branch_and_user_rows
    RETURN DISTINCT branch_and_user_rows;

-   Creating an aggregate list using `branch + user AS branch_and_user_rows` still
    returns a list that can have UNWIND called on it.

Return values:
-   dev
-   max
-   guest
-   taittakatani
-   master
-   max_audit_sampling
-   karreemharrison


(Note: You'd never do this in real life)


----------------------------------------------------------------------------------------------------
FOREACH
-------
-   Used to update data
    -   e.g. executing update commands on elements in a path or on a list created by aggregation
-   Basically used only for updating, not executing additional queries



----------------------------------------------------------------------------------------------------
Collection functions
====================

keys()
------

count()
-------
-   Returns the number of values or rows.
-   2 variants:
    -   `count(*)` returns the number of matching rows
        -   includes rows returning null
    -   `count(expessionr)` returns the number of non-null values returned by an expression
        -   excludes rows returning null

### Count all non-null values

MATCH (n:Person)
RETURN count(n.age)

max()
-----
-   Returns the maximum value in a set of values


min()
-----
-   Returns the minimum value in a set of values


collect()
---------

reduce()
--------

exists()
--------
-   Only return rows where given property exists

### Example: Only returns projects where project field 'comments' exists (isn't NULL)

    MATCH (p:Project)-[h:HAS]->()
    WITH p
    WHERE exists(p.comments)
    RETURN p.name, p.comments;



----------------------------------------------------------------------------------------------------
String functions
================
toLower()
---------
-   Converts a string to lowercase

### Example: Convert project name to lowercase

Code:

    MATCH (p:Project)-[h:HAS]->()
    WITH p
    RETURN toLower(p.name);

Data:

    C111_1Layer_Cage_NoSym_Inverted
    C111_IPYR_Layer1_Rxn02
    ChessSmallPyramid_6

Returns:

    c111_1layer_cage_nosym_inverted
    c111_ipyr_layer1_rxn02
    chesssmallpyramid_6

toUpper()
---------
-   Identical to toLower (see above)




----------------------------------------------------------------------------------------------------
Create maps from rows
---------------------

### Example: Create map with git branch & type (always 'branch') for each project row

Code:

    MATCH(p:Project)
    WITH {branch: p.branch, type: 'branch'} as branch_map
    RETURN DISTINCT branch_map;

Returns:

    {type: "branch", branch: "dev"}
    {type: "branch", branch: "master"}
    {type: "branch", branch: "max_rsg_evolution"}


### Example: Create map with all unique combinations of user & branch for each project row

Code:

    MATCH(p:Project)
    WITH {branch: p.branch, user: p.user} as branch_user_map
    RETURN DISTINCT branch_user_map;

Returns:

    {branch: "dev", user: "kareemharrison"}
    {branch: "dev", user: "guest"}
    {branch: "master", user: "kareemharrison"}
    {branch: "dev", user: "ksayed"}



----------------------------------------------------------------------------------------------------
Keywords
========

UNION
UNWING
DETACH
CALL

Subclauses
----------
SKIP
LIMIT
YIELD
WHERE

Modifiers
---------
ASSERT
BY
ON

Operators
---------
STARTS / STARTS WITH
ENDS / ENDS WITH
CONTAINS
DISTINCT
AND
OR
NOT
XOR

