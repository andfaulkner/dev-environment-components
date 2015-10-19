#!/bin/sh
function dumpdb {
	mkdir data/db_dump
	pg_dump > data/db_dump/sqldump1.sql
}

#rebuilds and tests db for presence of data
function rebuilddb {
	psql -f data/db_dump/sqldump1.sql isight
	psql isight << EOF
		SELECT * from sys/case
	EOF
}