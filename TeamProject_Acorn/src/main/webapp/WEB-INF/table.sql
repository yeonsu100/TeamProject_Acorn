-- TeamProject_Acorn SQL 파일입니다

-- 사원 table
CREATE TABLE T_emp(
	empno NUMBER PRIMARY KEY,  --사번, 입사년월+4자리 시퀀스숫자로 넣을예정
	ename VARCHAR2(100),  --사원 이름
	hdate DATE,  --입사일
	pnum VARCHAR2(100) --전화번호
);

CREATE SEQUENCE T_emp_seq
	MAXVALUE 9999
	CYCLE;	--사번생성용 시퀀스. 1~9999까지 증가한 후 다시 1로 초기화. 1년에 신입사원 1만명 넘으면 자릿수부터 수정필요

-- user table
CREATE TABLE T_user(
	empno NUMBER PRIMARY KEY,  --사번. emp테이블에서 생성된거 회원가입시 자동입력시킬예정
	userid VARCHAR2(100) NOT NULL,  --유저 계정
	pwd VARCHAR2(100) NOT NULL,		--유저 비번
	email VARCHAR2(100) NOT NULL,	--사내 email 생성
	profile VARCHAR2(100),			--프로필이미지용
	isadmin VARCHAR2(100)			--admin일경우 관리자, null일경우 일반회원계정
);

INSERT INTO T_user 		--admin계정 생성
(empno, userid, pwd, email, isadmin)
VALUES(1, admin, admin, admin@acorn.com, admin);

-- 파일 시스템 table
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


