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
