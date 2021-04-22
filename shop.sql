create table member(
    userNo number(8) not null primary key,
    userName varchar2(20) not null
);

create sequence member_seq;

select member_seq.currval from dual;

drop table member;

drop SEQUENCE member_seq;