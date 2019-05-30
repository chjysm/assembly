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
insert into members values (member_seq.nextval,'chjysm2@naver.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','admin','admin',null,null,null,3) ;
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
insert 