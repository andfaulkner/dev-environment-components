**********************************************************************************************
elasticsearch notes
===================
**********************************************************************************************
es terms
--------
###analyzed
*   broken down into searchable terms; including breaking into 'tokens'

###not_analyzed
*   did not go through any analysis process & is not broken down into tokens

### index:analyzed
*   setting index's value to analyzed for a field stores the analyzed form of the field in the db,
    rather than the pure form

### index:not_analyzed
*   field is still searchable, but didn't go thru any analysis, & isn't broken down into tokens

###store:true
*   field stored in index to later retrieve via selective loading when searching

###refresh
*   makes your documents available for search, but doesn't ensure they're written to persistent
    storage (it doesn't call fsync) & thus doesn't guarantee durability.

###flush (lucene commit)
*   a lucene commit is like elasticsearch's refresh, but it actually stores the documents.
*   flush forces a lucene commit. This is extremely expensive (slow, etc.).

---------------------------------------------------------------------------------------------------

Queries
=======

*   filters vs. queries:

    *   use filters for yes/no searches
    *   use filters to query exact values
    *   use queries for full text search
    *   use queries when result depends on a relevance score
    *   summary: grabbing individual cases should be done with filters;


* top level terms...

term query
----------

*   find documents with the exact term specified. Simple:

    {
      "query": {
        "term" : { "user" : "Kimchy" }
      }
    }

    *   Find documents containing the exact term "Kimchy"

bool query
----------

*   can contain:

    1. must
    2. must_not
    3. should
    4. minimum_should_match
    5: boost

* example:
    {
      "query": {
        "bool" : {
            "must" : {
                "term" : { "user" : "kimchy" }
            },
            "must_not" : {
                "range" : {
                    "age" : { "from" : 10, "to" : 20 }
                }
            },
            "should" : [
                {
                    "term" : { "tag" : "wow" }
                },
                {
                    "term" : { "tag" : "elasticsearch" }
                }
            ],
            "minimum_should_match" : 1,
            "boost" : 1.0
        }
      }
    }

    * in the above example:
        *   'user' must be 'kimchy'
        *   'age' must not be in the range of 10-20
        *   'tag' must contain 'wow' and/or 'elasticsearch
        *   matches with both 'wow' & 'elasticsearch' tag appear above those with only 1 of the 2

match_all query
---------------

* match all documents. Example:

    {
      query: {
        "match_all" : { }
      }
    }

    *   best used in combination with the filtered query


filtered query
--------------

*   used to combine another query with a filter.
*   If a query is not specified, it defaults to the match_all query
*   Multiple filters can be applied by wrapping them in a bool filter

*   example:

    {
      query: {
        "filtered": {
          "query": {
            "match": { "tweet": "full text search" }
          },
          "filter": {
            "range": { "created": { "gte": "now-1d/d" }}
          }
        }
      }
    }

* example 2:

		{
			query: {
			  "filtered": {
			    "query": { "match": { "tweet": "full text search" }},
			    "filter": {
			      "bool": {
			        "must": { "range": { "created": { "gte": "now - 1d / d" }}},
			        "should": [
			          { "term": { "featured": true }},
			          { "term": { "starred":  true }}
			        ],
			        "must_not": { "term": { "deleted": false }}
			      }
			    }
			  }
			}
		}


wildcard query
--------------


bool filter
-----------
*   filter that matches documents matching boolean combinations of other queries
*   Similar to Boolean query, except clauses are other filters