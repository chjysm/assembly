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