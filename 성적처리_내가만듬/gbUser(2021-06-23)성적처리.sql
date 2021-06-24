CREATE DATABASE db_school;

USE db_school;

CREATE TABLE tbl_student(
st_num	CHAR(8)		PRIMARY KEY,
st_name	VARCHAR(20)	NOT NULL,
st_dept	VARCHAR(20)	NOT NULL,
st_grade	INT	NOT NULL,
st_tel	VARCHAR(15)	NOT NULL,
st_addr	VARCHAR(125)
);	

INSERT INTO 
tbl_student(st_num, 
	st_name, 
	st_dept, 
    st_grade, 
    st_tel)
VALUES('2021001', 
	'홍길동', 
    '컴공과', 
    3, 
    '010-111-1234');
    
COMMIT;

CREATE  TABLE tbl_score (
	sc_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY	,
	sc_stnum	CHAR(8)	NOT NULL,
	sc_sbcode	CHAR(4)	NOT NULL,
	sc_score	INT	NOT NULL		
);

INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUE('20210001', 'S001', 90);
INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUE('20210001', 'S002', 80);
INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUE('20210001', 'S003', 70);
INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUE('20210001', 'S004', 60);

INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUE('20210002', 'S001', 96);
INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUE('20210002', 'S002', 69);
INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUE('20210002', 'S003', 83);
INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUE('20210002', 'S004', 77);

SELECT * FROM tbl_score;
DROP TABLE tbl_score;

CREATE TABLe tbl_subject (
	sb_code	CHAR(4),
	sb_name	VARCHAR(20)	NOT NULL,
	sb_prof	VARCHAR(20)
);

INSERT INTO tbl_subject (sb_code, sb_name, sb_prof)
VALUE('S001', '국어', '김덕배');
INSERT INTO tbl_subject (sb_code, sb_name, sb_prof)
VALUE('S002', '영어', '정혜은');
INSERT INTO tbl_subject (sb_code, sb_name, sb_prof)
VALUE('S003', '수학', '유민하');
INSERT INTO tbl_subject (sb_code, sb_name, sb_prof)
VALUE('S004', '음악', '형진우');
INSERT INTO tbl_subject (sb_code, sb_name, sb_prof)
VALUE('S005', '과학', '류성현');


SELECT * FROM tbl_student;
SELECT * FROM tbl_subject;
SELECT * FROM tbl_score;

-- DELETE FROM tbl_student;
-- DELETE FROM tbl_score;
-- DELETE FROM tbl_subject;
-- DELETE FROM tbl_subject WHERE sb_code = '과목코드';






