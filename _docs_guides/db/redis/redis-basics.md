COMMANDS
========
## SET
		SET mykey "value of my key"

## GET
		GET mykey;

## DEL
*   delete a key; returns number of keys removed

		DEL mykey
		DEL mykey1 mykey2 mykey3

## KEYS
*   Search for keys - uses wildcards

		KEYS admin_user

*   returns list of all keys matching the query.
*   !!!!! don't use in production !!!!!!
	*   it is slow slow slow

	KEYS h?llo

*   matches hello, hallo, hillo, hhllo, hyllo, etc.

	KEYS h*llo

*   matches hello, hallo, herghrthrthillo, hhtreohjwrpighojrwtghllo, etc.

	KEYS h[a-d]llo

*   matches hallo, hbllo, hcllo, hdllo

	KEYS h[ae]llo

*   matches hallo, hello

	KEYS h[^e]llo

*	does not match hello, but matches hallo, hbllo, hcllo, hdllo, hfllo, hgllo, etc.

## MONITOR
*   View all commands received by redis - from all clients - as they arrive

## TYPE
*   get data type of a key

		TYPE mykey
		# => string

## EXPIRE 
*   set a key to disappear after the given number of seconds

		EXPIRE mykey 20

*   key will return (nil) after this happens. e.g. 21 seconds after previous command:

		GET mykey
		// => (nil)

## EXPIREAT
*   set a key to disappear when the given UNIX timestamp is reached

		EXPIREAT mykey 1293840000

## TTL
*   return amount of time left until a given key will expire
		TTL mykey
		// => 13

*   returns -2 if key has already expired
		TTL mykey
		// => -2

HASH COMMANDS
=============
##HSET
*   sets a single value in a hash. Cumulative - e.g.
		HSET myhash field1 "Hello"
*   ... will result in field1 remaining in myhash even after doing e.g.
		HSET myhash field2 "Aloha"

		Akin to 
		const myhash = {
			"field1": "Hello",
			"field2": "Aloha"
		}

##HGET
		HGET myhash field1

##HGETALL
		HGETALL	myhash

*   Don't do this, it's O(n), as opposed to HGET which is O(1)

##HEXISTS
*   see if specific hash exists

		HEXISTS myhash

*   see if hash has a specific field

		HEXISTS myhash field1

##HLEN
*   get length of hash


EXPIRING COMMANDS
=================
##EXPIRE
*   set an existing value to disappear in a given number of seconds; returns -2 after expiry

		EXPIRE myhash 30

##TTL
*   get amount of time until expiry

##EXPIREAT
*   expire given key when the given Unix timestamp is reached

		EXPIREAT mykey 1486052321


Nested data handling
====================
Two main strategies:
*   serialize your complex objects and store them as strings.
	*   json or msgpack is best as a serialization format.
	*   easy to manipulate from client-side languages.
	*   If server-side access is needed, a server-side Lua script can encode/decode such objects
		*   Redis is compiled with msgpack and json support for Lua.
-	split your objects into different keys.
	*   Instead of storing user:id & a complex data structure to the id, store several keys. e.g.
		*   user:id
		*   user:id:address_list
		*   user:id:document_lists
		*   etc.
	*   If you need atomicity, pipeline MULTI/EXEC blocks. This will:
		*   guarantee data consistency
		*   aggregate the roundtrips

TYPES
=====
*   see redis-data-types.md

