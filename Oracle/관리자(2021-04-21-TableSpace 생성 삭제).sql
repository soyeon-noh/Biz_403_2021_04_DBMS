-- 관리자 권한 접속

-- TABLE SPACE 생성하기
CREATE TABLESPACE iolistDB
DATAFILE 'C:/oraclexe/data/iolist.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- 첫 명령어 안되면 이거함
-- TABLE SPACE 삭제하기
-- 삭제할 경우 반드시 옵션을 같이 작성하자
DROP TABLESPACE iolistDB -- 반드시 있어야할 부분
INCLUDING CONTENTS AND DATAFILES -- 옵션
CASCADE CONSTRAINTS; -- 옵션

-- 새로운 사용자 등록
CREATE USER iouser IDENTIFIED BY iouser
DEFAULT TABLESPACE iolistdb;

-- 새로운 사용자 삭제
DROP USER iouser CASCADE;

-- 사용자에게 권한부여
GRANT DBA TO iouser;


