--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.1
-- Started on 2014-03-24 16:38:19 GMT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;



SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

-- manage schema upgrades

DROP TABLE IF EXISTS schemaversion;

CREATE TABLE schemaversion (
    version integer NOT NULL,
    name text DEFAULT ''::text,
    md5 text DEFAULT ''::text
);

DROP TABLE IF EXISTS sys_user CASCADE;

CREATE TABLE sys_user
(
  id character varying NOT NULL,
  nick character varying,
  email character varying,
  name character varying,
  first_name character varying,
  last_name character varying,
  saml_id character varying,
  service json,
  active boolean,
  "when" timestamp with time zone,
  confirmed boolean,
  confirmcode character varying,
  salt character varying,
  pass character varying,
  dateregistered timestamp with time zone,
  admin boolean,
  perm json,
  roles character varying[],
  locale character varying,
  rounds character varying,
  sso_user boolean,
  yellowfin_hash character varying,
  yellowfin_salt character varying,
  yellowfin_username character varying,
  phone character varying,
  fax character varying,
  signature character varying,

  -- TODO Remove from platform
  alignment_region character varying,

  -- Standard Fields
  created_by character varying,
  created_date timestamp with time zone,
  last_updated_by character varying,
  last_updated_date timestamp with time zone,

  CONSTRAINT pk_sys_user_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);



DROP TABLE IF EXISTS sys_case CASCADE;

CREATE TABLE sys_case
(
  id character varying NOT NULL,
  case_number character varying NOT NULL,
  close_reason character varying,
  reopen_reason character varying,
  cancel_date timestamp with time zone,
  cancel_reason character varying,
  case_status character varying,
  case_type character varying,
  parent character varying,
  date_recorded timestamp with time zone,
  reported_by character varying,
  investigative_team_members character varying[],
  user_blacklist character varying[],
  data_source character varying,
  assigned_by character varying,   --represents the user who reassigns the case
  assigned_to character varying,   --represents the user whom the case is reassigned to
  assignment_status character varying, --represents current assignment status
  owner character varying, --owner of the case
  owner_name character varying, --owner name of the case
  decline_reason character varying, --reason for user declining a case
  reassign_reason character varying, --reassign reason set by assignor
  date_ownership_decision timestamp with time zone, --set when ownership decision was made
  is_active_record boolean,
  reported_by_name character varying,

  -- create case by email specific
  case_source character varying,
  case_email json,

  category_level1  character varying,
  category_level2  character varying,
  category_level3  character varying,
  case_title  character varying,

  reopen_date timestamp with time zone,
  date_assigned timestamp with time zone, --represents the date when user assign/reassign case
  date_closed timestamp with time zone,
  dateReclosed timestamp with time zone,
  system_blacklist character varying [],

  -- Standard Fields
  created_by character varying,
  created_date timestamp with time zone,
  last_updated_by character varying,
	last_updated_by_name character varying,
  last_updated_date timestamp with time zone,

  CONSTRAINT pk_sys_case_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);


DROP TABLE IF EXISTS sys_todo CASCADE;

CREATE TABLE sys_todo
(
  id character varying NOT NULL,
  case_id character varying,
  case_type character varying,
  case_data json,
  assigned_by character varying,
  assigned_by_name character varying,
  responsible character varying,
  responsible_name character varying,
  date_completed timestamp with time zone,
  date_accepted timestamp with time zone,
  is_active_record boolean,
  number character varying,
  case_number character varying,
  details character varying,
  due timestamp with time zone,
  email_reminder integer,
	active_reminder character varying,
  todo_type character varying,
  other character varying,
  status character varying,
  created_by_name character varying,

  -- Standard Fields
  created_by character varying,
  created_date timestamp with time zone,
  last_updated_by character varying,
  last_updated_date timestamp with time zone,

  CONSTRAINT pk_sys_todo_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);


DROP TABLE IF EXISTS sys_note CASCADE;

CREATE TABLE sys_note
(
  id character varying NOT NULL,
  case_id character varying,
  case_type character varying,
  case_data json,
  number character varying,
  case_number character varying,
  details character varying,
  note_type character varying,
  is_active_record boolean,
  created_by_name character varying,

  -- Standard Fields
  created_by character varying,
  created_date timestamp with time zone,
  last_updated_by character varying,
  last_updated_date timestamp with time zone,

  CONSTRAINT pk_sys_note_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);


DROP TABLE IF EXISTS sys_party CASCADE;

CREATE TABLE sys_party
(
  id character varying NOT NULL,

  case_id character varying,
  case_type character varying,
  case_data json,
  party_type character varying,
  number character varying,
  case_number character varying,
  is_active_record boolean,

  first_name character varying,
  last_name character varying,
  middle_initial character varying,
  nickname character varying,
  date_of_birth timestamp with time zone,
  party_name character varying,
  address character varying,
  city  character varying,
  state_province  character varying,
  country character varying,
  zip_code_postal_code  character varying,
  home_phone  character varying,
  work_phone  character varying,
  cell_phone  character varying,
  email_address  character varying,
  created_by_name character varying,


  -- Standard Fields
  created_by character varying,
  created_date timestamp with time zone,
  last_updated_by character varying,
  last_updated_date timestamp with time zone,

  CONSTRAINT pk_sys_party_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);


DROP TABLE IF EXISTS sys_attachment CASCADE;

CREATE TABLE sys_attachment
(
  id character varying NOT NULL,
  url character varying,
  files json[],
  number character varying,
  case_number character varying,
  case_id character varying,
  case_type character varying,
  case_data json,
  parent_id character varying,
  parent_type character varying,
  kind character varying,
  file_type character varying,
  description character varying,
  template_id character varying,
  template_name character varying,
  template_locale character varying,
  is_active_record boolean,
  created_by_name character varying,

  -- Standard Fields
  created_by character varying,
  created_date timestamp with time zone,
  last_updated_by character varying,
  last_updated_date timestamp with time zone,

  CONSTRAINT pk_sys_attachment_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);


DROP TABLE IF EXISTS sys_email CASCADE;

CREATE TABLE sys_email
(
  id character varying NOT NULL,
  case_id character varying,
  case_type character varying,
  case_data json,
  case_number character varying,
  parent_id character varying,
  email_thread_id character varying,
  sender_id character varying,
  sender_name character varying,
  sender_email character varying,
  recipients character varying[],
  subject character varying,
  body character varying,
  date_sent timestamp with time zone,
  attachments json[],
  direction character varying,
  split_message character varying,
  high_priority boolean,
  latest_sent boolean, -- Identifies that if an email is the latest in its thread of emails

  -- Standard Fields
  created_by character varying,
  created_date timestamp with time zone,
  last_updated_by character varying,
  last_updated_date timestamp with time zone,

  CONSTRAINT pk_sys_email_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);

DROP TABLE IF EXISTS sys_emailtemplate CASCADE;

CREATE TABLE sys_emailtemplate
(
  id character varying NOT NULL,
  name character varying,
  body character varying,
  locale character varying,
  rank integer,

  -- Standard Fields
  created_by character varying,
  created_date timestamp with time zone,
  last_updated_by character varying,
  last_updated_date timestamp with time zone,

  CONSTRAINT pk_sys_emailtemplate_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sys_emailtemplate
  OWNER TO postgres;

DROP TABLE IF EXISTS sys_trigger CASCADE;

CREATE TABLE sys_trigger
(
  id character varying NOT NULL,
  description character varying,
  target character varying NOT NULL,
  attributes json,
  subject character varying,
  template character varying,
  fields character varying[],
  recipients character varying[],
  escalation integer,
  escalation_reference character varying,

  -- Standard Fields
  created_by character varying,
  created_date timestamp with time zone,
  last_updated_by character varying,
  last_updated_date timestamp with time zone,

  CONSTRAINT pk_sys_trigger_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);


DROP TABLE IF EXISTS sys_case_link CASCADE;

CREATE TABLE sys_case_link
(
  id character varying NOT NULL,
  case_id character varying,
  linked_case_id character varying,
  number character varying,
  reason character varying,

  -- Standard Fields
  created_by character varying,
  created_date timestamp with time zone,
  last_updated_by character varying,
  last_updated_date timestamp with time zone,

  CONSTRAINT pk_sys_case_link_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sys_case_link
  OWNER TO postgres;


DROP TABLE IF EXISTS sys_holiday_entry CASCADE;

CREATE TABLE sys_holiday_entry
(
  id character varying NOT NULL,
  date_from timestamp with time zone NOT NULL,
  date_to timestamp with time zone NOT NULL,
  name character varying NOT NULL, -- user input eg. "christmas"

  -- Standard Fields
  created_by character varying,
  created_by_name character varying,
  created_date timestamp with time zone,
  last_updated_by character varying,
  last_updated_date timestamp with time zone,

  CONSTRAINT pk_sys_holiday_entry_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE sys_holiday_entry
  OWNER TO postgres;

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
