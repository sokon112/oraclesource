create table userTBL(
    no number(4) constraint PK_userTBL primary key,
    userName varchar2(20) not null,
    birthYear number(4) not null,
    addr varchar2(15) not null,
    mobile varchar2(12)
);

create SEQUENCE user_seq;

insert into userTBL(no,userName,birthYear,addr,mobile) 
    values(user_seq.nextval,'홍길동',1993,'서울 구로','01012345671');
insert into userTBL(no,userName,birthYear,addr,mobile)
    values(user_seq.nextval,'이승기',1989,'서울 강서','01012345672');
insert into userTBL(no,userName,birthYear,addr,mobile) 
    values(user_seq.nextval,'강호동',1975,'서울 마포','01012345673');
insert into userTBL(no,userName,birthYear,addr,mobile)
    values(user_seq.nextval,'이수근',1977,'경기 부천','01012345674');
insert into userTBL(no,userName,birthYear,addr,mobile) 
    values(user_seq.nextval,'서장훈',1978,'서울 강남','01012345675');
 
select * from userTBL;

drop table userTBL;
drop SEQUENCE user_seq;


















