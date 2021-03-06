-- 여기는 관리자 접속
-- 실습을 위해 기존 객체 삭제
-- scuser 사용자 삭제
DROP USER scuser CASCADE;

-- TABLESPACE 삭제
DROP TABLESPACE schoolDB
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

----------------------------------
-- TABLESPACE 생성
-- 이름 : schollDB, dataFile : school.dbf, SIZE : 1M, Ex :1K
CREATE TABLESPACE schoolDB
DATAFILE 'C:/oraclexe/data/school-1.dbf' -- 오류로 파일이름을 바꾸어 생성 (원래는 school.dbf 로 끝남!)
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- 사용자 생성
-- id : scuser, pw : scuser
-- Default tablespace : schoolDB
CREATE USER scuser IDENTIFIED BY scuser
DEFAULT TABLESPACE schoolDB;

-- 사용자 권한 부여
-- 편의상 DBA 권한을 부여
GRANT DBA TO scuser;