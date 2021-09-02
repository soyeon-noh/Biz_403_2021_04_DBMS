# 몽고DB

- NoSQL DBMS의 한 종류
- NoSQL : Not Only SQL, Non Relational Operational DataBase SQL
- MySQL, Oracle 등의 RDBMS와 구별되는 형태의 DB를 NoSQL 이라고 한다.

## RDBMS

- 데이터를 저장할 때 반드시 Schema가 형성된(Table이 Create 된 상태) 경우에만 데이터를 Insert 할 수 있다.
- Table을 만들 떄 데이터타입, 길이, 제약조건 등을 미리 선언하고, 제약조건에 맞지 않으면 데이터가 insert 되지 않는다. (객체 무결성)
- 다수의 Table이 관계를 이루어 서로 연관되는 구조로 만들어져 있다.

## NoSQL

- Document Type 으로 데이터를 저장한다
- 모든 데이터를 JSON Type과 유사하게 저장한다.

## 몽고 DB 명령어

- DB 목록 확인 : show dbs
- 새로운 DB 만들기 : USE db 이름
- 기존의 DB 열기 : USE db이름
- DB 상태 확인 : db.stats()
- 새로운 데이터 저장(1개만 가능) : db.테이블명.save( JSON 형태의 데이터 )
- 새로운 데이터 저장(여러개도 가능) : db.컬렉션.insert( 데이터들 )
- select all : db.컬렉션.find( {} )
- select find : db.컬렉션.find( { addr: "서울시" })
- select 이쁘게(모양을 갖추어 보이기) : db.컬렉션.find().pretty()

## 몽고DB 관련 용어

- 새로운 데이터베이스 생성 : USE db이름
- 새로운 데이터 추가 : db.컬렉션.save(데이터)
- 컬렉션 : NoSQL에서 데이터를 저장하는 table 적인 개념
- document : 컬렉션에 추가된 데이터 요소
