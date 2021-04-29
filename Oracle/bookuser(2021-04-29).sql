-- 여기는 bookuser 영역

-- 도서
CREATE TABLE tbl_books(
    bk_isbn	    CHAR(13)		PRIMARY KEY,
    bk_title	nVARCHAR2(125)	NOT NULL,
    bk_ccode	CHAR(5)	NOT NULL,
    bk_acode	CHAR(5)	NOT NULL,
    bk_date	    CHAR(10),	
    bk_price	NUMBER,	
    bk_pages	NUMBER	
);


INSERT INTO tbl_books(bk_isbn, bk_title, bk_ccode, 
            bk_acode, bk_date, bk_price, bk_pages)
VALUES('9791162540619', '일단 오늘 한 줄 써봅시다', 'ABCDE',
        '12345', '2019-02-15', 14000, 252);
        
SELECT *
FROM tbl_books;        

DROP TABLE tbl_books;


-- 회사
CREATE TABLE tbl_company(
    cp_code	    CHAR(5)		PRIMARY KEY,
    cp_title	nVARCHAR2(125)	NOT NULL,
    cp_ceo  	nVARCHAR2(20),
    cp_tel  	VARCHAR2(20),
    cp_addr	    nVARCHAR2(125),
    cp_genre	nVARCHAR2(30)		
);

INSERT INTO tbl_company(cp_code, cp_title, cp_ceo, cp_tel, cp_addr, cp_genre)
VALUES('ABCDE', '감자고구마계란', '노소연',
    '01012345678', '광주광주광주광주광주광주', '소설');
    
    
SELECT *
FROM tbl_company;

DROP TABLE tbl_company;


-- 저자
CREATE TABLE tbl_author(
    au_code	CHAR(5)		PRIMARY KEY,
    au_name	nVARCHAR2(50)	NOT NULL,
    au_tel	VARCHAR2(20),
    au_addr	nVARCHAR2(125),
    au_genre	nVARCHAR2(30)
);

INSERT INTO tbl_author(au_code, au_name, au_tel,
             au_addr, au_genre)
VALUES('ABCDE', '노소연', '01012345678', '광광광광광광광광광', '수필');

SELECT *
FROM tbl_author;

DROP TABLE tbl_author;



-- 세 테이블 JOIN
SELECT *
FROM tbl_company CP, tbl_author AU
    LEFT JOIN tbl_books BK
        ON cp.cp_code = bk.bk_ccode;
