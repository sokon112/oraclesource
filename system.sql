select * from all_users;

ALTER USER hr IDENTIFIED BY hr account unlock;

CREATE USER shop IDENTIFIED by 12345;
GRANT CONNECT,RESOURCE TO shop;