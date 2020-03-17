-- Trello 테이블 - 하는 중(/my trello/T_doing)
CREATE TABLE T_doing(
	num NUMBER PRIMARY KEY,
	title VARCHAR2(100), 
	content VARCHAR2(100),
	regdate DATE DEFAULT SYSDATE
);

-- Trello 테이블 - 할 일(/my trello/T_todo)
CREATE TABLE T_todo(
	num NUMBER PRIMARY KEY,
	title VARCHAR2(100), 
	content VARCHAR2(100),
	regdate DATE DEFAULT SYSDATE
);

-- Trello 테이블 - 완료(/my trello/T_done)
CREATE TABLE T_done(
	num NUMBER PRIMARY KEY,
	title VARCHAR2(100), 
	content VARCHAR2(100),
	regdate DATE DEFAULT SYSDATE
);

-- 상품 테이블
CREATE TABLE T_product(
	code NUMBER PRIMARY KEY, 						--상품번호
	name VARCHAR2(100) DEFAULT 0, 					--상품이름
	price NUMBER DEFAULT 0, 						--상품가격
	content VARCHAR2(3000),							--상품에 대한 설명
	image VARCHAR2(150) DEFAULT 'default_pdt.jpg'	--상품 이미지
	sold VARCHAR2(1) DEFAULT 'n'					--품절 여부
);
-- 상품 시퀀스 
CREATE SEQUENCE T_product_seq
	START WITH 1
	INCREMENT BY 1
	NOMAXVALUE
	NOCYCLE;
		
-- 장바구니 테이블
CREATE TABLE T_cart(
	c_num NUMBER PRIMARY KEY,		--주문번호
	userid VARCHAR2(100),			--(FK) 회원 아이디 : T_user의 id 참조
	code NUMBER,					--(FK) 상품 코드 : T_product의 code 참조
	quantity NUMBER DEFAULT 1,		--주문수량
	result CHAR(1) DEFAULT 1,		--처리 완료 여부 (1:미처리, 2:처리)
	regdate DATE DEFAULT SYSDATE	--등록일 (장바구니에 담은 날짜)
);
	
-- 장바구니 테이블 시퀀스
CREATE SEQUENCE T_cart_seq
	START WITH 1
	INCREMENT BY 1
	NOMAXVALUE 
	NOCYCLE ;

-- T_cart 제약조건 추가 (userid & code)
ALTER TABLE T_cart
ADD CONSTRAINT T_cart_userid_fk FOREIGN KEY(userid)
REFERENCES T_user(userid) ON DELETE CASCADE;

ALTER TABLE T_cart
ADD CONSTRAINT T_cart_code_fk FOREIGN KEY(code)
REFERENCES T_user(code) ON DELETE CASCADE;

-- 주문 테이블
CREATE TABLE T_order(
	o_num NUMBER PRIMARY KEY,		--주문번호
	userid VARCHAR2(100),			--(FK) 주문자 아이디
	regdate DATE DEFAULT SYSDATE	--등록일 (주문한 날짜)
);

CREATE SEQUENCE T_order_seq
	START WITH 1
	INCREMENT BY 1
	NOMAXVALUE 
	NOCYCLE ;

-- T_order 제약조건 추가 (userid)
ALTER TABLE T_order
ADD CONSTRAINT T_order_userid_fk FOREIGN KEY (userid)
REFERENCES T_user(userid) ON DELETE CASCADE;

-- 주문 상세 테이블
CREATE TABLE T_order_detail(
	od_num NUMBER PRIMARY KEY,		--주문 상세 번호
	o_num NUMBER,					--(FK) 주문번호 : T_order의 o_num(PK) 참조
	code NUMBER, 					--(FK) 상품번호 : T_product의 code(PK) 참조
	quantity NUMBER,				--주문수량
	result CHAR(1) DEFAULT 1		--처리 완료 여부 (1:미처리, 2:처리)
);

CREATE SEQUENCE T_order_detail_seq
	START WITH 1
	INCREMENT BY 1
	NOMAXVALUE 
	NOCACHE 
	NOCYCLE ;

-- T_order_detail 제약조건 추가 (o_num & code)
ALTER TABLE T_order_detail
ADD CONSTRAINT T_order_detail_o_num_fk FOREIGN KEY (o_num)
REFERENCES T_order(o_num) ON DELETE CASCADE;

ALTER TABLE T_order_detail
ADD CONSTRAINT T_order_detail_code_fk FOREIGN KEY (code)
REFERENCES T_product(code) ON DELETE CASCADE;

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

INSERT INTO T_emp 		--admin계정용 가상 사원 생성
(empno, ename, hdate, pnum)
VALUES(1001010001, 'admin', to_date('1001.01.01', 'yyyy.mm.dd'), '01012345678');

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
 
 --Message table 
CREATE TABLE T_msg( 
num NUMBER PRIMARY KEY,		-- 관리용 넘버(유저한테 안보여줌)
idSend VARCHAR2(100) NOT NULL,	-- 보낸사람 id
idRec VARCHAR2(100) NOT NULL,	-- 받는사람 id
title VARCHAR2(100) NOT NULL,	-- 메시지 제목
content CLOB,	--메시지 내용
sendDate DATE,	--보낸 시간
readDate DATE,	--읽은 시간
sendDel VARCHAR2(100),	--보낸사람 목록에서 삭제했는지 여부
recDel VARCHAR2(100)	--받는사람 목록에서 삭제했는지 여부
);
--message sequence
CREATE SEQUENCE T_msg_seq;

-- 건의 게시판 테이블
CREATE TABLE T_suggest(
num NUMBER PRIMARY KEY, -- 건의 게시판 관리 할 번호
sugId VARCHAR2(100),     -- 건의자 아이디
profile VARCHAR2(100),   -- 건의자 프로필
sugContent VARCHAR2(500),-- 건의 내용
regdate DATE            -- 건의 날짜
);
-- 건의 게시판 시퀀스
CREATE SEQUENCE T_suggest_seq;
