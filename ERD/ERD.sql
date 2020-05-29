
/* Drop Triggers */

DROP TRIGGER TRI_faq_f_uid;
DROP TRIGGER TRI_Member_m_uid;
DROP TRIGGER TRI_m_user_m_uid;
DROP TRIGGER TRI_N_table_N_uid;
DROP TRIGGER TRI_qr_comment_qr_numUid;
DROP TRIGGER TRI_Q_comment_Q_numUid;
DROP TRIGGER TRI_Q_table_Q_uid;
DROP TRIGGER TRI_Reserve_r_uid;
DROP TRIGGER TRI_sr_comment_sr_numUid;
DROP TRIGGER TRI_sr_file_srf_uid;
DROP TRIGGER TRI_s_category_sc_uid;
DROP TRIGGER TRI_s_comment_s_numUid;
DROP TRIGGER TRI_s_file_sf_uid;
DROP TRIGGER TRI_s_file_s_uid;
DROP TRIGGER TRI_s_table_s_uid;
DROP TRIGGER TRI_TODOList_td_uid;
DROP TRIGGER TRI_T_detail_t_uid;
DROP TRIGGER TRI_user_m_uid;



/* Drop Tables */

DROP TABLE faq CASCADE CONSTRAINTS;
DROP TABLE n_table CASCADE CONSTRAINTS;
DROP TABLE Reserve CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE qr_comment CASCADE CONSTRAINTS;
DROP TABLE q_table CASCADE CONSTRAINTS;
DROP TABLE sr_file CASCADE CONSTRAINTS;
DROP TABLE sr_comment CASCADE CONSTRAINTS;
DROP TABLE s_favor CASCADE CONSTRAINTS;
DROP TABLE s_file CASCADE CONSTRAINTS;
DROP TABLE s_table CASCADE CONSTRAINTS;
DROP TABLE TODORow CASCADE CONSTRAINTS;
DROP TABLE TODOList CASCADE CONSTRAINTS;
DROP TABLE m_user CASCADE CONSTRAINTS;
DROP TABLE s_category CASCADE CONSTRAINTS;
DROP TABLE t_detail CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_faq_f_uid;
DROP SEQUENCE SEQ_Member_m_uid;
DROP SEQUENCE SEQ_m_user_m_uid;
DROP SEQUENCE SEQ_N_table_N_uid;
DROP SEQUENCE SEQ_qr_comment_qr_numUid;
DROP SEQUENCE SEQ_Q_comment_Q_numUid;
DROP SEQUENCE SEQ_Q_table_Q_uid;
DROP SEQUENCE SEQ_Reserve_r_uid;
DROP SEQUENCE SEQ_sr_comment_sr_numUid;
DROP SEQUENCE SEQ_sr_file_srf_uid;
DROP SEQUENCE SEQ_s_category_sc_uid;
DROP SEQUENCE SEQ_s_comment_s_numUid;
DROP SEQUENCE SEQ_s_file_sf_uid;
DROP SEQUENCE SEQ_s_file_s_uid;
DROP SEQUENCE SEQ_s_table_s_uid;
DROP SEQUENCE SEQ_TODOList_td_uid;
DROP SEQUENCE SEQ_T_detail_t_uid;
DROP SEQUENCE SEQ_user_m_uid;




/* Create Sequences */

CREATE SEQUENCE SEQ_faq_f_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Member_m_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_m_user_m_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_N_table_N_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qr_comment_qr_numUid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Q_comment_Q_numUid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Q_table_Q_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Reserve_r_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_sr_comment_sr_numUid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_sr_file_srf_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_s_category_sc_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_s_comment_s_numUid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_s_file_sf_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_s_file_s_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_s_table_s_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_TODOList_td_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_T_detail_t_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_user_m_uid INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE faq
(
	f_uid number NOT NULL,
	f_title varchar2(60) NOT NULL,
	f_content clob NOT NULL,
	PRIMARY KEY (f_uid)
);


CREATE TABLE m_user
(
	m_uid number NOT NULL,
	m_email varchar2(200) NOT NULL UNIQUE,
	m_pw varchar2(100) NOT NULL,
	m_nick varchar2(30) NOT NULL UNIQUE,
	m_name varchar2(20) NOT NULL,
	m_jumin number NOT NULL,
	m_phoneNum number NOT NULL,
	m_gender varchar2(6),
	m_job number,
	m_addressP varchar2(25),
	m_addressA varchar2(150),
	m_addressB varchar2(150),
	m_SMSOk number,
	m_EmailOk number,
	m_profile blob,
	m_grade number NOT NULL DEFAULT 1,
	PRIMARY KEY (m_uid)
);


CREATE TABLE n_table
(
	n_uid number NOT NULL,
	n_title varchar2(60) NOT NULL,
	n_content clob NOT NULL,
	n_viewCnt number,
	n_date date,
	m_uid number NOT NULL,
	PRIMARY KEY (n_uid)
);


CREATE TABLE payment
(
	tid varchar2(60) NOT NULL,
	partner_order_id varchar2(300),
	item_name varchar2(300),
	total_amount number,
	tax_free_amount number,
	pay_date date,
	m_uid number NOT NULL,
	PRIMARY KEY (tid)
);


CREATE TABLE qr_comment
(
	qr_numUid number NOT NULL,
	qr_comment clob NOT NULL,
	qr_date date NOT NULL DEFAULT SYSDATE,
	q_uid number NOT NULL,
	m_uid number NOT NULL,
	PRIMARY KEY (qr_numUid)
);


CREATE TABLE q_table
(
	q_uid number NOT NULL,
	q_title varchar2(60) NOT NULL,
	q_content clob NOT NULL,
	q_date date DEFAULT SYSDATE,
	q_viewCnt number NOT NULL,
	m_uid number NOT NULL,
	PRIMARY KEY (q_uid)
);


CREATE TABLE Reserve
(
	r_uid number NOT NULL,
	r_startTime date,
	r_endTime date,
	m_uid number NOT NULL,
	tid varchar2(60) NOT NULL,
	t_uid number NOT NULL,
	PRIMARY KEY (r_uid)
);


CREATE TABLE sr_comment
(
	sr_numUid number NOT NULL,
	sr_group number NOT NULL,
	sr_depth number NOT NULL DEFAULT 0,
	sr_com clob NOT NULL,
	sr_date date NOT NULL DEFAULT SYSDATE,
	sr_udate date DEFAULT SYSDATE,
	sr_deleted number,
	s_uid number NOT NULL,
	m_uid number NOT NULL,
	sr_subnumUid number NOT NULL,
	PRIMARY KEY (sr_numUid)
);


CREATE TABLE sr_file
(
	srf_uid number NOT NULL,
	srf_name varchar2(60) NOT NULL,
	srf_data blob,
	srf_url clob,
	srf_date date DEFAULT SYSDATE,
	sr_numUid number NOT NULL,
	PRIMARY KEY (srf_uid)
);


CREATE TABLE s_category
(
	sc_uid number NOT NULL,
	sc_name varchar2(60),
	PRIMARY KEY (sc_uid)
);


CREATE TABLE s_favor
(
	m_uid number NOT NULL,
	s_uid number NOT NULL,
	sl_date date DEFAULT SYSDATE
);


CREATE TABLE s_file
(
	sf_uid number NOT NULL,
	sf_name varchar2(60) NOT NULL,
	sf_data blob,
	sf_url clob,
	sf_date date DEFAULT SYSDATE,
	s_uid number NOT NULL,
	PRIMARY KEY (sf_uid)
);


CREATE TABLE s_table
(
	s_uid number NOT NULL,
	s_title varchar2(60) NOT NULL,
	s_content clob NOT NULL,
	s_date date DEFAULT SYSDATE,
	s_udate date DEFAULT SYSDATE,
	s_viewCnt number NOT NULL,
	sc_uid number NOT NULL,
	m_uid number NOT NULL,
	PRIMARY KEY (s_uid)
);


CREATE TABLE TODOList
(
	td_uid number NOT NULL UNIQUE,
	td_date date NOT NULL DEFAULT SYSDATE,
	m_uid number NOT NULL,
	PRIMARY KEY (td_uid)
);


CREATE TABLE TODORow
(
	tr_content clob NOT NULL,
	tr_checked number NOT NULL DEFAULT 0,
	td_uid number NOT NULL UNIQUE
);


CREATE TABLE t_detail
(
	t_uid number NOT NULL,
	t_name varchar2(60) NOT NULL,
	t_pay number NOT NULL DEFAULT 0,
	t_pay2 number NOT NULL DEFAULT 0,
	t_pay3 number NOT NULL DEFAULT 0,
	t_pay4 number NOT NULL DEFAULT 0,
	t_extraCost number NOT NULL DEFAULT 0,
	t_max number DEFAULT 1,
	PRIMARY KEY (t_uid)
);



/* Create Foreign Keys */

ALTER TABLE n_table
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid)
;


ALTER TABLE payment
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid)
;


ALTER TABLE qr_comment
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid)
;


ALTER TABLE q_table
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid)
;


ALTER TABLE Reserve
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid)
;


ALTER TABLE sr_comment
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid)
;


ALTER TABLE s_favor
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid)
;


ALTER TABLE s_table
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid)
;


ALTER TABLE TODOList
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid)
;


ALTER TABLE Reserve
	ADD FOREIGN KEY (tid)
	REFERENCES payment (tid)
;


ALTER TABLE qr_comment
	ADD FOREIGN KEY (q_uid)
	REFERENCES q_table (q_uid)
;


ALTER TABLE sr_comment
	ADD FOREIGN KEY (sr_subnumUid)
	REFERENCES sr_comment (sr_numUid)
;


ALTER TABLE sr_file
	ADD FOREIGN KEY (sr_numUid)
	REFERENCES sr_comment (sr_numUid)
;


ALTER TABLE s_table
	ADD FOREIGN KEY (sc_uid)
	REFERENCES s_category (sc_uid)
;


ALTER TABLE sr_comment
	ADD FOREIGN KEY (s_uid)
	REFERENCES s_table (s_uid)
;


ALTER TABLE s_favor
	ADD FOREIGN KEY (s_uid)
	REFERENCES s_table (s_uid)
;


ALTER TABLE s_file
	ADD FOREIGN KEY (s_uid)
	REFERENCES s_table (s_uid)
;


ALTER TABLE TODORow
	ADD FOREIGN KEY (td_uid)
	REFERENCES TODOList (td_uid)
;


ALTER TABLE Reserve
	ADD FOREIGN KEY (t_uid)
	REFERENCES t_detail (t_uid)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_faq_f_uid BEFORE INSERT ON faq
FOR EACH ROW
BEGIN
	SELECT SEQ_faq_f_uid.nextval
	INTO :new.f_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Member_m_uid BEFORE INSERT ON Member
FOR EACH ROW
BEGIN
	SELECT SEQ_Member_m_uid.nextval
	INTO :new.m_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_m_user_m_uid BEFORE INSERT ON m_user
FOR EACH ROW
BEGIN
	SELECT SEQ_m_user_m_uid.nextval
	INTO :new.m_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_N_table_N_uid BEFORE INSERT ON N_table
FOR EACH ROW
BEGIN
	SELECT SEQ_N_table_N_uid.nextval
	INTO :new.N_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_qr_comment_qr_numUid BEFORE INSERT ON qr_comment
FOR EACH ROW
BEGIN
	SELECT SEQ_qr_comment_qr_numUid.nextval
	INTO :new.qr_numUid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Q_comment_Q_numUid BEFORE INSERT ON Q_comment
FOR EACH ROW
BEGIN
	SELECT SEQ_Q_comment_Q_numUid.nextval
	INTO :new.Q_numUid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Q_table_Q_uid BEFORE INSERT ON Q_table
FOR EACH ROW
BEGIN
	SELECT SEQ_Q_table_Q_uid.nextval
	INTO :new.Q_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Reserve_r_uid BEFORE INSERT ON Reserve
FOR EACH ROW
BEGIN
	SELECT SEQ_Reserve_r_uid.nextval
	INTO :new.r_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_sr_comment_sr_numUid BEFORE INSERT ON sr_comment
FOR EACH ROW
BEGIN
	SELECT SEQ_sr_comment_sr_numUid.nextval
	INTO :new.sr_numUid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_sr_file_srf_uid BEFORE INSERT ON sr_file
FOR EACH ROW
BEGIN
	SELECT SEQ_sr_file_srf_uid.nextval
	INTO :new.srf_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_s_category_sc_uid BEFORE INSERT ON s_category
FOR EACH ROW
BEGIN
	SELECT SEQ_s_category_sc_uid.nextval
	INTO :new.sc_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_s_comment_s_numUid BEFORE INSERT ON s_comment
FOR EACH ROW
BEGIN
	SELECT SEQ_s_comment_s_numUid.nextval
	INTO :new.s_numUid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_s_file_sf_uid BEFORE INSERT ON s_file
FOR EACH ROW
BEGIN
	SELECT SEQ_s_file_sf_uid.nextval
	INTO :new.sf_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_s_file_s_uid BEFORE INSERT ON s_file
FOR EACH ROW
BEGIN
	SELECT SEQ_s_file_s_uid.nextval
	INTO :new.s_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_s_table_s_uid BEFORE INSERT ON s_table
FOR EACH ROW
BEGIN
	SELECT SEQ_s_table_s_uid.nextval
	INTO :new.s_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_TODOList_td_uid BEFORE INSERT ON TODOList
FOR EACH ROW
BEGIN
	SELECT SEQ_TODOList_td_uid.nextval
	INTO :new.td_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_T_detail_t_uid BEFORE INSERT ON T_detail
FOR EACH ROW
BEGIN
	SELECT SEQ_T_detail_t_uid.nextval
	INTO :new.t_uid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_user_m_uid BEFORE INSERT ON user
FOR EACH ROW
BEGIN
	SELECT SEQ_user_m_uid.nextval
	INTO :new.m_uid
	FROM dual;
END;

/




