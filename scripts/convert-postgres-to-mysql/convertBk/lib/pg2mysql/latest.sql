--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


-- tracks schema upgrades
DROP TABLE IF EXISTS core_schemaversion;

CREATE TABLE core_schemaversion (
	version integer NOT NULL,
	name text DEFAULT ''::text,
	md5 text DEFAULT ''::text
);

--
-- Name: sys_translation; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_translation;

CREATE TABLE sys_translation (
    id character varying NOT NULL,
    locale character varying,
    key character varying,
    value character varying,
    description character varying,
    created_by character varying,
    created_date timestamp with time zone,
    last_updated_by character varying,
    last_updated_date timestamp with time zone
);


ALTER TABLE sys_translation OWNER TO postgres;

--
-- Name: sys_entity; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_entity;

CREATE TABLE sys_entity (
    base character varying(255),
    name character varying(255),
    zone character varying,
    fields json[],
    id character varying NOT NULL,
    seneca json
);


ALTER TABLE sys_entity OWNER TO postgres;


--
-- Name: sys_account; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_account;

CREATE TABLE sys_account (
    id character varying NOT NULL,
    orignick character varying,
    name character varying,
    origuser character varying,
    active boolean,
    users character varying,
    projects character varying
);


ALTER TABLE sys_account OWNER TO postgres;

--
-- Name: sys_casesubstatus; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE sys_casesubstatus (
    id character varying NOT NULL,
    case_id character varying,
    name character varying,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    created_by character varying,
    created_date timestamp with time zone,
    last_updated_by character varying,
    last_updated_date timestamp with time zone
);


ALTER TABLE sys_casesubstatus OWNER TO postgres;

--
-- Name: sys_document; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_document;

CREATE TABLE sys_document (
    id character varying NOT NULL,
    file_id character varying,
    filename character varying,
    kind character varying,
    details character varying,
    file_type character varying,
    description character varying,
    created_by character varying,
    created_date timestamp with time zone,
    last_updated_by character varying,
    last_updated_date timestamp with time zone
);


ALTER TABLE sys_document OWNER TO postgres;


--
-- Name: sys_comment; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_comment;

CREATE TABLE sys_comment (
    id character varying NOT NULL,
    parent_id character varying,
    parent_type character varying,
    parent_number character varying,
    details character varying,
    case_id character varying,
    created_by character varying,
    created_date timestamp with time zone,
    last_updated_by character varying,
    last_updated_date timestamp with time zone
);


ALTER TABLE sys_comment OWNER TO postgres;

--
-- Name: sys_escalation; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_escalation;

CREATE TABLE sys_escalation (
    id character varying NOT NULL,
    job_id character varying NOT NULL,
    target_id character varying NOT NULL,
    trigger_id character varying NOT NULL,
    active boolean NOT NULL,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    created_by character varying,
    created_date timestamp with time zone,
    last_updated_by character varying,
    last_updated_date timestamp with time zone
);


ALTER TABLE sys_escalation OWNER TO postgres;

--
-- Name: sys_event; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_event;

CREATE TABLE sys_event (
    id character varying NOT NULL,
    job_id character varying NOT NULL,
    type character varying,
    status character varying,
    details json,
    date_occured timestamp with time zone
);

ALTER TABLE sys_event OWNER TO postgres;

--
-- Name: sys_field; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_field;

CREATE TABLE sys_field (
    id character varying NOT NULL,
    entity character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying NOT NULL,
    list character varying(255),
    exclude json,
    created_by character varying,
    created_date timestamp with time zone,
    last_updated_by character varying,
    last_updated_date timestamp with time zone
);

ALTER TABLE sys_field OWNER TO postgres;


--
-- Name: sys_filter; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_filter;

CREATE TABLE sys_filter (
    id character varying NOT NULL,
    title character varying,
    name character varying,
    type character varying,
    created_by character varying,
    created_date timestamp with time zone,
    last_updated_by character varying,
    last_updated_date timestamp with time zone
);


ALTER TABLE sys_filter OWNER TO postgres;

--
-- Name: sys_listitem; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_listitem;

CREATE TABLE sys_listitem (
    id character varying NOT NULL,
    name character varying,
    value character varying,
    parents character varying[],
    alt_parents character varying[],
    "group" character varying,
    rank integer,
    related_data json,
    created_by character varying,
    created_date timestamp with time zone,
    last_updated_by character varying,
    last_updated_date timestamp with time zone,

     -- Integration/Migration
    source_type character varying,
    source_content character varying
);


ALTER TABLE sys_listitem OWNER TO postgres;

--
-- Name: sys_login; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_login;

CREATE TABLE sys_login (
    id character varying NOT NULL,
    nick character varying,
    email character varying,
    "user" character varying,
    "when" timestamp with time zone,
    why character varying,
    token character varying,
    active boolean,
    ended character varying
);


ALTER TABLE sys_login OWNER TO postgres;


--
-- Name: sys_casesubstatus; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_log CASCADE;

CREATE TABLE sys_log
(
  id character varying NOT NULL,
  msg character varying NOT NULL,
  details character varying,
  type character varying,
  subtype character varying,
  origin character varying,
  userid character varying,
  loginid character varying,

  -- Standard Fields
  created_date timestamp with time zone,

  CONSTRAINT pk_sys_log_id PRIMARY KEY (id)
);


ALTER TABLE sys_log OWNER TO postgres;

--
-- Name: sys_notification; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_notification;

CREATE TABLE sys_notification (
    id character varying NOT NULL,
    entity_type character varying,
    trigger json,
    custom_criteria json,
    context_users character varying,
    system_users character varying,
    user_groups character varying,
    other_addresses character varying,
    subject character varying,
    message character varying,
    include_fields json,
    created_by character varying,
    created_date timestamp with time zone,
    last_updated_by character varying,
    last_updated_date timestamp with time zone
);


ALTER TABLE sys_notification OWNER TO postgres;

--
-- Name: sys_project; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_project;

CREATE TABLE sys_project (
    id character varying NOT NULL,
    kind character varying,
    account character varying,
    name character varying,
    active boolean
);


ALTER TABLE sys_project OWNER TO postgres;


--
-- Name: sys_reset; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_reset;

CREATE TABLE sys_reset (
    id character varying NOT NULL,
    nick character varying,
    "user" character varying,
    "when" timestamp with time zone,
    active boolean
);


ALTER TABLE sys_reset OWNER TO postgres;

--
-- Name: sys_response; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_response;

CREATE TABLE sys_response (
    id character varying NOT NULL,
    name character varying,
    body character varying,
    type character varying,
    locale character varying,
    rank integer,
    created_by character varying,
    created_date timestamp with time zone,
    last_updated_by character varying,
    last_updated_date timestamp with time zone
);


ALTER TABLE sys_response OWNER TO postgres;

--
-- Name: sys_template; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

DROP TABLE IF EXISTS sys_template;

CREATE TABLE sys_template (
    id character varying NOT NULL,
    name character varying,
    files json[],
    case_type character varying,
    locale character varying,
    file_type character varying,
    created_by character varying,
    created_by_name character varying,
    created_date timestamp with time zone,
    last_updated_by character varying,
    last_updated_date timestamp with time zone
);

ALTER TABLE sys_template OWNER TO postgres;

--
-- Name: sys_searches; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE sys_searches (
    id character varying NOT NULL,
    filter_query character varying,
    search_name character varying,
    saved boolean,
    created_by character varying,
    created_date timestamp with time zone,
    last_updated_by character varying,
    last_updated_date timestamp with time zone
);

ALTER TABLE sys_searches OWNER TO postgres;


--
-- Name: sys_settings; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE sys_settings (
    id character varying NOT NULL,
    kind character varying,
    spec character varying,
    data json,
    ref character varying,
    settings json
);

ALTER TABLE sys_settings OWNER TO postgres;

--
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_entity
    ADD CONSTRAINT pk_id PRIMARY KEY (id);

--
-- Name: pk_sys_account_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_account
    ADD CONSTRAINT pk_sys_account_id PRIMARY KEY (id);

--
-- Name: pk_sys_casesubstatus_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_casesubstatus
    ADD CONSTRAINT pk_sys_casesubstatus_id PRIMARY KEY (id);


--
-- Name: pk_sys_comment_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_comment
    ADD CONSTRAINT pk_sys_comment_id PRIMARY KEY (id);


--
-- Name: pk_sys_document_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_document
    ADD CONSTRAINT pk_sys_document_id PRIMARY KEY (id);

--
-- Name: pk_sys_escalation_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_escalation
    ADD CONSTRAINT pk_sys_escalation_id PRIMARY KEY (id);


--
-- Name: pk_sys_event_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_event
    ADD CONSTRAINT pk_sys_event_id PRIMARY KEY (id);

--
-- Name: pk_sys_field_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_field
    ADD CONSTRAINT pk_sys_field_id PRIMARY KEY (id);


--
-- Name: pk_sys_filter_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_filter
    ADD CONSTRAINT pk_sys_filter_id PRIMARY KEY (id);

--
-- Name: pk_sys_listitem_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_listitem
    ADD CONSTRAINT pk_sys_listitem_id PRIMARY KEY (id);

--
-- Name: pk_sys_login_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_login
    ADD CONSTRAINT pk_sys_login_id PRIMARY KEY (id);

--
-- Name: pk_sys_notification_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_notification
    ADD CONSTRAINT pk_sys_notification_id PRIMARY KEY (id);


--
-- Name: pk_sys_project_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_project
    ADD CONSTRAINT pk_sys_project_id PRIMARY KEY (id);


--
-- Name: pk_sys_reset_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_reset
    ADD CONSTRAINT pk_sys_reset_id PRIMARY KEY (id);


--
-- Name: pk_sys_response_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_response
    ADD CONSTRAINT pk_sys_response_id PRIMARY KEY (id);


--
-- Name: pk_sys_searches_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_searches
    ADD CONSTRAINT pk_sys_searches_id PRIMARY KEY (id);

--
-- Name: pk_sys_settings_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_settings
    ADD CONSTRAINT pk_sys_settings_id PRIMARY KEY (id);


--
-- Name: pk_sys_template_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_template
    ADD CONSTRAINT pk_sys_template_id PRIMARY KEY (id);

--
-- Name: pk_sys_translation_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sys_translation
    ADD CONSTRAINT pk_sys_translation_id PRIMARY KEY (id);


CREATE INDEX sys_casesubstatus_case_id_idx ON sys_casesubstatus(case_id, end_date);
CREATE INDEX sys_listitem_name_id ON sys_listitem(name);
CREATE INDEX sys_listitem_name_value_group_id ON sys_listitem(name, value, "group");
CREATE INDEX sys_translation_name_id ON sys_translation(key, locale);
