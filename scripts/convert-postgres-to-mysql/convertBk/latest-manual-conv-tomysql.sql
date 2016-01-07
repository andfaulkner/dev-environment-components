SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO,ALLOW_INVALID_DATES";
SET time_zone="+00:00";

CREATE TABLE schemaversion (
    version int(11) NOT NULL,
    name varchar(255) DEFAULT '',
    md5 varchar(255) DEFAULT ''
) ENGINE=InnoDB;

DROP table sys_user;
CREATE TABLE sys_user
(
  id varchar(255) NOT NULL,
  nick varchar(255),
  email varchar(255),
  name varchar(255),
  first_name varchar(255),
  last_name varchar(255),
  saml_id varchar(255),
  service json,
  active bool,
  `when` timestamp,
  confirmed bool,
  confirmcode varchar(255),
  salt varchar(2000),
  pass varchar(255),
  dateregistered timestamp,
  admin bool,
  perm json,
  roles varchar(10000),
  locale varchar(255),
  rounds varchar(255),
  sso_user bool,
  yellowfin_hash varchar(255),
  yellowfin_salt varchar(255),
  yellowfin_username varchar(255),
  phone varchar(255),
  fax varchar(255),
  signature varchar(255),
  -- TODO Remove from platform
  alignment_region varchar(255),
  -- Standard Fields
  created_by varchar(255),
  created_date timestamp,
  last_updated_by varchar(255),
  last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_case
(
	id varchar(255) NOT NULL,
	case_number varchar(255) NOT NULL,
	close_reason varchar(255),
	reopen_reason varchar(255),
	cancel_date timestamp,
	cancel_reason varchar(255),
	case_status varchar(255),
	case_type varchar(255),
	parent varchar(255),
	date_recorded timestamp,
	reported_by varchar(255),
	investigative_team_members varchar(255),
	user_blacklist varchar(255),
	data_source varchar(255),
	assigned_by varchar(255),
	assigned_to varchar(255),
	assignment_status varchar(255),
	owner varchar(255),
	owner_name varchar(255),
	decline_reason varchar(255),
	reassign_reason varchar(255),
	date_ownership_decision timestamp,
	is_active_record bool,
	reported_by_name varchar(255),
	-- create case by email specific
	case_source varchar(255),
	case_email json,
	category_level1  varchar(255),
	category_level2  varchar(255),
	category_level3  varchar(255),
	case_title  varchar(255),
	reopen_date timestamp,
	date_assigned timestamp,
	date_closed timestamp,
	dateReclosed timestamp,
	system_blacklist varchar(255),

	-- Standard Fields
	created_by varchar(255),
	created_date timestamp,
	last_updated_by varchar(255),
	last_updated_by_name varchar(255),
	last_updated_date timestamp
)
ENGINE=InnoDb;

CREATE TABLE sys_todo
(
	id varchar(255) NOT NULL,
	case_id varchar(255),
	case_type varchar(255),
	case_data json,
	assigned_by varchar(255),
	assigned_by_name varchar(255),
	responsible varchar(255),
	responsible_name varchar(255),
	date_completed timestamp,
	date_accepted timestamp,
	is_active_record bool,
	number varchar(255),
	case_number varchar(255),
	details varchar(255),
	due timestamp,
	email_reminder int(11),
	active_reminder varchar(255),
	todo_type varchar(255),
	other varchar(255),
	`status` varchar(255),
	created_by_name varchar(255),
	-- Standard Fields
	created_by varchar(255),
	created_date timestamp,
	last_updated_by varchar(255),
	last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_note
(
	id varchar(255) NOT NULL,
	case_id varchar(255),
	case_type varchar(255),
	case_data json,
	number varchar(255),
	case_number varchar(255),
	details varchar(255),
	note_type varchar(255),
	is_active_record bool,
	created_by_name varchar(255),
	-- Standard Fields
	created_by varchar(255),
	created_date timestamp,
	last_updated_by varchar(255),
	last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_party
(
  id varchar(255) NOT NULL,
  case_id varchar(255),
  case_type varchar(255),
  case_data json,
  party_type varchar(255),
  number varchar(255),
  case_number varchar(255),
  is_active_record bool,
  first_name varchar(255),
  last_name varchar(255),
  middle_initial varchar(255),
  nickname varchar(255),
  date_of_birth timestamp,
  party_name varchar(255),
  address varchar(255),
  city  varchar(255),
  state_province  varchar(255),
  country varchar(255),
  zip_code_postal_code  varchar(255),
  home_phone  varchar(255),
  work_phone  varchar(255),
  cell_phone  varchar(255),
  email_address  varchar(255),
  created_by_name varchar(255),
  -- Standard Fields
  created_by varchar(255),
  created_date timestamp,
  last_updated_by varchar(255),
  last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_attachment
(
  id varchar(255) NOT NULL,
  url varchar(255),
  files json,
  number varchar(255),
  case_number varchar(255),
  case_id varchar(255),
  case_type varchar(255),
  case_data json,
  parent_id varchar(255),
  parent_type varchar(255),
  kind varchar(255),
  file_type varchar(255),
  description varchar(255),
  template_id varchar(255),
  template_name varchar(255),
  template_locale varchar(255),
  is_active_record bool,
  created_by_name varchar(255),
  -- Standard Fields
  created_by varchar(255),
  created_date timestamp,
  last_updated_by varchar(255),
  last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_email
(
  id varchar(255) NOT NULL,
  case_id varchar(255),
  case_type varchar(255),
  case_data json,
  case_number varchar(255),
  parent_id varchar(255),
  email_thread_id varchar(255),
  sender_id varchar(255),
  sender_name varchar(255),
  sender_email varchar(255),
  recipients varchar(255),
  subject varchar(255),
  body varchar(255),
  date_sent timestamp,
  attachments json,
  direction varchar(255),
  split_message varchar(255),
  `high_priority` bool,
  latest_sent bool, -- Identifies that if an email is the latest in its thread of emails
  -- Standard Fields
  created_by varchar(255),
  created_date timestamp,
  last_updated_by varchar(255),
  last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_emailtemplate
(
  id varchar(255) NOT NULL,
  name varchar(255),
  body varchar(255),
  locale varchar(255),
  rank int(11),

  -- Standard Fields
  created_by varchar(255),
  created_date timestamp,
  last_updated_by varchar(255),
  last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_trigger
(
  id varchar(255) NOT NULL,
  description varchar(255),
  target varchar(255) NOT NULL,
  attributes json,
  subject varchar(255),
  template varchar(255),
  fields varchar(255),
  recipients varchar(255),
  escalation int(11),
  escalation_reference varchar(255),

  -- Standard Fields
  created_by varchar(255),
  created_date timestamp,
  last_updated_by varchar(255),
  last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_case_link
(
  id varchar(255) NOT NULL,
  case_id varchar(255),
  linked_case_id varchar(255),
  number varchar(255),
  reason varchar(255),

  -- Standard Fields
  created_by varchar(255),
  created_date timestamp,
  last_updated_by varchar(255),
  last_updated_date timestamp

) ENGINE=InnoDb;

CREATE TABLE sys_holiday_entry
(
  id varchar(255) NOT NULL,
  date_from timestamp NOT NULL,
  date_to timestamp NOT NULL,
  name varchar(255) NOT NULL, -- user input eg. `christmas`

  -- Standard Fields
  created_by varchar(255),
  created_by_name varchar(255),
  created_date timestamp,
  last_updated_by varchar(255),
  last_updated_date timestamp

) ENGINE=InnoDb;


CREATE TABLE core_schemaversion (
	version int(11) NOT NULL,
	name varchar(255) DEFAULT '',
	md5 varchar(255) DEFAULT ''
) ENGINE=InnoDb;

CREATE TABLE sys_translation (
    id varchar(255) NOT NULL,
    locale varchar(255),
    `key` varchar(255),
    value varchar(255),
    description varchar(255),
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_entity (
    base varchar(255),
    name varchar(255),
    zone varchar(255),
    fields JSON,
    id varchar(255) NOT NULL,
    seneca json
) ENGINE=InnoDb;

CREATE TABLE sys_account (
    id varchar(255) NOT NULL,
    orignick varchar(255),
    name varchar(255),
    origuser varchar(255),
    active bool,
    users varchar(255),
    projects varchar(255)
) ENGINE=InnoDb;

CREATE TABLE sys_casesubstatus (
    id varchar(255) NOT NULL,
    case_id varchar(255),
    name varchar(255),
    start_date timestamp,
    end_date timestamp,
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_document (
    id varchar(255) NOT NULL,
    file_id varchar(255),
    filename varchar(255),
    kind varchar(255),
    details varchar(255),
    file_type varchar(255),
    description varchar(255),
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_comment (
    id varchar(255) NOT NULL,
    parent_id varchar(255),
    parent_type varchar(255),
    parent_number varchar(255),
    details varchar(255),
    case_id varchar(255),
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_escalation (
    id varchar(255) NOT NULL,
    job_id varchar(255) NOT NULL,
    target_id varchar(255) NOT NULL,
    trigger_id varchar(255) NOT NULL,
    active bool NOT NULL,
    date_start timestamp,
    date_end timestamp,
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_event (
    id varchar(255) NOT NULL,
    job_id varchar(255) NOT NULL,
    `type` varchar(255),
    `status` varchar(255),
    details json,
    date_occured timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_field (
    id varchar(255) NOT NULL,
    entity varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    `type` varchar(255) NOT NULL,
    list varchar(255),
    exclude json,
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_filter (
    id varchar(255) NOT NULL,
    title varchar(255),
    name varchar(255),
    `type` varchar(255),
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_listitem (
	id varchar(255) NOT NULL,
	name varchar(255) DEFAULT 'emptyname',
	value varchar(255) DEFAULT 'emptyvalue',
	`parents` varchar(255) DEFAULT 'noparents',
	`alt_parents` varchar(255) DEFAULT 'none',
	`group` varchar(255) DEFAULT 'mygroup',
	rank int(11) DEFAULT 0,
	-- related_data json DEFAULT NULL,
	created_by varchar(255) DEFAULT 'me',
	created_date timestamp DEFAULT CURRENT_TIMESTAMP,
	last_updated_by varchar(255) DEFAULT 'me',
	last_updated_date timestamp DEFAULT CURRENT_TIMESTAMP,
	-- Integration/Migration
	source_type varchar(255) DEFAULT 'sqlone',
	source_content varchar(255)  DEFAULT 'sqltwo'
) ENGINE=InnoDb;

CREATE TABLE sys_login (
    id varchar(255) NOT NULL,
    nick varchar(255),
    email varchar(255),
    `user` varchar(255),
    `when` timestamp,
    why varchar(255),
    token varchar(255),
    active bool,
    ended varchar(255)
) ENGINE=InnoDb;

CREATE TABLE sys_log
(
  id varchar(255) NOT NULL,
  msg varchar(255) NOT NULL,
  details varchar(255),
  `type` varchar(255),
  subtype varchar(255),
  origin varchar(255),
  userid varchar(255),
  loginid varchar(255),

  -- Standard Fields
  created_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_notification (
    id varchar(255) NOT NULL,
    entity_type varchar(255),
    `trigger` json,
    custom_criteria json,
    context_users varchar(255),
    system_users varchar(255),
    user_groups varchar(255),
    other_addresses varchar(255),
    subject varchar(255),
    message varchar(255),
    include_fields json,
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_project (
    id varchar(255) NOT NULL,
    kind varchar(255),
    account varchar(255),
    name varchar(255),
    active bool
) ENGINE=InnoDb;

CREATE TABLE sys_reset (
    id varchar(255) NOT NULL,
    nick varchar(255),
    `user` varchar(255),
    `when` timestamp,
    active bool
) ENGINE=InnoDb;

CREATE TABLE sys_response (
    id varchar(255) NOT NULL,
    name varchar(255),
    body varchar(255),
    `type` varchar(255),
    locale varchar(255),
    rank int(11),
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_template (
    id varchar(255) NOT NULL,
    name varchar(255),
    files JSON,
    case_type varchar(255),
    locale varchar(255),
    file_type varchar(255),
    created_by varchar(255),
    created_by_name varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_searches (
    id varchar(255) NOT NULL,
    filter_query varchar(255),
    search_name varchar(255),
    saved bool,
    created_by varchar(255),
    created_date timestamp,
    last_updated_by varchar(255),
    last_updated_date timestamp
) ENGINE=InnoDb;

CREATE TABLE sys_settings (
    id varchar(255) NOT NULL,
    kind varchar(255),
    spec varchar(255),
    data json,
    ref varchar(255),
    settings json
) ENGINE=InnoDb;

ALTER TABLE sys_entity
    ADD CONSTRAINT pk_id PRIMARY KEY (id);
ALTER TABLE sys_account
    ADD CONSTRAINT pk_sys_account_id PRIMARY KEY (id);
ALTER TABLE sys_casesubstatus
    ADD CONSTRAINT pk_sys_casesubstatus_id PRIMARY KEY (id);
ALTER TABLE sys_comment
    ADD CONSTRAINT pk_sys_comment_id PRIMARY KEY (id);
ALTER TABLE sys_document
    ADD CONSTRAINT pk_sys_document_id PRIMARY KEY (id);
ALTER TABLE sys_escalation
    ADD CONSTRAINT pk_sys_escalation_id PRIMARY KEY (id);
ALTER TABLE sys_event
    ADD CONSTRAINT pk_sys_event_id PRIMARY KEY (id);
ALTER TABLE sys_field
    ADD CONSTRAINT pk_sys_field_id PRIMARY KEY (id);
ALTER TABLE sys_filter
    ADD CONSTRAINT pk_sys_filter_id PRIMARY KEY (id);
ALTER TABLE sys_listitem
    ADD CONSTRAINT pk_sys_listitem_id PRIMARY KEY (id);
ALTER TABLE sys_login
    ADD CONSTRAINT pk_sys_login_id PRIMARY KEY (id);
ALTER TABLE sys_notification
    ADD CONSTRAINT pk_sys_notification_id PRIMARY KEY (id);
ALTER TABLE sys_project
    ADD CONSTRAINT pk_sys_project_id PRIMARY KEY (id);
ALTER TABLE sys_reset
    ADD CONSTRAINT pk_sys_reset_id PRIMARY KEY (id);
ALTER TABLE sys_response
    ADD CONSTRAINT pk_sys_response_id PRIMARY KEY (id);
ALTER TABLE sys_searches
    ADD CONSTRAINT pk_sys_searches_id PRIMARY KEY (id);
ALTER TABLE sys_settings
    ADD CONSTRAINT pk_sys_settings_id PRIMARY KEY (id);
ALTER TABLE sys_template
    ADD CONSTRAINT pk_sys_template_id PRIMARY KEY (id);
ALTER TABLE sys_translation
    ADD CONSTRAINT pk_sys_translation_id PRIMARY KEY (id);

SELECT * FROM sys_field;

SELECT * FROM sys_response;

DROP TABLE sys_translation;
SELECT * FROM sys_translation;
SELECT * FROM sys_translation WHERE `locale` = 'en_US' LIMIT 10;

SELECT * FROM sys_user;

SELECT * FROM sys_trigger;

DROP TABLE sys_listitem;
SELECT * FROM sys_listitem;
INSERT INTO sys_listitem SET `id` = 1, `name` = 'hello', `value`= 'myvalue';
-- 'INSERT INTO sys_listItem SET `name` = \'countries\', `value` = \'Dominica\', `created_date` = \'2015-10-18 22:41:17\', `last_updated_date` = \'2015-10-18 22:41:18\', `id` = \'ba7e5b8b-bed9-47e8-9d98-61b34e81de01\''
-- 'INSERT INTO sys_listItem SET `name` = \'countries\', `value` = \'Dominican Republic\', `created_date` = \'2015-10-18 22:41:17\', `last_updated_date` = \'2015-10-18 22:41:18\', `id` = \'6bee7962-e564-40f6-b89e-c5205fcd7cd8\''