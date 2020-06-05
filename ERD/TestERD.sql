SELECT c.*, u.M_NICK
FROM sr_comment c, m_user u
WHERE c.m_uid = u.m_uid AND s_uid = 52
ORDER BY sr_group, sr_depth;