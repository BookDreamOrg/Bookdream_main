create user bookdream identified by bookdream;
grant connect, resource, create view to bookdream;
connect bookdream/bookdream;

-- User Table
drop table USERS;
create table USERS (
  USER_NO                 number(10)    not null,
  USER_ID                   varchar2(40)  UNIQUE,
  USER_PASSWORD  varchar2(20),
  USER_NAME            varchar2(50)  not null,
  USER_ADDRESS     varchar2(50)  default '',
  USER_TEL                varchar2(20)  default '',
  USER_LEVEL            number(1)     default 0    check(USER_LEVEL in(0,1)),
  BLACKLIST_YN        varchar2(5)   default 'N'   check(BLACKLIST_YN in ('Y','N')),
  FLATFORM_TYPE varchar2(50) not null,
  USER_EMAIL            varchar2(50)  not null,
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

select * from users;
commit;

-- Review Table
drop table review;

create table review(
review_no number(10) not null,
USER_NO number(10) not null,
book_no number(10) not null,
REVIEW_CONTENT varchar2(1000) not null,
REVIEW_DATE date default sysdate,
REVIEW_RECOMMEND number(20),
REVIEW_STAR number(1) not null,
constraint pk_riview PRIMARY KEY (review_no)
);

select * from review;

-- Pay Table
drop table pay;

CREATE TABLE PAY (
    PAY_NO         number(10) not null,
   PAY_METHOD     varchar2(20)not null,
    PAY_DATE       date DEFAULT SYSDATE not null,
    DISCOUNT_PRICE number(10) DEFAULT 0 not null,
    FINAL_PRICE    number(10) not null,
    SAVE_POINT     number(10) not null,
    constraint PK_PAY primary key(PAY_NO)  
);

select * from pay;

-- Orders Table
drop table orders;

CREATE TABLE orders(
    order_no number primary key,
    user_no number references users (user_no) not null,
    pay_no number references pay (pay_no) not null,
    order_name varchar2(100) not null,  
    total_price number not null,
    order_comment varchar2(400),
    order_enroll date default sysdate ,
    order_receiver varchar2(20) not null,
    order_address varchar2(100) not null,
    order_tel varchar2(40) not null,
    order_fee number not null
);

select * from orders;

-- Book Table(xlsx 삽입 노션 확인)

drop table BOOK;

create table BOOK (
    BOOK_NO      number(10) not null,
    ISBN_NO      number(15),
    TITLE        varchar2(500) ,
    AUTHOR       varchar2(500) not null,
    PUBLISHER    varchar2(500) not null,
    book_CONTENT    varchar2(3000),
    STOCK        number(20),
    BOOK_PRICE   number(10),
    BOOK_IMG     varchar(500) not null,
    PBLIC_DATE   date not null,
    BOOK_CATEGORY varchar(500) not null,
    constraint PK_BOOK primary key (BOOK_NO)
);

select * from BOOK;

commit