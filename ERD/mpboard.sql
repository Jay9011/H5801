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

SELECT s.s_uid, s.s_title, s.s_content, s.s_date
FROM s_table s, sr_comment sc
WHERE s.s_uid = sc.s_uid AND sc.m_uid = 2;

--내가 찜한 게시물
SELECT * FROM s_favor;

SELECT s.s_uid , s.s_title, s.s_content, s.s_date 
FROM s_favor sf, s_table s
WHERE sf.s_uid = s.s_uid AND sf.m_uid = 3;