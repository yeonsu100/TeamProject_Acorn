--게시판 테이블--
CREATE TABLE aboard_cafe(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
content CLOB, 
viewCount NUMBER, --조회수
likeCount NUMBER, --추천수 
regdate DATE
);


CREATE SEQUENCE aboard_cafe_seq;

--게시판 댓글 정보 테이블--
CREATE TABLE aboard_cafe_comment(
num NUMBER PRIMARY KEY,  --댓글의 글번호
writer VARCHAR2(100), 
content VARCHAR2(500), 
target_id VARCHAR2(100), --댓글의 대상이 되는 아이디(글작성자)
ref_group NUMBER,  --댓글의 그룹번호
comment_group NUMBER, --원글에 달린 댓글 내에서의 그룹번호
deleted CHAR(3) DEFAULT 'no', --댓글이 삭제되었는지 여부
regdate DATE --댓글 등록일
);
+CREATE SEQUENCE aboard_cafe_comment_seq;

