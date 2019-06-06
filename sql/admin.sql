
-- 방문자 수 테이블
create table visit(
visitDate varchar(300) default to_char(sysdate,'YY.MM.DD HH24:Mi') not null,
visitCount number not null
);

-- 방문자 수 데이터
insert into visit values('19.05.20 23:59', 438);
insert into visit values('19.05.21 23:59', 573);
insert into visit values('19.05.22 23:59', 545);
insert into visit values('19.05.23 23:59', 634);
insert into visit values('19.05.24 23:59', 402);
insert into visit values('19.05.25 23:59', 695);
insert into visit values('19.05.26 23:59', 784);
insert into visit values('19.05.27 23:59', 834);
insert into visit values('19.05.28 23:59', 521);
insert into visit values('19.05.29 23:59', 937);
insert into visit values('19.05.30 23:59', 1023);


