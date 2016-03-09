COMMANDS
========

##SET
		SET mykey "value of my key"

##GET
		GET mykey;

##DEL
*   delete a key; returns number of keys removed

		DEL mykey
		DEL mykey1 mykey2 mykey3

##KEYS
*   Search for keys - uses wildcards

		KEYS admin_user

*   returns list of all keys matching the query.
*   don't use in production!!!

##TYPE
*   get data type of a key

		TYPE mykey
					# => string

HASH COMMANDS
=============

##HSET
*   sets a single value in a hash. Cumulative - e.g.
		HSET myhash field1 "Hello"
*   ... will result in field1 remaining in myhash even after doing e.g.
		HSET myhash field2 "Aloha"

##HGET
		HGET myhash field1

##HGETALL
		HGETALL	myhash

##HEXISTS
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


Persist data
============

##BGSAVE
*   save the contents to disk