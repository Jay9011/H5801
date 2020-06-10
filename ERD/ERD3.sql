
/* Drop Views */

DROP VIEW v_book;



/* Drop Tables */

DROP TABLE faq CASCADE CONSTRAINTS;
DROP TABLE n_table CASCADE CONSTRAINTS;
DROP TABLE Reserve CASCADE CONSTRAINTS;
DROP TABLE sr_file CASCADE CONSTRAINTS;
DROP TABLE sr_comment CASCADE CONSTRAINTS;
DROP TABLE s_favor CASCADE CONSTRAINTS;
DROP TABLE s_table CASCADE CONSTRAINTS;
DROP TABLE m_user CASCADE CONSTRAINTS;
DROP TABLE s_category CASCADE CONSTRAINTS;
DROP TABLE t_detail CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_m_user_m_uid;
DROP SEQUENCE SEQ_s_table_s_uid;
DROP SEQUENCE SEQ_t_detail_t_uid;
DROP SEQUENCE SEQ_Reserve_p_uid;
DROP SEQUENCE SEQ_n_table_n_uid;
DROP SEQUENCE SEQ_faq_f_uid;
DROP SEQUENCE SEQ_sr_file_srf_uid;
DROP SEQUENCE SEQ_sr_comment_sr_numUid;




/* Create Sequences */

CREATE SEQUENCE SEQ_m_user_m_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_s_table_s_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_t_detail_t_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Reserve_p_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_n_table_n_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_faq_f_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_sr_file_srf_uid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_sr_comment_sr_numUid INCREMENT BY 1 START WITH 1;



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
	m_birth date NOT NULL,
	m_phoneNum varchar2(15) NOT NULL,
	m_gender varchar2(6),
	m_addressA varchar2(150) NOT NULL,
	m_addressB varchar2(150),
	m_SMSOk number,
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


CREATE TABLE Reserve
(
	p_uid number NOT NULL,
	p_startTime date,
	p_endTime date,
	tid varchar2(300) DEFAULT NULL,
	item_name varchar2(300),
	total_amount number,
	tax_free_amount number,
	pay_date date,
	p_cancel number DEFAULT 0,
	m_uid number NOT NULL,
	t_uid number NOT NULL,
	PRIMARY KEY (p_uid)
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
	sr_numUidt number,
	PRIMARY KEY (sr_numUid)
);


CREATE TABLE sr_file
(
	srf_uid number NOT NULL,
	srf_name varchar2(60) NOT NULL,
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


CREATE TABLE s_table
(
	s_uid number NOT NULL,
	s_title varchar2(60) NOT NULL,
	s_content clob NOT NULL,
	s_date date DEFAULT SYSDATE,
	s_udate date DEFAULT SYSDATE,
	s_viewCnt number NOT NULL DEFAULT 0,
	sc_uid number NOT NULL,
	m_uid number NOT NULL,
	PRIMARY KEY (s_uid)
);


CREATE TABLE t_detail
(
	t_uid number NOT NULL,
	t_name varchar2(60) NOT NULL,
	t_pay number NOT NULL DEFAULT 0,
	t_maxnum number DEFAULT 0,
	PRIMARY KEY (t_uid)
);



/* Create Foreign Keys */

ALTER TABLE n_table
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


ALTER TABLE sr_comment
	ADD FOREIGN KEY (sr_numUidt)
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


ALTER TABLE Reserve
	ADD FOREIGN KEY (t_uid)
	REFERENCES t_detail (t_uid)
;



/* Create Views */

CREATE OR REPLACE VIEW v_book
AS
SELECT
a.p_uid
, a.p_startTime
, a.p_endTime
, a.tid
, TO_CHAR(a.p_startTime, 'YYYY-MM-DD') AS "b_sdate"
, TO_CHAR(a.p_startTime, 'HH24:MI:SS') AS "b_stime"
, TO_CHAR(a.p_endTime, 'HH24:MI:SS') AS "b_etime"
, ROUND((a.p_endTime-a.p_startTime)*24) AS "b_term"
, ROUND((a.p_startTime-SYSDATE)*24) AS "b_duration"
, CASE WHEN ROUND((a.p_startTime-SYSDATE)*24) >= 2 THEN '1' ELSE '0' END AS "b_refund"
, a.total_amount
, a.pay_date
, TO_CHAR(a.pay_date, 'YYYY-MM-DD') AS "b_date"
, a.p_cancel
, b.m_uid
, b.m_email
, b.m_nick
, b.m_name
, b.m_grade
, c.t_uid
, CASE WHEN SUBSTR(c.t_uid, 1, 1) = 1 THEN '스터디룸' ELSE '좌석' END AS "b_seatType"
, c.t_name
, c.t_pay
, c.t_maxnum
FROM Reserve a, m_user b, t_detail c
WHERE a.m_uid = b.m_uid
AND a.t_uid = c.t_uid
;



