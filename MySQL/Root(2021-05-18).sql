-- DataBase Schema
-- 물리적 저장공간
-- Oracle : TableSpace + User 생성하여 연동하면 
--			User 를 통해서 모든 물리적 DB에 접근된다.
-- MySQL : DataBase가 Schema가 되고 
--			모든 데이터의 저장공간이 된다.
--			User는 단지 DB SW에 접속하는 사용자 개녕미고
--			구체적으로 DB Schema와 연결되지 않는다.

-- DataBase를 하나 만듦
CREATE DATABASE GuestBook;
-- gbUser 사용자를 등록하고 
-- 접근권한을 localhost로 제한하겠다.
CREATE USER gbUser@localhost;

-- 원격 또는 다른 서버, Client에서 접속가능하도록
-- CREATE USER gbUser@'%';

-- MYSQL Database는 MySQL에서
-- 매우 중요한 정보가 저장되는 곳
USE MYSQL; -- DB 정보 확인을 위하여 DB 사전에 접근
SHOW TABLES;
DESC USER;

-- 사용자 정보가 등록된 Table select
-- 유저 테이블 셀렉트해서 사용자 정보를 볼 수 있다.
SELECT Host, User FROM user;

-- 등록된 사용자의 권한 확인
SHOW GRANTS FOR gbUser@localhost;

-- (혹시모르니) gbuser에게 모든 권한을 부여하라
-- localhost에서만 접근가능하다
GRANT all privileges on *.* TO gbUser@localhost;

-- 192.168.0.* ALTER
-- 현재 공유기에 공통으로 연결된 PC에서
-- MySQL Server에 접근하라
CREATE USER 
gbUser@'192.168.0.%';

-- 현재 공유기에 공통으로 연결된 pc에서 접근할 때
-- 모든 권한을 부여하겠다
GRANT ALL privileges ON *.* TO 
'gbUser'@'192.168.0.%';

-- 5.7 버전에서 user 비밀번호 변경하기 (실무)
SELECT * FROM user;
UPDATE USER
SET password=password('1234')
WHERE user='gbUser';

-- MySQL 8.x 버전에서 비밀번호 변경하기 (현재사용하는버전)
ALTER USER 'gbUser'@'localhost'
IDENTIFIED WITH mysql_native_password
BY '12345';
flush PRIVILEGES;