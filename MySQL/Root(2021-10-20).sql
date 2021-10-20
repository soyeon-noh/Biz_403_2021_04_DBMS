-- 2021-10-20 naraDB

/*
Schema
외부, 개념, 내부
외부 : 모든 데이터는 Table 형태로 되어 있다.
내부 : DBMS 엔진(SW)이 자체적으로 OS와 함께 연동되어
	Storage에 어떻게 데이터를 보관하는가 하는 관점
	데이터를 어떤 기준으로 저장할 것인가.
    (ORACLE : TableSpace, MySQL : DataBase)
개념 : 사용자의 SQL을 번역하여 실제 데이터에 어떻게 반영할 것인가
	조회된 데이터를 어떻게하여 Table 모양으로 바꿀 것인가.
*/
/*
RDBMS(Relation DataBase Management System)
	데이터베이스 관리 소프트웨어(ORACLE, MySQL, MSSQL, ... )
    
RDBMS 차원에서의 Schema
	Data를 보관하고 관리하는 가장 큰 주체가 누구냐
    일반 DBMS : DataBase를 기준으로 Schema,
			사용자는 login을 통해 권한을 획득한 사용자일 뿐
    Oracle : User를 기준으로 Schema,
			table은 
*/
-- naraDB Schema 생성하기
CREATE DATABASE naraDB;
USE naraDB;
show tables;
DESC tbl_buyer;

INSERT INTO tbl_buyer (userid, name)
VALUES('B001', '홍길동');
INSERT INTO tbl_buyer (userid, name)
VALUES('B002', '성춘향');

SELECT * FROM tbl_buyer;

-- UPDATE 를 실행할 때는 
-- 반드시 변경하고자 하는 데이터의 PK를 확인하고
-- PK를 조건절(WHERE)에 지정하여 실행한다.
UPDATE tbl_buyer SET tel='010-111-1111'
WHERE userid = 'B001';

-- DELETE를 실행할 때도
-- 반드시 삭제하고자 하는 데이터의 PK를 확인하고
-- 조건절에 PK를 설정하여 실행한다.
DELETE FROM tbl_buyer
WHERE userid = 'B002';

-- 보안사고 : 권한이 없는 사용자가 침투하여 사고내기
-- 무결성 파괴 : 권한이 있는 사용자가 잘못하여 DB에 문제를 일으키는 것
-- 			역할을 적절하게 부여하고, PK와 FK관리를 잘 해야한다.

show tables;
DESC tbl_sales;
DESC hibernate_sequence;

SELECT * FROM tbl_buyer;

