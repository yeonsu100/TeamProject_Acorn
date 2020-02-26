-- TeamProject_Acorn SQL 파일입니다

CREATE TABLE T_file(
num	NUMBER PRIMARY KEY,
writer VARCHAR2(100),
title VARCHAR2(100) NOT NULL,
orgFileName VARCHAR2(100) NOT NULL,
saveFileName VARCHAR2(100) NOT NULL,
fileSize NUMBER,
downCount NUMBER DEFAULT 0,
regdate DATE
);

CREATE SEQUENCE T_file_seq;

CREATE TABLE T_notice(
num NUMBER PRIMARY KEY,       -- 글 번호
writer VARCHAR2(100) NOT NULL,  -- 글 작성자
title VARCHAR2(100) NOT NULL,  -- 공지사항 제목
content CLOB,		       -- 공지사항 내용
viewCount NUMBER,                 -- 조회수
regdate DATE 	                   -- 작성 날짜
);

CREATE SEQUENCE T_notice_seq;
