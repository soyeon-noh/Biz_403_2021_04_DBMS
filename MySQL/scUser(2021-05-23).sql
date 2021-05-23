-- scUser 접속화면
CREATE DATABASE SchoolData;
USE SchoolData;

CREATE TABLE tbl_school_data(
	sc_num	BIGINT PRIMARY KEY,
	sc_name	VARCHAR(10)	NOT NULL,
	sc_tel	VARCHAR(20)	NOT NULL,
	sc_addr	VARCHAR(125)	NOT NULL,
	sc_grade	INT NOT NULL,
	sc_dep VARCHAR(125)	NOT NULL
);

INSERT INTO tbl_school_data(sc_num, sc_name, sc_tel, sc_addr, sc_grade, sc_dep)
VALUES (210001, '가가가', '010-1111-1111', '광주광역시 서구', 1, '경제');

INSERT INTO tbl_school_data(sc_num, sc_name, sc_tel, sc_addr, sc_grade, sc_dep)
VALUES (210002, '나나나', '010-2222-2222', '광주광역시 북구', 2, '경영');

INSERT INTO tbl_school_data(sc_num, sc_name, sc_tel, sc_addr, sc_grade, sc_dep)
VALUES (210003, '다다다', '010-3333-3333', '광주광역시 광산구', 2, '신소재공학');

INSERT INTO tbl_school_data(sc_num, sc_name, sc_tel, sc_addr, sc_grade, sc_dep)
VALUES (210004, '라라라', '010-4444-4444', '광주광역시 남구', 3, '실내디자인');

INSERT INTO tbl_school_data(sc_num, sc_name, sc_tel, sc_addr, sc_grade, sc_dep)
VALUES (210005, '마마마', '010-5555-5555', '전라남도 나주', 4, '전기공학');