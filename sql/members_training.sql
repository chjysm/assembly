create table members(
    id number primary key,
    email varchar(100) unique ,
    pw varchar(300),
    name varchar(20) ,
    nickname varchar(30),
    gender varchar(5),
    birthday varchar(30),
    age varchar(20),
    type number check (type in (1,2,3,4))
);
update members set pw='admin' where email='admin';
insert into members values (member_seq.nextval,'admin@admin.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','admin','admin',null,null,null,4) ;
insert into members values (member_seq.nextval,'chjysm2@naver.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','aaaa','bbbb',null,null,null,3) ;
select * from members;
delete  members ;
drop table members;
create table training(
    id number not null ,
    title varchar(100)not null 
);
create sequence member_seq
start with 1 increment by 1
nocache
nomaxvalue;

commit;
select member_seq.currval from dual;
drop table members;
drop sequence member_seq;
select nickname from members where email='admin@admin.com';
insert; 
create table Board(
    seq number primary key,
    title varchar(100) not null,
    content varchar(4000) not null,
    writer varchar(50) not null,
    viewCount number not null,
    ip varchar(50) not null,
    wirteDate timestamp default sysdate,
    email varchar(100) not null,
    id number not null
    
);  
drop table board;
drop sequence board_seq;
commit;
create sequence board_seq
start with 1
increment by 1
nomaxvalue
nocache;