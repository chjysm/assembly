--맥도날드 메뉴 테이블
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
----키오스크 머신 테이블
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
--==================================================위쪽 내용 수정 X==============
-----의미없음--그러나 지우지 마세요
select * from game order by begin desc;
select * from game;
select * from snack_side, game where menuname=sideNameY and code like 'c8r2aymq';
insert into game (code, begin, today) values ('222', 123212135456, sysdate);
update game set end=11 where code='c8r2aymq';
select (end-begin)/(1000) from game where code = '7ouua9o2';
ALTER TABLE desert ADD(price number);
-----의미없음--------------------




create table menu(
    seq number,
    menu_name varchar(70),
    menu_addr varchar(100)
);
select * from menu;
insert into menu values(4, '스타벅스 키오스크', '<li id=li5><a href=5>스타벅스 키오스크</a></li>');
select menu_addr from menu where menu_name like '%맥%';
select menu_addr from menu where REGEXP_LIKE(menu_name, '키오스크');


--===============================================================================
--19.6.7 추가
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

select * from pizza_souce;
--===============================================================================

