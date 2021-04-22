select * from all_users;

ALTER USER hr IDENTIFIED BY hr account unlock;

CREATE USER shop IDENTIFIED by 12345;
GRANT CONNECT,RESOURCE TO shop;


create user test identified by 1234;
grant connect to test;
alter user test identified by 54321;

drop user test;