QUERIES
=======
*   Essentially a JS object consisting only of keys with no vals.
*   actual query data is a key-value pair in brackets next to the name of the type
    **  e.g. user(id: 1294) { ... }

1st example query
-----------------

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

### Response to example query

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

Queries can be nested
---------------------
{
  posts {
    title,
    author {
      name
    },
    summary,
    comments {
      content
    }
  }
}

Request a certain number of returned results
--------------------------------------------
{
  recentPosts(count: 5) {
    title,
    comments(limit: 1) {
      content
    }
  }
}

Multiple fields can be requested at once
----------------------------------------
{
  latestPost {
    title
  },
  authors {
    name
  }
}

Assign results into variables
-----------------------------
{
  latestPost: latestPost {
    title
  },
  authors: authors {
    _id,
    name
  },
  authorIds: authors {
    _id
  }
}

Mutations
=========

Fragments
=========
Fragments allow reuse of common sets of fields
----------------------------------------------
### Declaring fragments

    fragment authorInfo on Author {
      _id,
      name,
      twitterHandle
    }

### Running fragments
Fragments are "run" with ...fragmentName. E.g.

    {
        authors {
            ...authorInfo
        }
    }

This is the same as calling:
    {
        authors {
            _id,
            name,
            twitterHandle
        }
    }
