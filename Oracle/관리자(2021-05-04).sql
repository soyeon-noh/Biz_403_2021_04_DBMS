-- 여기는 관리자 접속
-- kschoolDB, KScholl.dbf

CREATE TABLESPACE KschoolDB
DATAFILE 'C:/oraclexe/data/kschool.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

-- kscuser, kscuser, KSchoolDB
CREATE USER kscuser IDENTIFIED BY kscuser
DEFAULT TABLESPACE kschoolDB;

GRANT DBA TO kscuser;