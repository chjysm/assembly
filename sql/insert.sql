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

insert into members values (member_seq.nextval,'admin@admin.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','admin','admin',null,null,null,4) ;

-- 회원 계정 생성
insert into members values (member_seq.nextval,member_seq.nextval || 'abcd@naver.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','aaaa','bbbb','M',null,'10-19',3) ;
insert into members values (member_seq.nextval,member_seq.nextval || 'abcd@naver.com','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','aaaa','bbbb','W',null,'10-19',3) ;

COMMIT;