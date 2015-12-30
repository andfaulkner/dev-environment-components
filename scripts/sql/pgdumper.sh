#!/bin/sh
function dumpdb {
	mkdir data/db_dump
	pg_dump > data/db_dump/sqldump1.sql
}

function wipedb {
	psql isight << EOF
		DROP TABLE IF EXISTS core_schemaversion;
		DROP TABLE IF EXISTS schemaversion;
		DROP TABLE IF EXISTS sys_case;
		DROP TABLE IF EXISTS sys_account;
		DROP TABLE IF EXISTS sys_attachment;
		DROP TABLE IF EXISTS sys_case_link;
		DROP TABLE IF EXISTS sys_casesubstatus;
		DROP TABLE IF EXISTS sys_entity;
		DROP TABLE IF EXISTS sys_comment;
		DROP TABLE IF EXISTS sys_custom_fields;
		DROP TABLE IF EXISTS sys_document;
		DROP TABLE IF EXISTS sys_email;
		DROP TABLE IF EXISTS sys_emailtemplate;
		DROP TABLE IF EXISTS sys_escalation;
		DROP TABLE IF EXISTS sys_event;
		DROP TABLE IF EXISTS sys_field;
		DROP TABLE IF EXISTS sys_filter;
		DROP TABLE IF EXISTS sys_holiday_entry;
		DROP TABLE IF EXISTS sys_listitem;
		DROP TABLE IF EXISTS sys_log;
		DROP TABLE IF EXISTS sys_login;
		DROP TABLE IF EXISTS sys_note;
		DROP TABLE IF EXISTS sys_notification;
		DROP TABLE IF EXISTS sys_party;
		DROP TABLE IF EXISTS sys_project;
		DROP TABLE IF EXISTS sys_reset;
		DROP TABLE IF EXISTS sys_response;
		DROP TABLE IF EXISTS sys_searches;
		DROP TABLE IF EXISTS sys_settings;
		DROP TABLE IF EXISTS sys_template;
		DROP TABLE IF EXISTS sys_todo;
		DROP TABLE IF EXISTS sys_translation;
		DROP TABLE IF EXISTS sys_trigger;
		DROP TABLE IF EXISTS sys_user;
	EOF
}

#rebuilds and tests db for presence of data
function rebuilddb {
	psql -f data/db_dump/sqldump1.sql isight
	psql isight << EOF
		SELECT * from sys_case
	EOF
}
