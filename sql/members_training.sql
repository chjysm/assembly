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


-- 관리자 계정 생성 
insert into members values (member_seq.nextval,'admin@admin.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','admin','admin',null,null,null,4) ;

-- 회원 계정 생성
insert into members values (member_seq.nextval,member_seq.nextval || 'abcd@naver.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','aaaa','bbbb','M',null,'10-19',3) ;
insert into members values (member_seq.nextval,member_seq.nextval || 'abcd@naver.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','aaaa','bbbb','W',null,'10-19',3) ;



commit;

