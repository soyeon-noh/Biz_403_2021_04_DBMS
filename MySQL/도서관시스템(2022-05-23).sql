-- DB 생성
CREATE DATABASE DBSystem;
-- DB open
USE DBSystem;

-- DB 삭제
-- DROP DATABASE DBSystem;

-- 테이블 설정 조회
SHOW tables;
DESC user;
DESC book_info;
DESC book;
DESC borrow;

-- 테이블 칼럼 조회
SELECT * FROM user;
SELECT * FROM book_info;
SELECT * FROM book;
SELECT * FROM borrow;

-- 테이블 생성
CREATE TABLE user (
	id			BIGINT			PRIMARY KEY,
	`password`	VARCHAR(20)		NOT NULL,
	`name`		VARCHAR(4)		NOT NULL,
	address		VARCHAR(255)	NOT NULL,
	birth		INT				NOT NULL,
	phone		INT				NOT NULL
);
SELECT * FROM user;


DELETE FROM user 
WHERE id = 2;

INSERT INTO user
VALUES (1,'pw000','nana', '광주 서구', 960101, 01011111111);
INSERT INTO user
VALUES (2,'pw123','noso', '광주 남구', 981204, 01022222222);
INSERT INTO user
VALUES (3,'pw382','bean', '광주 광산구', 991001, 01033333333);


CREATE TABLE book_info (
	isbn		BIGINT				PRIMARY KEY,
	title		VARCHAR(255)	NOT NULL,
	author		VARCHAR(255)	NOT NULL,
	translator	VARCHAR(255),
	publisher	VARCHAR(255)	NOT NULL,
	`date`		DATE			NOT NULL
);
SELECT * FROM book_info;
-- ALTER TABLE book_info MODIFY isbn BIGINT;

INSERT INTO book_info
VALUES (1234567890123,'데이터베이스 개론','노소연', '김미연', '콩알북스', '10-12-01');
INSERT INTO book_info
VALUES (3210987654321,'MySQL 시작하기','노소연', '', '콩알북스', '15-01-01');


CREATE TABLE book (
	id			VARCHAR(100)	PRIMARY KEY,
	isbn		BIGINT				NOT NULL,
	borrow_ok	BOOL			NOT NULL,
    FOREIGN KEY(isbn) REFERENCES book_info(isbn)
);
SELECT * FROM book;


INSERT INTO book
VALUES ('823.5 왕52ㅅ', 1234567890123, true);
INSERT INTO book
VALUES ('823.5 왕52ㅇ', 1234567890123, true);
INSERT INTO book
VALUES ('028.602 김61', 3210987654321, false);

CREATE TABLE borrow (
	id			BIGINT			PRIMARY KEY,
	user_id		BIGINT			NOT NULL,
	book_id		VARCHAR(100)	NOT NULL,
	borrow_date	DATE			NOT NULL,
	return_date	DATE,
	extention	BOOL			NOT NULL,
    FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(book_id) REFERENCES book(id)
);
SELECT * FROM borrow;

INSERT INTO borrow
VALUES (1, 1,'823.5 왕52ㅅ', '22-04-01', '22-04-10', FALSE);
INSERT INTO borrow
VALUES (2, 2,'823.5 왕52ㅅ', '22-04-21', '22-05-01', FALSE);
INSERT INTO borrow
VALUES (3, 1,'823.5 왕52ㅇ', '22-04-12', '22-04-30', FALSE);
INSERT INTO borrow(id, user_id, book_id, borrow_date, extention)
VALUES (4, 3,'028.602 김61', '22-05-22', FALSE);

-- 도서정보를 보다 편하게 조회하기 위한 view 생성
CREATE VIEW view_도서정보 AS
(
	SELECT B.id AS 청구기호, B.borrow_ok AS 대출여부, I.title AS 도서명, I.author AS 저자, I.translator AS 역자, I.publisher AS 출판사, I.date AS 발행일
	FROM book B
		LEFT JOIN book_info I
			ON B.isbn = I.isbn
);
SELECT * FROM view_도서정보;

-- 1. 'nana' 고객이 빌렸던 책 검색
SELECT V.도서명 AS 도서명, book_id AS 청구기호, borrow_date AS 빌린날짜, return_date AS 반납날짜
FROM borrow B
	LEFT JOIN user U
		ON B.user_id = U.id
	LEFT JOIN view_도서정보 V
		ON B.book_id = V.청구기호
WHERE U.name = 'nana';

-- 2. 'bean' 고객이 반납하지 않은 책 검색
SELECT V.도서명, book_id AS 청구기호, borrow_date AS 빌린날짜
FROM borrow B
	LEFT JOIN user U
		ON B.user_id = U.id
	LEFT JOIN view_도서정보 V
		ON B.book_id = V.청구기호
WHERE U.name = 'bean' AND B.return_date IS NULL;

-- 3. '데이터베이스 개론' 책 정보 검색
SELECT * FROM book_info
WHERE title = '데이터베이스 개론';

-- 4. '데이터베이스 개론' 책을 빌릴 수 있는지 검색
SELECT 청구기호, 대출여부 FROM view_도서정보
WHERE 도서명 = '데이터베이스 개론';

-- 4. '콩알북스' 출판사 책 검색
SELECT * FROM view_도서정보
WHERE 출판사 = '콩알북스';

-- 5. 노소연' 저자 책 검색
SELECT * FROM view_도서정보
WHERE 저자 = '노소연';

-- 6. 'nana' 회원이 '4월10일' 이후에 빌린 책 검색
SELECT V.도서명 AS 도서명, book_id AS 청구기호, borrow_date AS 빌린날짜, return_date AS 반납날짜
FROM borrow B
	LEFT JOIN user U
		ON B.user_id = U.id
	LEFT JOIN view_도서정보 V
		ON B.book_id = V.청구기호
WHERE U.name = 'nana' AND B.borrow_date > '2022-04-10';

-- 7. 도서관이 각 책을 몇 권이나 보유하고 있는지 검색
SELECT 도서명, COUNT(*) AS 권수
FROM view_도서정보
GROUP BY 도서명;

-- 8. 도서관이 '데이터베이스 개론'을 몇 권이나 보유하고 있는지 검색
SELECT 도서명, COUNT(*) AS 권수
FROM view_도서정보
WHERE 도서명 = '데이터베이스 개론'
GROUP BY 도서명;

-- 9. 'nana' 회원의 전화번호 검색검색
SELECT phone AS 전화번호 FROM user
WHERE name = 'nana';	

-- 10. 아직 반납되지 않은 책과 빌린 회원의 정보 검색
SELECT user_id AS 회원아이디, U.name AS 회원명, 도서명, 청구기호, 저자, 역자, 출판사, 발행일
FROM borrow B
	LEFT JOIN view_도서정보 V
		ON B.book_id = V.청구기호
	LEFT JOIN user U
		ON B.user_id = U.id
WHERE return_date IS NULL;

