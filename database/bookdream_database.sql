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

create table USERS (
  USER_NO                 number(10)    not null,
  USER_ID                 varchar2(40)  UNIQUE,
  USER_PASSWORD           varchar2(20),
  USER_NAME               varchar2(50)  not null,
  USER_ADDRESS            varchar2(50)  default '',
  USER_TEL                varchar2(20)  default '',
  USER_LEVEL              number(1)     default 0     check(USER_LEVEL in(0,1)),
  BLACKLIST_YN            varchar2(5)   default 'N'   check(BLACKLIST_YN in ('Y','N')),
  FLATFORM_TYPE           varchar2(50)  not null,
  USER_EMAIL              varchar2(50)  not null,
  USER_POINT              number(10)    default 10000,
  constraint PK_USER primary key (USER_NO)
);


desc users;

drop sequence user_seq;
-- 번호를 자동으로 1부터 1씩 증가하도록 만듦
create sequence user_seq increment by 1 start with 1;

-- 카카오 로그인 insert
insert into users(USER_NO, USER_ID, USER_PASSWORD, USER_NAME, USER_ADDRESS, USER_TEL, FLATFORM_TYPE, USER_EMAIL) 
		values(user_seq.nextval,'','','이름','','','KAKAO','이메일');    
-- BookDream 회원 로그인 insert
insert into users(USER_NO, USER_ID, USER_PASSWORD, USER_NAME, FLATFORM_TYPE, USER_EMAIL) 
	values(user_seq.nextval,'sycha','1234','이름','BD','이메일');
-- BookDream test 로그인 insert
insert into users(USER_NO, USER_ID, USER_PASSWORD, USER_NAME, FLATFORM_TYPE, USER_EMAIL) 
   values(user_seq.nextval,'test','test','test','BD','test@test.com');

-- BookDream User_ADDRESS 제거
alter table users drop column USER_ADDRESS;

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
    PAY_NO         number(10) not null,
	PAY_METHOD     varchar2(20)not null,
    PAY_DATE       varchar(20) default to_char(SYSDATE, 'YY/MM/DD HH24:MI:SS') ,
    DISCOUNT_PRICE number(10) DEFAULT 0 not null,
    FINAL_PRICE    number(10) not null,
    SAVE_POINT     number(10) DEFAULT 0 not null,
    USE_POINT      number(10) DEFAULT 0,
    constraint PK_PAY primary key(PAY_NO)  
);

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
    order_name          varchar2(500) not null,  
    total_price         number not null,
    order_comment       varchar2(400),
    order_enroll        varchar(20) default to_char(SYSDATE, 'YY/MM/DD HH24:MI:SS') ,
    order_receiver      varchar2(20) not null,
    order_address       varchar2(100) not null,
    order_tel           varchar2(40) not null,
    order_fee           number not null
);

-- orders table fk user_no casecade
alter table orders drop constraint SYS_C007481;
alter table orders add constraint fk_orders_user_no foreign key (user_no) references users (user_no) on delete cascade;

select * from orders;

commit;

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

commit;


--------------------------------------------------------------------
-------------------------- CART ------------------------------------

drop table cart;

create table CART (
    CART_NO       number(10) NOT NULL,
    USER_NO       number     NOT NULL,
    BOOK_NO       number     NOT NULL,
    PRODUCT_COUNT  number(10) NOT NULL,
    constraint PK_CART primary key (CART_NO),
    constraint FK_CART_USER_NO foreign key(USER_NO) REFERENCES USERS (USER_NO),
    constraint FK_CART_BOOK_NO foreign key(BOOK_NO) REFERENCES BOOK (BOOK_NO)
);

insert into CART (CART_NO, USER_NO, BOOK_NO, PRODUCT_COUNT) values(1, 1, 1, 1);
insert into CART (CART_NO, USER_NO, BOOK_NO, PRODUCT_COUNT) values(2, 1, 2, 1);
insert into CART (CART_NO, USER_NO, BOOK_NO, PRODUCT_COUNT) values(3, 1, 3, 2);
insert into CART (CART_NO, USER_NO, BOOK_NO, PRODUCT_COUNT) values(4, 1, 4, 1);
insert into CART (CART_NO, USER_NO, BOOK_NO, PRODUCT_COUNT) values(5, 1, 5, 1);

insert into CART (CART_NO, USER_NO, BOOK_NO, PRODUCT_COUNT) values(4, 2, 5, 1);

-- cart user_no casecade
alter table cart drop constraint FK_CART_USER_NO;
alter table cart add constraint FK_CART_USER_NO foreign key (user_no) references users (user_no) on delete cascade;

select * from cart;

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
    PRODUCT_COUNT number(10),
    constraint FK_PURCHASE primary key(PURCHASE_NO), 
    constraint FK_PURCHASE_USER_NO foreign key(USER_NO) REFERENCES USERS (USER_NO),
    constraint FK_PURCHASE_BOOK_NO foreign key(BOOK_NO) REFERENCES BOOK (BOOK_NO), 
    constraint FK_PURCHASE_ORDER_NO foreign key(ORDER_NO) REFERENCES ORDERS (ORDER_NO)     
);

-- pusrchase table fk user_no casecade
alter table purchase drop constraint fk_purchase_user_no;
alter table purchase add constraint fk_purchase_user_no foreign key (user_no) references users (user_no) on delete cascade;


----------------------------- purchase_no 자동증번 ------------------------------
drop sequence numplus;

Create sequence numplus  
increment by 1        -- 증가값(1씩증가)
start with 1          -- 시작값(1부터 시작)
nomaxvalue            -- 최대값 재한 없음
nocycle
nocache;
--------------------------------------------------------------------------------

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

commit; 
