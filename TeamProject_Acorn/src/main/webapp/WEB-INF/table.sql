-- TeamProject_Acorn SQL 파일입니다

-- 사원 table
CREATE TABLE T_emp(
	empno NUMBER PRIMARY KEY,  --사번, 입사년월+4자리 시퀀스숫자로 넣을예정
	ename VARCHAR2(100),  --사원 이름
	hdate VARCHAR2(100),  --입사일
	phoneno VARCHAR2(100) --전화번호
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

-- 공지사항 table
CREATE TABLE T_notice(
num NUMBER PRIMARY KEY,       -- 글 번호
writer VARCHAR2(100) NOT NULL,  -- 글 작성자
title VARCHAR2(100) NOT NULL,  -- 공지사항 제목
content CLOB,		       -- 공지사항 내용
viewCount NUMBER,                 -- 조회수
regdate DATE 	                   -- 작성 날짜
);

CREATE SEQUENCE T_notice_seq;

--게시판 table 
CREATE TABLE T_board( 
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
content CLOB,
viewCount NUMBER,
likeCount NUMBER, --추천수
regdate DATE
);

 CREATE SEQUENCE T_board_seq;
 
 --게시판 댓글 정보 테이블
CREATE TABLE T_board_comment(
num NUMBER PRIMARY KEY, -- 댓글의 글번호
writer VARCHAR2(100),
content VARCHAR2(500),
target_id VARCHAR2(100), -- 댓글의 대상이 되는 아이디 (글작성자)
ref_group NUMBER, --댓글의 그룹번호
comment_group NUMBER, --원글의 달린 댓글 내에서의 그룹번호
deleted CHAR(3) DEFAULT 'no', -- 댓글이 삭제 되었는지 여부
profile VARCHAR2(100), -- 프로필
regdate DATE -- 댓글 등록일
 );
 
 CREATE SEQUENCE T_board_comment_seq;