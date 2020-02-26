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

