Persist data
============
*   2 major types of persistence: RDB and AOF

Redis persistence type 1: RDB
-----------------------------
*   RDB persistence performs point-in-time snapshots of your dataset at specified intervals
*   very compact single-file point-in-time representation of your Redis data
*   perfect for backups
	*   very good for disaster recovery
*   allows faster restarts with big datasets compared to AOF
*   issue: less durable

Redis persistence type 2: AOF
-----------------------------
*   logs every write operation received by the server
	*   plays them again at server startup

## BGSAVE
*   save the contents to disk via a background process

## SAVE
*   save the contents to disk via a foreground process
