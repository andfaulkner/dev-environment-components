
###Ladda
*   A UI concept which merges loading indicators into the action that invoked them.
*   isight uses it in via the jQuery.ladda library

## Secret (auth, Connect auth in particular, but encryption in general)
*   Essentially salt for the hash

###Serialization
*   converting an object into a stream of bytes in order to store the object or transmit
    it to memory, a database, or a file. Its main purpose is to save the state of an object
    in order to be able to recreate it when needed. The reverse process is called deserialization.

### Etag
*   opaque identifier assigned by a web server to a specific version of a resource found at
		a URL. If the resource representation at that URL ever changes, a new and different ETag
		is assigned. Used in this manner ETags are similar to fingerprints, and they can be
		quickly compared to determine whether two representations of a resource are the same.

### Mutex
*	program object that allows multiple program threads to share the same resource, such as file
	access, but not simultaneously. When a program is started, a mutex is created with a unique name

*   Perfect answer on SO:
	When I am having a big heated discussion at work, I use a rubber chicken which I keep in my
	desk for just such occasions. The person holding the chicken is the only person who is allowed
	to talk. If you don't hold the chicken you cannot speak. You can only indicate that you want
	the chicken and wait until you get it before you speak. Once you have finished speaking, you
	can hand the chicken back to the moderator who will hand it to the next person to speak. This
	ensures that people do not speak over each other, and also have their own space to talk.
	Replace Chicken with Mutex and person with thread and you basically have the concept of a mutex.
	Read this at office: http://stackoverflow.com/questions/34524/what-is-a-mutex

*   key point: a mutually exclusive flag. The flag gets set when the resource gets accessed
	by a thread, and unset when the thread stops accessing it. It is not possible to access the
	resource while the flag is set. The mutex is the flag.