CREATE TABLE tbl_interaction (
	interaction_id INT PRIMARY KEY AUTO_INCREMENT,
	pno INT,
	user_id VARCHAR(20),
	like_status BOOLEAN,
	dislike_status BOOLEAN,
	interacted_at TIMESTAMP,
	FOREIGN KEY (pno) REFERENCES tbl_post(pno) ON DELETE CASCADE,
	FOREIGN KEY (user_id) REFERENCES tbl_user(user_id) ON DELETE CASCADE
);

CREATE TABLE tbl_comment (
	cno INT PRIMARY KEY AUTO_INCREMENT,
	image VARCHAR(50),
	pno INT ,
	user_id varchar(20),
	content VARCHAR(3000),
	created_at TIMESTAMP,
	updated_at TIMESTAMP,
	FOREIGN KEY (pno) REFERENCES tbl_post(pno) ON DELETE CASCADE,
	FOREIGN KEY (user_id) REFERENCES tbl_user(user_id) ON DELETE CASCADE
);

CREATE TABLE tbl_post (
	pno INT PRIMARY KEY AUTO_INCREMENT,
	user_id VARCHAR(20),
	title VARCHAR(30),
	created_at TIMESTAMP,
	updated_at TIMESTAMP,
	content VARCHAR(16000),
	trailer VARCHAR(50),
	FOREIGN KEY (user_id) REFERENCES tbl_user(user_id) ON DELETE CASCADE
);


INSERT INTO tbl_interaction(pno, user_id, like_status, dislike_status, interacted_at)
VALUES(85, 'user1', true, false, CURRENT_TIMESTAMP());
INSERT INTO tbl_interaction(pno, user_id, like_status, dislike_status, interacted_at)
VALUES(85, 'user2', true, false, CURRENT_TIMESTAMP());
INSERT INTO tbl_interaction(pno, user_id, like_status, dislike_status, interacted_at)
VALUES(85, 'user3', true, false, CURRENT_TIMESTAMP());
INSERT INTO tbl_interaction(pno, user_id, like_status, dislike_status, interacted_at)
VALUES(85, 'user5', true, false, CURRENT_TIMESTAMP());

INSERT INTO tbl_interaction(pno, user_id, like_status, dislike_status, interacted_at)
VALUES(100, 'user1', true, false, CURRENT_TIMESTAMP());
INSERT INTO tbl_interaction(pno, user_id, like_status, dislike_status, interacted_at)
VALUES(100, 'user2', true, false, CURRENT_TIMESTAMP());
INSERT INTO tbl_interaction(pno, user_id, like_status, dislike_status, interacted_at)
VALUES(100, 'user5', FALSE, TRUE, CURRENT_TIMESTAMP());



SELECT p.pno, p.writer, u.nickname, p.title, p.created_at, p.updated_at, u.grade,
COUNT(DISTINCT i.interaction_id) AS view_count, COUNT(DISTINCT c.cno) AS comment_count,
COUNT(DISTINCT case when i.like_status = 1 then i.interaction_id END) AS like_count
FROM tbl_post AS p JOIN tbl_user AS u ON p.writer = u.user_id
LEFT JOIN tbl_interaction AS i ON p.pno = i.pno
LEFT JOIN tbl_comment AS c ON c.post = p.pno
GROUP BY p.pno
ORDER BY comment_count ASC;

SELECT p.*, u.nickname, u.grade,
COUNT(DISTINCT i.interaction_id) AS view_count,
COUNT(DISTINCT case when i.like_status = 1 then i.interaction_id END) AS like_count,
COUNT(DISTINCT case when i.dislike_status = 1 then i.interaction_id END) AS dislike_count
FROM tbl_post AS p JOIN tbl_user AS u ON p.writer = u.user_id
LEFT JOIN tbl_interaction AS i ON i.pno = p.pno
WHERE p.pno = 85

INSERT INTO tbl_interaction(pno, user_id, interacted_at)
VALUES (?, ?, CURRENT_TIMESTAMP())

SELECT p.pno, p.user_id, u.nickname, p.title, p.created_at, p.updated_at, u.grade, 
COUNT(DISTINCT i.interaction_id) AS view_count, COUNT(DISTINCT c.cno) AS comment_count, 
COUNT(DISTINCT case when i.like_status = 1 then i.interaction_id END) AS like_count 
FROM tbl_post AS p JOIN tbl_user AS u ON p.user_id = u.user_id
LEFT JOIN tbl_interaction AS i ON p.pno = i.pno
LEFT JOIN tbl_comment AS c ON c.pno = p.pno 
WHERE p.user_id = 'user1'
GROUP BY p.pno
ORDER BY created_at DESC


SELECT c.cno, p.pno, p.title, c.created_at, c.updated_at
FROM tbl_comment AS c, tbl_post AS p
WHERE c.pno = p.pno AND c.user_id = 'user1';


SELECT i.interaction_id, i.like_status, i.interacted_at, p.pno, p.title
FROM tbl_interaction AS i, tbl_post AS p
WHERE i.pno = p.pno AND i.user_id = 'user1';



SELECT p.*, u.nickname, u.grade,
COUNT(DISTINCT i.interaction_id) AS view_count,
COUNT(DISTINCT case when i.like_status = 1 then i.interaction_id END) AS like_count,
COUNT(DISTINCT case when i.dislike_status = 1 then i.interaction_id END) AS dislike_count
FROM tbl_post AS p JOIN tbl_user AS u ON p.user_id = u.user_id
LEFT JOIN tbl_interaction AS i ON i.pno = p.pno
WHERE p.pno = 15
