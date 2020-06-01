SELECT * FROM s_table;
SELECT m_uid FROM s_table WHERE m_uid=2;

--내가 쓴 게시글
SELECT s_uid, s_title, s_content, s_date FROM s_table WHERE m_uid=2;
SELECT s_uid, s_title, s_content, s_date FROM s_table WHERE m_uid=?;

--내가 댓글 단 게시물 (삭제여부 1:true, 0:false)
SELECT * FROM s_table;
SELECT * FROM sr_comment;
INSERT INTO sr_comment(SR_NUMUID, SR_GROUP, SR_DEPTH, SR_COM, SR_DATE , SR_UDATE ,SR_DELETED ,S_UID ,M_UID  )
VALUES (SEQ_sr_comment_sr_numUid.NEXTVAL, SEQ_sr_comment_sr_numUid.CURRVAL, 0, '안녕', to_date('1990-11-07', 'yyyy-mm-dd'), to_date('1990-11-07', 'yyyy-mm-dd'), 1, 1, 3);
INSERT INTO sr_comment(SR_NUMUID, SR_GROUP, SR_DEPTH, SR_COM, SR_DATE , SR_UDATE ,SR_DELETED ,S_UID ,M_UID  )
VALUES (SEQ_sr_comment_sr_numUid.NEXTVAL, 9, 1, '안녕', to_date('1990-11-07', 'yyyy-mm-dd'), to_date('1990-11-07', 'yyyy-mm-dd'), 1, 2, 2);


SELECT * FROM sr_comment
WHERE m_uid=3;

SELECT * FROM s_table
WHERE s_uid=1;

SELECT t.s_uid, t.s_title, t.s_content, t.s_date, t.M_UID, sc.M_UID
FROM s_table t, SR_COMMENT sc  
WHERE t.S_UID = sc.S_UID AND sc.M_UID = 3;

--내가 찜한 게시물
SELECT * FROM s_favor;

SELECT s.S_UID , s.S_TITLE 
FROM s_favor st, s_table s
WHERE st.S_UID = s.S_UID AND st.M_UID = 3;