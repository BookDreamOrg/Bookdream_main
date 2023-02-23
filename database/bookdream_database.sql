create user bookdream identified by bookdream;
grant connect, resource, create view to bookdream;
connect bookdream/bookdream;

-- Table KEY 확인하기
SELECT uc.constraint_name, uc.table_name, ucc.column_name, uc.constraint_type, uc.r_constraint_name

FROM user_constraints uc, user_cons_columns ucc

WHERE uc.constraint_name = ucc.constraint_name;

-- Users Table
--------------------------------------------------------------------
-------------------------- USERS ------------------------------------
drop table USERS;
drop table kakao_table;

create table USERS (    
  USER_NO                 number(10)    not null,
  USER_ID                 varchar2(40)  UNIQUE,
  USER_PASSWORD           varchar2(20),
  USER_NAME               varchar2(50)  not null,
  USER_TEL                varchar2(20)  default '',
  USER_LEVEL              number(1)     default 0     check(USER_LEVEL in(0,1)),
  BLACKLIST_YN            varchar2(5)   default 'N'   check(BLACKLIST_YN in ('Y','N')),
  FLATFORM_TYPE           varchar2(50)  not null,
  USER_EMAIL              varchar2(50)  not null,
  USER_POINT              number(10)    default 10000,
  USER_REGDATE            date default sysdate,
  constraint PK_USER primary key (USER_NO)
);

-- BookDream User_ADDRESS 제거
alter table users drop column USER_ADDRESS;

-- USER_POINT 추가
alter table USERS add USER_POINT number(10) default 10000;

-- USER_REGDATE 추가(02/16추가)
alter table USERS add USER_REGDATE date default sysdate;

desc users;

drop sequence user_seq;
-- 번호를 자동으로 1부터 1씩 증가하도록 만듦
create sequence user_seq increment by 1 start with 1;
-- BookDream test 로그인 insert
insert into users(USER_NO, USER_ID, USER_PASSWORD, USER_NAME, FLATFORM_TYPE, USER_EMAIL) 
   values(user_seq.nextval,'test','test','test','BD','test@test.com');


insert into users(USER_NO, USER_ID, USER_PASSWORD, USER_NAME, FLATFORM_TYPE, USER_EMAIL) 
   values(user_seq.nextval,'sycha11','test','차승윤','BD','sycha112@naver.com');



insert into users(USER_NO, USER_ID, USER_PASSWORD, USER_NAME, FLATFORM_TYPE, USER_EMAIL) 
   values(user_seq.nextval,'test8151','tes434','차윤','BD','cy@naver.com');

select * from users;

commit;

-- Review Table
--------------------------------------------------------------------
-------------------------- REVIEW ------------------------------------
drop table review;

create table review(
review_no number(10) not null,
USER_ID  varchar2(20)  not null,
book_no number(10) not null,
REVIEW_CONTENT varchar2(1000) not null,
REVIEW_DATE date default sysdate,
REVIEW_RECOMMEND number(20),
REVIEW_STAR number(1) not null,
constraint pk_riview PRIMARY KEY (review_no)
);

-- review table fk user_id casecade
alter table review add constraint fk_review_user_id foreign key (user_id) references users (user_id) on delete cascade;

select * from review;

--------------------------------------------------------------------------------
------------------------------------ PAY ---------------------------------------
--------------------------------------------------------------------------------
drop table pay;

CREATE TABLE PAY (
    PAY_NO         number(10)   not null,
	PAY_METHOD     varchar2(20) not null,
    PAY_DATE       date         DEFAULT sysdate,
    DISCOUNT_PRICE number(10)   DEFAULT 0 not null,
    PAY_FEE        number(10)   not null,
    FINAL_PRICE    number(10)   not null,
    TOTAL_PRICE    number(10)   not null,
    SAVE_POINT     number(10)   DEFAULT 0 not null,
    USE_POINT      number(10)   DEFAULT 0,
    constraint PK_PAY primary key(PAY_NO)  
);
alter table pay add USE_POINT  number(10) DEFAULT 0;

select * from pay;  
commit;


-----------------------------------------------------------------------------
---------------------------------- ORDERS -----------------------------------
-----------------------------------------------------------------------------
drop table orders;

CREATE TABLE orders(
    order_no            number primary key,
    user_no             number references users (user_no) not null,
    pay_no              number references pay (pay_no) not null,
    order_name          varchar2(500)  not null,  
    order_comment       varchar2(400),
    order_date          date           DEFAULT sysdate,
    order_receiver      varchar2(20)   not null,
    order_address       varchar2(100)  not null,
    order_tel           varchar2(40)   not null,
    order_status        number(10)     default 0 not null
);
-- 02-15 추가
alter table orders add cancel_date  date DEFAULT '';

-- orders table fk user_no casecade
alter table orders drop constraint SYS_C007481;
alter table orders add constraint fk_orders_user_no foreign key (user_no) references users (user_no) on delete cascade;

select * from orders;

commit;

-------------------------------------------------------------------------------
---------------------------------- PARCHASE -----------------------------------
-------------------------------------------------------------------------------
drop table PURCHASE;

CREATE TABLE purchase (
    PURCHASE_NO number(10),
    USER_NO number(10),
    BOOK_NO number(10),
    ORDER_NO number(10),
    ORDER_ADDRESS varchar2(100),
    PRODUCT_COUNT number(10),
    constraint FK_PURCHASE primary key(PURCHASE_NO), 
    constraint FK_PURCHASE_USER_NO foreign key(USER_NO) REFERENCES USERS (USER_NO),
    constraint FK_PURCHASE_BOOK_NO foreign key(BOOK_NO) REFERENCES BOOK (BOOK_NO), 
    constraint FK_PURCHASE_ORDER_NO foreign key(ORDER_NO) REFERENCES ORDERS (ORDER_NO) 
);

-- pusrchase table fk user_no casecade
alter table purchase drop constraint fk_purchase_user_no;
alter table purchase add constraint fk_purchase_user_no foreign key (user_no) references users (user_no) on delete cascade;

select * from purchase;
----------------------------- purchase_no 자동증번 ------------------------------
drop sequence numplus;

Create sequence numplus  
increment by 1        -- 증가값(1씩증가)
start with 1          -- 시작값(1부터 시작)
nomaxvalue            -- 최대값 재한 없음
nocycle
nocache;

-------------------------------------------------------------------------------
---------------------------------- DELIVERY -----------------------------------
-------------------------------------------------------------------------------
DROP TABLE DELIVERY;

CREATE TABLE DELIVERY (
    DELIVERY_NO number(10) not null,
    ORDER_NO number(10) not null,
    INVOICE_NO number(38), 
    COURIER varchar(30),
    START_DATE date,
    CMPLT_DATE date,
    constraint FK_DELIVERY primary key(DELIVERY_NO), 
    constraint FK_DELIVERY_ORDER_NO foreign key(ORDER_NO) REFERENCES ORDERS (ORDER_NO) 
);

drop sequence delivery_seq;
----------------------------- delivery_no 자동증번 ------------------------------
create sequence delivery_seq increment by 1 start with 1;


--------------------------------------------------------------------------------


-----------------------------------------------------------------------------
---------------------------------- BOOK -----------------------------------
-----------------------------------------------------------------------------
-- Book Table(xlsx 삽입 노션 확인)

drop table BOOK;

create table BOOK (
    BOOK_NO      number(10) not null,
    ISBN_NO      number(15),
    TITLE        varchar2(500) ,
    AUTHOR       varchar2(500) not null,
    PUBLISHER    varchar2(500) not null,
    book_CONTENT varchar2(3000),
    STOCK        number(20),
    BOOK_PRICE   number(10),
    BOOK_IMG     varchar(500) not null,
    PBLIC_DATE   date not null,
    BOOK_CATEGORY varchar(500) not null,
    constraint PK_BOOK primary key (BOOK_NO)
);

select * from BOOK;
select count(*) from BOOK;
commit;


--------------------------------------------------------------------
-------------------------- CART ------------------------------------

drop table CART;

create table CART (
    CART_NO       number(10) NOT NULL,
    USER_NO       number     NOT NULL,
    BOOK_NO       number     NOT NULL,
    regDATE       DATE       DEFAULT SYSDATE,
    PRODUCT_COUNT number(10) DEFAULT 1 NOT NULL , -- 디폴트 1로 지정하기.
    constraint PK_CART primary key (CART_NO),
    constraint FK_CART_USER_NO foreign key(USER_NO) REFERENCES USERS (USER_NO),
    constraint FK_CART_BOOK_NO foreign key(BOOK_NO) REFERENCES BOOK (BOOK_NO)
);

DROP sequence CART_SEQ;
CREATE sequence CART_SEQ increment by 1 START with 1;

-- sequence적용 cart inert 예시
insert into CART (CART_NO, USER_NO, BOOK_NO, PRODUCT_COUNT) 
values(CART_SEQ.nextval, 2, 501, 1);

-- cart user_no casecade
alter table cart drop constraint FK_CART_USER_NO;
alter table cart add constraint FK_CART_USER_NO foreign key (user_no) references users (user_no) on delete cascade;

select * from cart;


commit; 
        
SELECT  -- *
        row_number() over(order by C.cart_no desc) as num, -- 등록 순서대로 칼럼 num(index) 지정.
        C.cart_no, C.user_no, C.product_count, B.book_no, B.book_img, B.title, B.book_price, B.stock 
from CART C
        inner join BOOK B
        on C.book_no = B.book_no   
where c.user_no = 1 ;
--AND product_count = 0;
-- where c.user_no = #{user_no};

DELETE 	CART
	    WHERE 	book_no = 20
	    AND 	user_no = 1;



--------------------------------------------------------------------------------
--------------------------------- ADDRESS --------------------------------------
--------------------------------------------------------------------------------
DROP TABLE ADDRESS;

CREATE TABLE ADDRESS (
    ADDRESS_NO    NUMBER(10)    NOT NULL,
    USER_NO       NUMBER(10)    NOT NULL,
    ADDRESS_ALIAS VARCHAR2(50)  NOT NULL,
    ADDRESS_NAME  VARCHAR2(30)  NOT NULL,
    ADDRESS_TEL   VARCHAR2(20)  NOT NULL,
    ZONE_CODE     VARCHAR2(100) NOT NULL,
    ROAD_ADD      VARCHAR2(500) NOT NULL,
    DETAIL_ADD    VARCHAR2(500) NOT NULL,
    DEFAULT_ADD   VARCHAR2(10)  DEFAULT 'N',
    constraint PK_ADDRESS primary key(ADDRESS_NO),
    constraint FK_ADDRESS_USER_NO foreign key(USER_NO) REFERENCES USERS (USER_NO)
);

-- address table fk user_no casecade
alter table address drop constraint fk_address_user_no;
alter table address add constraint fk_address_user_no foreign key (user_no) references users (user_no) on delete cascade;

SELECT * FROM ADDRESS;

--------------------------------------------------------------------------------
--------------------------------- KEYWORD_HISTORY --------------------------------------
--------------------------------------------------------------------------------

create table KEYWORD_HISTORY(
    USER_ID         varchar2(20),
    KEYWORD         varchar2(500),
    SEARCH_DATE     date default sysdate,
    LOGIN_YN        varchar2(5) not null
);


-------------------------------- 1:1문의 테이블(QNA)------------------------------
drop table QNA;
create table QNA(
    QNA_NO NUMBER(10) NOT NULL,
    USER_NO NUMBER(10) NOT NULL,
    QNA_TITLE VARCHAR2(100) NOT NULL,
    QNA_CONTENT VARCHAR2(500) NOT NULL,
    QNA_TYPE VARCHAR2(200) NOT NULL,
    REG_DATE DATE default sysdate,
    ANS_CHECK VARCHAR2(5) default '0' check(ans_check in ('0','1')),
    constraint PK_QNA primary key(QNA_NO),
    constraint FK_QNA_USER_NO foreign key(USER_NO) REFERENCES USERS (USER_NO)
);

ALTER TABLE QNA 
        ADD CONSTRAINT FK_QNA_USER_NO FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO);
        
drop sequence qna_seq;
-- 번호를 자동으로 1부터 1씩 증가하도록 만듦
create sequence qna_seq increment by 1 start with 1;

insert into QNA(QNA_NO, USER_NO, QNA_TITLE, QNA_CONTENT, QNA_TYPE) 
		values(qna_seq.nextval, 1, '이게안돼','이게 왜 안될까요','QNA타입');
        
-- qna table fk user_no casecade
alter table QNA drop constraint FK_QNA_USER_NO;
alter table QNA add constraint FK_QNA_USER_NO foreign key (user_no) references users (user_no) on delete cascade;

select * from qna;
rollback;
commit; 

select * from qna order by reg_date desc;
------------------------- ANSWER ----------------------
drop table answer;
create table ANSWER(
    ANS_NO NUMBER(10) NOT NULL,
    ANS_CONTENT VARCHAR(200) NOT NULL,
    USER_NO NUMBER(10) NOT NULL,
    QNA_NO NUMBER(10) NOT NULL,
    constraint PK_ANSWER primary key(ANS_NO),
    constraint FK_ANSWER foreign key(USER_NO) references USERS (USER_NO),
    constraint FK_ANSWER_QNA_NO foreign key(QNA_NO) references QNA (QNA_NO)
);

desc answer;

drop sequence answer_seq;
-- 번호를 자동으로 1부터 1씩 증가하도록 만듦
create sequence answer_seq increment by 1 start with 1;

select * from answer;

rollback;
commit;