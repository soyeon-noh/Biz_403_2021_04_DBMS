-- mac에서 root 접속

-- DataBase를 하나 만듦
CREATE DATABASE SchoolData;
-- scUser 사용자를 등록하고 
-- 접근권한을 localhost로 제한하겠다.
CREATE USER scUser@localhost identified by '12345';

SHOW GRANTS FOR scUser@localhost;

GRANT all privileges on *.* TO scUser@localhost;

-- 192.168.0.* ALTER
-- 현재 공유기에 공통으로 연결된 PC에서
-- MySQL Server에 접근하라
CREATE USER 
scUser@'192.168.219.%' identified by '12345';

-- 현재 공유기에 공통으로 연결된 pc에서 접근할 때
-- 모든 권한을 부여하겠다
GRANT ALL privileges ON *.* TO 
'scUser'@'192.168.219.%';


-- User 확인

USE MYSQL; -- DB 정보 확인을 위하여 DB 사전에 접근
SHOW TABLES;
DESC USER;

-- 사용자 정보가 등록된 Table select
-- 유저 테이블 셀렉트해서 사용자 정보를 볼 수 있다.
SELECT Host, User FROM user;