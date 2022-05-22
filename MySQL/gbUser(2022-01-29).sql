
CREATE DATABASE board;
USE board;

CREATE TABLE tbl_board (
	b_seq BIGINT AUTO_INCREMENT PRIMARY KEY,
	b_title VARCHAR(50) NOT NULL,
	b_name VARCHAR(50) NOT NULL,
	b_content VARCHAR(50) NOT NULL,
	b_date VARCHAR(50) NOT NULL
);


INSERT INTO tbl_board(b_title, b_name,b_content ,b_date)
VALUE ("제목1", "이름1", "내용1", "2022-01-26");
INSERT INTO tbl_board(b_title, b_name,b_content ,b_date)
VALUE ("제목2", "이름2", "내용2", "2022-01-27");
INSERT INTO tbl_board(b_title, b_name,b_content ,b_date)
VALUE ("제목3", "이름3", "내용3", "2022-01-28");

SELECT * FROM tbl_board;