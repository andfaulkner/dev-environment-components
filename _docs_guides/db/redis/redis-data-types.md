STRING
======
*   Sequence of binary safe bytes up to 512 MB.

### Data example
	Key: "name"
	value: "bob"

HASH
====
*   Collection of key value pairs.

### Data example
	Key:   "accountInfo:5531"
	Value: "name"       => "bob smith"
	       "username"   => "ultimate bob"
	       "loginCount" => "3691"
	       "signup"     => "1381254812"
	       "isAdmin"    => "false"

### Operations - overview

### Operations - how-to
*   Set multiple fields of a hash
hmset user:1000 username antirez birthyear 1977 verified 1

SET
===
*   Collection of unique strings with no ordering.
*   Fast for membership checking, insertion, and deletion of members.

### Operations -
*   Can take the union, intersection, and difference of multiple sets at once.
*   Results can be returned to caller, or can be stored in a new set for later use.

### Data example
	Key: "adminUsers"
	Value: ("bob", "ralph", "jose", "loa")

	Key: "bannedUids"
	Value: ("332", "4096", "271", "737199492")

	Key: "forbiddenUsernames"
	Value: ("boogie", "bogus", "fake", "cybercommander", "improv", "gandalf", "oberoth")

	Key: "uniqueVisitors"
	Val: ("127.0.0.1", "63.23.221.7", "4.2.2.2", "8.8.8.8")


LIST
====
*   In-insertion-order collection of strings.

### Operations

### Data example
	Key: "processURLsNext"
	Value: ["http://google.com/", "http://theonion.com", "http://redis.io"]

	Key: "userTimeline:userId:312"
	Value: ["swimming away from park",
			"Whoops, park on fire",
			"Toasting marshmallows",
			"At park (it's cold!)"]

### SUBTYPE: CAPPED LIST

SORTED SET
==========
*   Collection of unique strings ordered by user defined scoring.

### Operations

### Data example
