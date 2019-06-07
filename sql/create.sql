create table visit(
visitDate varchar(300) default to_char(sysdate,'YY.MM.DD HH24:Mi') not null,
visitCount number not null
);
create table FreeBoard(
    seq number primary key,
    title varchar(100) not null,
    content varchar(4000) not null,
    writer varchar(50) not null,
    viewCount number not null,
    ip varchar(50) not null,
    writeDate timestamp default sysdate,
    email varchar(100) not null,
    id number not null  
); 
create sequence FreeBoard_seq
start with 1
increment by 1
NOMAXVALUE
nocache;
create table FreeComments(
    seq number primary key,
    comments varchar(400) not null,
    postNum number not null,
    postTitle varchar(100) not null,
    writer varchar(50) not null,
    ip varchar(50) not null,
    writeDate timestamp default sysdate,
    email varchar(100) not null,
    id number not null
);
create SEQUENCE freeComments_seq
start with 1
INCREMENT by 1
NOCACHE
NOMAXVALUE;
create table QuestionBoard(
    seq number primary key,
    title varchar(100) not null,
    content varchar(4000) not null,
    writer varchar(50) not null,
     viewCount number not null,
    ip varchar(50) not null,
    writeDate timestamp default sysdate,
    email varchar(100) not null,
    id number not null,   
    answer varchar(1) default 'N' check (answer in ('N','Y')) /*�亯 �޸��� y �ȴ޸��� n �⺻�� n*/
);

create sequence QuestionBoard_seq
start with 1
increment by 1
nomaxvalue
nocache;

create table QuestionComments(
    seq number primary key,
    comments varchar(400) not null,
    postNum number not null,
    postTitle varchar(100) not null,
    writer varchar(50) not null,
   
    ip varchar(50) not null,
    writeDate timestamp default sysdate,
    email varchar(100) not null,
    id number not null
);
create SEQUENCE QuestionComments_seq
start with 1
INCREMENT by 1
nocache
NOMAXVALUE;

create table NoticeBoard(
    seq number primary key,
    title varchar(100) not null,
    content varchar(4000) not null,
    writer varchar(50) not null,
     viewCount number not null,
    ip varchar(50) not null,
    writeDate timestamp default sysdate,
    email varchar(100) not null,
    id number not null
);
create sequence NoticeBoard_seq
start with 1
increment by 1
nomaxvalue
nocache;

-- ���� �Խ��� ���
create table NoticeComments(
    seq number primary key,
    comments varchar(400) not null,
    postNum number not null,
    postTitle varchar(100) not null,
    writer varchar(50) not null,
    ip varchar(50) not null,
    writeDate timestamp default sysdate,
    email varchar(100) not null,
    id number not null
);
create SEQUENCE NoticeComments_seq
start with 1
INCREMENT by 1
nocache
NOMAXVALUE;

create table burger(
    seq number,
    imgAddr varchar(80),
    menuName varchar(70),
    menuNameEng varchar(70),
    price number
);
create table set_menu(
    seq number,
    imgAddr varchar(80),
    menuName varchar(70),
    menuNameEng varchar(70),
    price number
);
create table mc_morning(
    seq number,
    imgAddr varchar(80),
    menuName varchar(70),
    menuNameEng varchar(70),
    price number
);
create table happy(
    seq number,
    imgAddr varchar(80),
    menuName varchar(70),
    menuNameEng varchar(70),
    price number
);
create table happy_meal(
    seq number,
    imgAddr varchar(80),
    menuName varchar(70),
    menuNameEng varchar(70),
    price number
);
create table snack_side(
    seq number,
    imgAddr varchar(80),
    menuName varchar(70),
    menuNameEng varchar(70),
    price number
);
create table mc_cafe(
    seq number,
    imgAddr varchar(80),
    menuName varchar(70),
    menuNameEng varchar(70),
    price number
);
create table beverage(
    seq number,
    imgAddr varchar(80),
    menuName varchar(70),
    menuNameEng varchar(70),
    price number
);
create table desert(
    seq number,
    imgAddr varchar(80),
    menuName varchar(70),
    menuNameEng varchar(70),
    price number
);

create table game(
    code varchar(20) primary key,
    takeIOM varchar(35),
    takeIOY varchar(35),
    burgerNameM varchar(70),
    burgerNameY varchar(70),
    sideNameM varchar(70),
    sideNameY varchar(70),
    cafeNameM varchar(70),
    cafeNameY varchar(70),
    beverageNameM varchar(70),
    beverageNameY varchar(70),
    desertNameM varchar(70),
    desertNaemY varchar(70),
    begin number,
    end number,
    today date default sysdate
);
create table members(
    id number primary key,
    email varchar(100) unique ,
    pw varchar(300),
    name varchar(20) ,
    nickname varchar(30),
    gender varchar(5),
    ban varchar(10),
    age varchar(20),
    type number check (type in (1,2,3,4))
);

create sequence member_seq
start with 1 increment by 1
nocache
nomaxvalue;

create table study(
   id number,
   brand varchar(20) not null,
   answer varchar(300) not null,
   comp_date date default sysdate
); 
create table SupportBoard(
    seq number primary key,
    email varchar(50) ,
    id number ,
    name varchar(50) ,
    supporttimestamp timestamp default sysdate,
    supportdate date default sysdate,
    amount number
); 
create SEQUENCE Support_seq
start with 1
INCREMENT by 1
nocache
nomaxvalue;

create table coffee_coffee(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(300),
    menuprice varchar(80) not null
);
create table coffee_latte(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(300),
    menuprice varchar(80) not null
);
create table coffee_holly(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(300),
    menuprice varchar(80) not null
);
create table coffee_tea(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(300),
    menuprice varchar(80) not null
);
create table coffee_bakery(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(300),
    menuprice varchar(80) not null
);
-----------------------------------------
create table lotte_burgerset(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(70),
    menuprice varchar(80) not null
);
create table lotte_chickenset(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(70),
    menuprice varchar(80) not null
);
create table lotte_good(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(70),
    menuprice varchar(80) not null
);
create table lotte_burger(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(70),
    menuprice varchar(80) not null
);
create table lotte_chicken(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(70),
    menuprice varchar(80) not null
);
create table lotte_desert(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(70),
    menuprice varchar(80) not null
);
create table lotte_drink(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(70),
    menuprice varchar(80) not null
);
-----------------------------------------
create table pizza_seed(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(70),
    menuprice varchar(80) not null
);
create table pizza_prm(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(70),
    menuprice varchar(80) not null
);
create table pizza_cls(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(70),
    menuprice varchar(80) not null
);
create table pizza_side(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(70),
    menuprice varchar(80) not null
);
create table pizza_beverage(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(70),
    menuprice varchar(80) not null
);
create table pizza_souce(
    seq  number not null,
    imgaddr varchar(200) not null,
    menuname varchar(80)  not null,
    menuNameEng varchar(70),
    menuprice varchar(80) not null
);




commit;