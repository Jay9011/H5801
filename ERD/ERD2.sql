SELECT * FROM M_USER;
SELECT * FROM MF_FILE;
SELECT * FROM N_TABLE ;
SELECT * FROM FAQ;
SELECT * FROM S_TABLE;
SELECT * FROM SR_COMMENT;
SELECT * FROM SR_FILE;
SELECT * FROM S_FAVOR;
SELECT * FROM S_CATEGORY;
SELECT * FROM T_DETAIL;
SELECT * FROM RESERVE;

SELECT * FROM ALL_TABLES;
/* Drop Tables */

DROP TABLE faq CASCADE CONSTRAINTS;
DROP TABLE mf_file CASCADE CONSTRAINTS;
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

DROP SEQUENCE SEQ_mf_file_mf_uid;
DROP SEQUENCE SEQ_m_user_m_uid;
DROP SEQUENCE SEQ_s_table_s_uid;
DROP SEQUENCE SEQ_t_detail_t_uid;
DROP SEQUENCE SEQ_Reserve_p_uid;
DROP SEQUENCE SEQ_Reserve_partner_order_id;
DROP SEQUENCE SEQ_n_table_n_uid;
DROP SEQUENCE SEQ_faq_f_uid;
DROP SEQUENCE SEQ_sr_file_srf_uid;
DROP SEQUENCE SEQ_sr_comment_sr_numUid;



/* Create Sequences */

CREATE SEQUENCE SEQ_mf_file_mf_uid INCREMENT BY 1 START WITH 1;
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


CREATE TABLE mf_file
(
	mf_uid number NOT NULL,
	mf_name varchar2(60) NOT NULL,
	mf_data blob,
	mf_url clob,
	mf_date date DEFAULT SYSDATE,
	m_uid number NOT NULL,
	PRIMARY KEY (mf_uid)
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
	m_grade number DEFAULT 1 NOT NULL,
	m_addressB varchar2(150),
	m_SMSOk number,
	m_profile blob,
	m_link clob DEFAULT 'IMAGES/unknown.gif',
	PRIMARY KEY (m_uid)
);


CREATE TABLE n_table
(
	n_uid number NOT NULL,
	n_title varchar2(60) NOT NULL,
	n_content clob NOT NULL,
	n_viewCnt NUMBER DEFAULT 0,
	n_date DATE DEFAULT SYSDATE,
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
	sr_depth number DEFAULT 0 NOT NULL,
	sr_com clob NOT NULL,
	sr_date date DEFAULT SYSDATE NOT NULL,
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


CREATE TABLE s_table
(
	s_uid number NOT NULL,
	s_title varchar2(60) NOT NULL,
	s_content clob NOT NULL,
	s_date date DEFAULT SYSDATE,
	s_udate date DEFAULT SYSDATE,
	s_viewCnt NUMBER DEFAULT 0 NOT NULL,
	sc_uid number NOT NULL,
	m_uid number NOT NULL,
	PRIMARY KEY (s_uid)
);


CREATE TABLE t_detail
(
	t_uid number NOT NULL,
	t_name varchar2(60) NOT NULL,
	t_pay number DEFAULT 0 NOT NULL,
	t_maxnum number DEFAULT 0,
	PRIMARY KEY (t_uid)
);



/* Create Foreign Keys */

ALTER TABLE mf_file
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid) ON DELETE CASCADE
;


ALTER TABLE n_table
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid) ON DELETE CASCADE
;


ALTER TABLE Reserve
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid) ON DELETE CASCADE
;


ALTER TABLE sr_comment
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid) ON DELETE CASCADE
;


ALTER TABLE s_favor
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid) ON DELETE CASCADE
;


ALTER TABLE s_table
	ADD FOREIGN KEY (m_uid)
	REFERENCES m_user (m_uid) ON DELETE CASCADE
;


ALTER TABLE sr_comment
	ADD FOREIGN KEY (sr_numUidt)
	REFERENCES sr_comment (sr_numUid) ON DELETE CASCADE
;


ALTER TABLE sr_file
	ADD FOREIGN KEY (sr_numUid)
	REFERENCES sr_comment (sr_numUid) ON DELETE CASCADE
;


ALTER TABLE s_table
	ADD FOREIGN KEY (sc_uid)
	REFERENCES s_category (sc_uid)
;


ALTER TABLE sr_comment
	ADD FOREIGN KEY (s_uid)
	REFERENCES s_table (s_uid) ON DELETE CASCADE
;


ALTER TABLE s_favor
	ADD FOREIGN KEY (s_uid)
	REFERENCES s_table (s_uid) ON DELETE CASCADE
;


ALTER TABLE Reserve
	ADD FOREIGN KEY (t_uid)
	REFERENCES t_detail (t_uid)
;

INSERT INTO M_USER (m_uid, m_name, m_nick, m_email, m_pw, m_birth, m_gender, m_phoneNum, m_SMSOk, m_addressA, m_grade)
	VALUES (SEQ_m_user_m_uid.NEXTVAL, '관리자', 'admin', 'admin@gmail.com', '1234', to_date('1990-11-07', 'yyyy-mm-dd'), '남자', '010-1111-1111', 1, '어딘가에', 9);
INSERT INTO M_USER (m_uid, m_name, m_nick, m_email, m_pw, m_birth, m_gender, m_phoneNum, m_SMSOk, m_addressA)
	VALUES (SEQ_m_user_m_uid.NEXTVAL, '윤종섭', 'whdtjq', 'test@gmail.com', '1234', to_date('1990-11-07', 'yyyy-mm-dd'), '남자', '010-1111-1111', 1, '인천광역시 서구');
INSERT INTO M_USER (m_uid, m_name, m_nick, m_email, m_pw, m_birth, m_gender, m_phoneNum, m_SMSOk, m_addressA)
	VALUES (SEQ_m_user_m_uid.NEXTVAL, '김재현', 'wogus', 'wogus@gmail.com', 'qwer', to_date('1996-05-27', 'yyyy-mm-dd'), '남자', '010-1111-1111', 1, '경기도 수원');
INSERT INTO M_USER (m_uid, m_name, m_nick, m_email, m_pw, m_birth, m_gender, m_phoneNum, m_SMSOk, m_addressA)
	VALUES (SEQ_m_user_m_uid.NEXTVAL, '윤지우', 'jiwoo', 'jiwoo@gmail.com', '1q2w', to_date('1994-10-11', 'yyyy-mm-dd'), '남자', '010-1111-1111', 1, '서울특별시 금천구');
INSERT INTO M_USER (m_uid, m_name, m_nick, m_email, m_pw, m_birth, m_gender, m_phoneNum, m_SMSOk, m_addressA)
	VALUES (SEQ_m_user_m_uid.NEXTVAL, '주낙경', 'joo', 'joo@gmail.com', 'asdf@#', to_date('1991-04-07', 'yyyy-mm-dd'), '남자', '010-1111-1111', 1, '서울특별시 강남구');
INSERT INTO M_USER (m_uid, m_name, m_nick, m_email, m_pw, m_birth, m_gender, m_phoneNum, m_SMSOk, m_addressA)
	VALUES (SEQ_m_user_m_uid.NEXTVAL, '한수빈', 'subin', 'subin@gmail.com', 'mb^&12', to_date('96-12-23', 'yy-mm-dd'), '여자', 01055555555, 1, '경기도 성남');
INSERT INTO M_USER (m_uid, m_name, m_nick, m_email, m_pw, m_birth, m_gender, m_phoneNum, m_SMSOk, m_addressA)
	VALUES (SEQ_m_user_m_uid.NEXTVAL, '테스터', 'test', 'damianju1015@gmail.com', '1234', to_date('91-04-07', 'yy-mm-dd'), '남자', 01044444444, 1, '서울특별시 강남구');


INSERT INTO N_TABLE (n_uid, n_title, n_content, m_uid)
	VALUES (SEQ_n_table_n_uid.NEXTVAL, '첫번째 공지사항', '냉무', 1);
INSERT INTO N_TABLE (n_uid, n_title, n_content, m_uid)
	VALUES (SEQ_n_table_n_uid.NEXTVAL, '두번째 공지사항', '냉무', 1);
INSERT INTO N_TABLE (n_uid, n_title, n_content, m_uid)
	VALUES (SEQ_n_table_n_uid.NEXTVAL, '세번째 공지사항', '냉무', 1);
INSERT INTO N_TABLE (n_uid, n_title, n_content, m_uid)
	VALUES (SEQ_n_table_n_uid.NEXTVAL, '네번째 공지사항', '냉무', 1);
INSERT INTO N_TABLE (n_uid, n_title, n_content, m_uid)
	VALUES (SEQ_n_table_n_uid.NEXTVAL, '다섯번째 공지사항', '냉무', 1);
INSERT INTO N_TABLE (n_uid, n_title, n_content, m_uid)
	VALUES (SEQ_n_table_n_uid.NEXTVAL, '여섯번째 공지사항', '냉무', 1);
INSERT INTO N_TABLE (n_uid, n_title, n_content, m_uid)
	VALUES (SEQ_n_table_n_uid.NEXTVAL, '일곱번째 공지사항', '냉무', 1);
INSERT INTO N_TABLE (n_uid, n_title, n_content, m_uid) SELECT SEQ_n_table_n_uid.NEXTVAL, n_title, n_content, m_uid FROM N_TABLE;
INSERT INTO N_TABLE (n_uid, n_title, n_content, m_uid) SELECT SEQ_n_table_n_uid.NEXTVAL, n_title, n_content, m_uid FROM N_TABLE;
INSERT INTO N_TABLE (n_uid, n_title, n_content, m_uid) SELECT SEQ_n_table_n_uid.NEXTVAL, n_title, n_content, m_uid FROM N_TABLE;

INSERT INTO faq (f_uid, f_title, f_content)
	VALUES (SEQ_faq_f_uid.NEXTVAL, '제일 많이 궁금해 하는 내용', '이건 어떻게 구현해야 할까?');
INSERT INTO faq (f_uid, f_title, f_content)
	VALUES (SEQ_faq_f_uid.NEXTVAL, '전혀 궁금하지 않은 내용', '나는 누굴까?');
INSERT INTO faq (f_uid, f_title, f_content)
	VALUES (SEQ_faq_f_uid.NEXTVAL, '고민 되는 내용', '오늘 뭐먹지?');

INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (001, '4-person room', 140000, 4);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (002, '6-person room', 180000, 6);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (003, '8-person room', 220000, 8);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (005, '-time seating', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (101, '1', 170000, 6);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (102, '2', 170000, 6);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (103, '3', 140000, 4);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (104, '4', 220000, 8);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (105, '5', 140000, 4);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (201, '1', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (202, '2', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (203, '3', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (204, '4', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (205, '5', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (206, '6', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (207, '7', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (208, '8', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (209, '9', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (210, '10', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (211, '11', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (212, '12', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (213, '13', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (214, '14', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (215, '15', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (216, '16', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (217, '17', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (218, '18', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (219, '19', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (220, '20', 9000, 1);
INSERT INTO T_DETAIL (t_uid, t_name, t_pay, t_maxnum)
	VALUES (221, '21', 9000, 1);

INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid)
	VALUES (SEQ_Reserve_p_uid.NEXTVAL, to_date('2020-06-09 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), to_date('2020-06-10 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), 'null', '좌석예약', 17000, 17000, to_date('2020-05-29 17:20:10', 'yyyy-mm-dd hh24:MI:ss'), 0, 2, 101);
INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid)
	VALUES (SEQ_Reserve_p_uid.NEXTVAL, to_date('2020-06-09 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), to_date('2020-06-10 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), 'null', '좌석예약', 17000, 17000, to_date('2020-05-30 18:20:10', 'yyyy-mm-dd hh24:MI:ss'), 0, 2, 102);
INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid)
	VALUES (SEQ_Reserve_p_uid.NEXTVAL, to_date('2020-06-09 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), to_date('2020-06-10 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), 'null', '좌석예약', 22000, 22000, to_date('2020-05-15 12:20:10', 'yyyy-mm-dd hh24:MI:ss'), 0, 2, 104);
INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid)
	VALUES (SEQ_Reserve_p_uid.NEXTVAL, to_date('2020-06-10 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), to_date('2020-06-11 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), 'null', '좌석예약', 17000, 17000, to_date('2020-05-25 13:20:10', 'yyyy-mm-dd hh24:MI:ss'), 0, 2, 101);
INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid)
	VALUES (SEQ_Reserve_p_uid.NEXTVAL, to_date('2020-06-10 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), to_date('2020-06-11 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), 'null', '좌석예약', 14000, 14000, to_date('2020-05-28 10:20:10', 'yyyy-mm-dd hh24:MI:ss'), 0, 2, 103);
INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid)
	VALUES (SEQ_Reserve_p_uid.NEXTVAL, to_date('2020-06-11 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), to_date('2020-06-12 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), 'null', '좌석예약', 17000, 17000, to_date('2020-05-29 17:20:10', 'yyyy-mm-dd hh24:MI:ss'), 0, 2, 101);
/*(낙경) 예약 데이터 추가: 페이징 구현*/
INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid)
	VALUES (SEQ_Reserve_p_uid.NEXTVAL, to_date('2020-06-30 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), to_date('2020-06-04 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), 'null', '좌석예약', 17000, 17000, to_date('2020-05-29 17:20:10', 'yyyy-mm-dd hh24:MI:ss'), 0, 4, 101);
INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid)
	VALUES (SEQ_Reserve_p_uid.NEXTVAL, to_date('2020-06-30 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), to_date('2020-06-07 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), 'null', '좌석예약', 17000, 17000, to_date('2020-05-29 17:20:10', 'yyyy-mm-dd hh24:MI:ss'), 0, 4, 101);
INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid)
	VALUES (SEQ_Reserve_p_uid.NEXTVAL, to_date('2020-07-01 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), to_date('2020-06-09 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), 'null', '좌석예약', 17000, 17000, to_date('2020-05-29 17:20:10', 'yyyy-mm-dd hh24:MI:ss'), 0, 4, 101);
INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid)
	VALUES (SEQ_Reserve_p_uid.NEXTVAL, to_date('2020-07-03 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), to_date('2020-06-05 05:00:00', 'yyyy-mm-dd hh24:MI:ss'), 'null', '좌석예약', 17000, 17000, to_date('2020-05-29 17:20:10', 'yyyy-mm-dd hh24:MI:ss'), 0, 4, 103);
INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid)
	VALUES (SEQ_Reserve_p_uid.NEXTVAL, to_date('2020-07-03 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), to_date('2020-06-29 07:00:00', 'yyyy-mm-dd hh24:MI:ss'), 'null', '좌석예약', 17000, 17000, to_date('2020-05-29 17:20:10', 'yyyy-mm-dd hh24:MI:ss'), 0, 4, 102);
INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid)
	VALUES (SEQ_Reserve_p_uid.NEXTVAL, to_date('2020-07-03 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), to_date('2020-06-20 09:00:00', 'yyyy-mm-dd hh24:MI:ss'), 'null', '좌석예약', 17000, 17000, to_date('2020-05-29 17:20:10', 'yyyy-mm-dd hh24:MI:ss'), 0, 4, 101);
INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid)
	VALUES (SEQ_Reserve_p_uid.NEXTVAL, to_date('2020-08-03 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), to_date('2020-06-11 10:00:00', 'yyyy-mm-dd hh24:MI:ss'), 'null', '좌석예약', 17000, 17000, to_date('2020-05-29 17:20:10', 'yyyy-mm-dd hh24:MI:ss'), 0, 4, 101);
INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid)
	VALUES (SEQ_Reserve_p_uid.NEXTVAL, to_date('2020-09-03 00:00:00', 'yyyy-mm-dd hh24:MI:ss'), to_date('2020-06-21 11:00:00', 'yyyy-mm-dd hh24:MI:ss'), 'null', '좌석예약', 17000, 17000, to_date('2020-05-29 17:20:10', 'yyyy-mm-dd hh24:MI:ss'), 0, 4, 102);



-- 다량의 데이터 필요
SELECT * FROM RESERVE ORDER BY p_uid DESC;

INSERT INTO RESERVE (p_uid, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid) SELECT SEQ_Reserve_p_uid.NEXTVAL, p_startTime, p_endTime, tid, item_name, total_amount, tax_free_amount, pay_date, p_cancel, m_uid, t_uid FROM RESERVE ;

DELETE FROM RESERVE WHERE SEQ_Reserve_p_uid.NEXTVAL >10;

INSERT INTO s_category (sc_uid, sc_name)
	VALUES (1, '중1');
INSERT INTO s_category (sc_uid, sc_name)
	VALUES (2, '중2');
INSERT INTO s_category (sc_uid, sc_name)
	VALUES (3, '중3');
INSERT INTO s_category (sc_uid, sc_name)
	VALUES (4, '고1');
INSERT INTO s_category (sc_uid, sc_name)
	VALUES (5, '고2');
INSERT INTO s_category (sc_uid, sc_name)
	VALUES (6, '고3');
INSERT INTO s_category (sc_uid, sc_name)
	VALUES (7, '대학생');

INSERT INTO s_table (s_uid, s_title, s_content, s_date, sc_uid, m_uid)
	VALUES (SEQ_s_table_s_uid.NEXTVAL, '현타아아아', '아아아아....', to_date('2020-05-30 00:01:10', 'yyyy-mm-dd hh24:MI:ss'), 1, 2);
INSERT INTO s_table (s_uid, s_title, s_content, s_date, sc_uid, m_uid)
	VALUES (SEQ_s_table_s_uid.NEXTVAL, '무슨 재미있는 일이 있을까?', '글쎄...', to_date('2020-05-30 00:04:10', 'yyyy-mm-dd hh24:MI:ss'), 2, 3);
INSERT INTO s_table (s_uid, s_title, s_content, s_date, sc_uid, m_uid)
	VALUES (SEQ_s_table_s_uid.NEXTVAL, 'test', 'test', to_date('2020-05-30 00:10:10', 'yyyy-mm-dd hh24:MI:ss'), 3, 2);
INSERT INTO s_table (s_uid, s_title, s_content, s_date, sc_uid, m_uid)
	VALUES (SEQ_s_table_s_uid.NEXTVAL, '아이스크림은?', '녹는다', to_date('2020-05-31 00:13:10', 'yyyy-mm-dd hh24:MI:ss'), 4, 4);
INSERT INTO s_table (s_uid, s_title, s_content, s_date, sc_uid, m_uid)
	VALUES (SEQ_s_table_s_uid.NEXTVAL, '나도...', '녹는다....', to_date('2020-05-31 00:18:10', 'yyyy-mm-dd hh24:MI:ss'), 5, 5);
INSERT INTO s_table (s_uid, s_title, s_content, s_date, sc_uid, m_uid)
	VALUES (SEQ_s_table_s_uid.NEXTVAL, '프로그래밍', '재밌지만!', to_date('2020-05-31 00:21:10', 'yyyy-mm-dd hh24:MI:ss'), 6, 6);
INSERT INTO s_table (s_uid, s_title, s_content, s_date, sc_uid, m_uid)
	VALUES (SEQ_s_table_s_uid.NEXTVAL, '아무거나', '쓰는거지 뭐', to_date('2020-06-01 00:09:10', 'yyyy-mm-dd hh24:MI:ss'), 7, 4);
INSERT INTO s_table (s_uid, s_title, s_content, s_date, sc_uid, m_uid) SELECT SEQ_s_table_s_uid.NEXTVAL, s_title, s_content, s_date, sc_uid, m_uid FROM s_table;
INSERT INTO s_table (s_uid, s_title, s_content, s_date, sc_uid, m_uid) SELECT SEQ_s_table_s_uid.NEXTVAL, s_title, s_content, s_date, sc_uid, m_uid FROM s_table;
INSERT INTO s_table (s_uid, s_title, s_content, s_date, sc_uid, m_uid) SELECT SEQ_s_table_s_uid.NEXTVAL, s_title, s_content, s_date, sc_uid, m_uid FROM s_table;


INSERT INTO S_FAVOR (m_uid, s_uid, sl_date)
	VALUES (2, 1, to_date('2020-06-01 00:09:10', 'yyyy-mm-dd hh24:MI:ss'));
INSERT INTO S_FAVOR (m_uid, s_uid, sl_date)
	VALUES (2, 2, to_date('2020-06-01 00:09:10', 'yyyy-mm-dd hh24:MI:ss'));
INSERT INTO S_FAVOR (m_uid, s_uid, sl_date)
	VALUES (2, 3, to_date('2020-06-01 00:09:10', 'yyyy-mm-dd hh24:MI:ss'));
INSERT INTO S_FAVOR (m_uid, s_uid, sl_date)
	VALUES (3, 1, to_date('2020-06-01 00:09:10', 'yyyy-mm-dd hh24:MI:ss'));
INSERT INTO S_FAVOR (m_uid, s_uid, sl_date)
	VALUES (4, 1, to_date('2020-06-01 00:09:10', 'yyyy-mm-dd hh24:MI:ss'));
INSERT INTO S_FAVOR (m_uid, s_uid, sl_date)
	VALUES (5, 1, to_date('2020-06-01 00:09:10', 'yyyy-mm-dd hh24:MI:ss'));
INSERT INTO S_FAVOR (m_uid, s_uid, sl_date)
	VALUES (6, 1, to_date('2020-06-01 00:09:10', 'yyyy-mm-dd hh24:MI:ss'));
SELECT * FROM m_user WHERE m_email ='admin@gmail.com';

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

SELECT * FROM v_book;

SELECT COUNT(*) FROM S_TABLE WHERE REGEXP_LIKE(S_TITLE||REGEXP_REPLACE(S_CONTENT ,'<(/)?(img|label|table|thead|tbody|tfoot|tr|td|p|br|div|span|font|strong|b)(.|\s|\t|\n|\r\n)*?>', '') , '아', 'i') AND SC_UID > 0;

SELECT * FROM
(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM s_table WHERE REGEXP_LIKE(S_TITLE||REGEXP_REPLACE(S_CONTENT ,'<(/)?(img|label|table|thead|tbody|tfoot|tr|td|p|br|div|span|font|strong|b)(.|\s|\t|\n|\r\n)*?>', '') , '글', 'i') AND SC_UID > 0  ORDER BY s_uid DESC) T)
WHERE RNUM >= 1 AND RNUM < 11

UPDATE M_USER SET m_nick = 'tn44', m_pw = '1313'  WHERE m_uid = 17;


SELECT ROWNUM, p_uid FROM v_book WHERE ROWNUM >= 1 AND ROWNUM < 1 + 5;
SELECT * FROM v_book ORDER BY p_uid DESC;
SELECT COUNT(*) FROM v_book;

SELECT * FROM T_DETAIL;
SELECT * FROM RESERVE WHERE TO_CHAR(P_STARTTIME ,'YYYY-MM-DD')='2020-06-01' AND P_CANCEL = 0;
