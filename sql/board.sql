/*자유게시판 테이블*/
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

-- 자유게시판 댓글
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

/*건의 게시판 테이블*/
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
    answer varchar(1) default 'n' check (answer in ('n','y')) /*답변 달리면 y 안달리면 n 기본값 n*/
);

create sequence QuestionBoard_seq
start with 1
increment by 1
nomaxvalue
nocache;

-- 질문 게시판 답변
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

/*공지게시판*/
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

-- 공지 게시판 댓글
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

commit;