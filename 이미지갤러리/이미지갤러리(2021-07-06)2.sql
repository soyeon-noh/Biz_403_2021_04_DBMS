USE mylibs;

CREATE TABLE tbl_gallery (
	g_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	g_writer	VARCHAR(20)	NOT NULL,
	g_date	VARCHAR(10)	NOT NULL,
	g_time	VARCHAR(10)	NOT NULL,
	g_subject	VARCHAR(50)	NOT NULL,
	g_content	VARCHAR(1000)	NOT NULL,
	g_image	VARCHAR(125)		
);

CREATE TABLE IF NOT EXISTS tbl_gallery (
	g_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	g_writer	VARCHAR(20)	NOT NULL,
	g_date	VARCHAR(10)	NOT NULL,
	g_time	VARCHAR(10)	NOT NULL,
	g_subject	VARCHAR(50)	NOT NULL,
	g_content	VARCHAR(1000)	NOT NULL,
	g_image	VARCHAR(125)		
);

CREATE TABLE tbl_files (
	file_seq	BIGINT	AUTO_INCREMENT PRIMARY KEY,
	file_gseq	BIGINT	NOT NULL,
	file_original	VARCHAR(125)	NOT NULL,
	file_upname	VARCHAR(125)	NOT NULL
);

-- 전체선택
SELECT * FROM tbl_gallery;

-- 추가
INSERT INTO tbl_gallery
(g_writer, g_date, g_time, g_subject, g_content)
VALUES 
('callor', '2021-07-06', '15:18:00', '연습', '진짜연습');

-- 현재 연결된 sesstion에서 INSERT가 수행되고 
-- 그 과정에서 AUTO_INCREMENT 칼럼에 변화가 있으면
-- 그 값을 알려주는 함수.
SELECT last_insert_id();

SHOW tables;
DESC tbl_gallery;

SELECT * FROM tbl_files;
SELECT * FROM tbl_gallery;

DROP TABLE tbl_gallery;
DROP TABLE tbl_files;



-- 7/7(수)
INSERT INTO tbl_files
(file_gseq, file_origin, file_update)
value
(1, 'title1','uuid-title1'),
(1, 'title2','uuid-title2'),
(1, 'title3','uuid-title3');

-- AUTO_INCREMENT로 설정된 칼럼에 
-- INSERT를 수행할 때
-- 0 또는 null, '' 등을 설정하면
-- AUTO_INCREMENT가 작동된다.
INSERT INTO tbl_gallery(
g_seq, g_writer, g_date, g_time,
g_subject, g_content
) VALUES  (
0, 'callor', '2021', '00:00', '제목', '내용'
);


SELECT * FROM tbl_files;
SELECT * FROM tbl_gallery;

-- EQ JOIN
-- 카티션 곱
-- 	: 두개의 table을 JOIN하여
--    table 개수 * table2 개수만큼 list 출력
SELECT * FROM tbl_gallery G, tbl_files F
	WHERE G.g_seq = F.file_gseq;
    
-- 각 갤러리마다 디테일 보기 
SELECT * FROM tbl_gallery G, tbl_files F
	WHERE G.g_seq = F.file_gseq
    AND G.g_seq = 1;
    
/*
view_갤러리의 SQL 코드
EQ JOIN을 만들어서 보여지는 코드
tbl_gallery에는 데이터가 있는데
tbl_files에 연결되는 데이터가 하나도 없는 경우
tbl_gallery 자체가 출력되지 않는 문제가 있다
*/
CREATE VIEW view_갤러리  AS (
SELECT G.g_seq AS g_seq, 
	G.g_writer AS g_writer, 
    G.g_date AS g_date, G.g_time AS g_time,
	G.g_subject AS g_subject, 
    G.g_content AS g_content, 
    G.g_image AS g_image,
    
    F.file_seq AS f_seq, 
    F.file_original AS f_original, 
    F.file_upname AS f_upname
FROM tbl_gallery G, tbl_files F
WHERE G.g_seq = F.file_gseq
);

DESC view_갤러리;

SELECT * FROM view_갤러리;

/*
1:N 관계의 table일 경우
보통은 FK로 설정하여 데이터를 유지한다.

1:0..N : child table에 연관된 데이터가 
		하나도 없는 경우가 있다.
1:1..N : child table에 연관된 데이터가
		최소 한개는 있는 경우
        
1:1..N 인 경우는 EQ JOIN을 수행해도   (EQ JOIN이 무지하게 빠르지만! 더미데이터가필요하다
	실제로 Parent table에 있는 데이터는 무조건 출력이 된다.
    
1:0..N 인 경우는 child table에 데이터가 하나도 없는 경우 ( 갤러리프로젝트는 이런경우를 감안해야한대....
	EQ JOIN을 수행하면
    출력되는 데이터가 한개도 없는 상황이 발생한다.
    
JOIN을 수행할때는 FK가 설정되는 경우가 있거나 말거나
	JOIN은 LEFT(OUTTER) JOIN을 수행하는 것이 좋다.
*/

-- EQ JOIN을 LEFT JOIN으로 변경하면 로직문제가 해결된대
SELECT G.g_seq AS g_seq, 
	G.g_writer AS g_writer, 
    G.g_date AS g_date, G.g_time AS g_time,
	G.g_subject AS g_subject, 
    G.g_content AS g_content, 
    G.g_image AS g_image,
    
    F.file_seq AS f_seq, 
    F.file_original AS f_original, 
    F.file_upname AS f_upname
FROM tbl_gallery G
	LEFT JOIN tbl_files F
		ON G.g_seq = F.file_gseq
	WHERE G.g_seq = 9;
	
        
DELETE FROM tbl_files
WHERE file_seq = 16;

SELECT max(g_seq) FROM tbl_gallery;
UPDATE tbl_gallery SET g_image = ''
WHERE g_seq = '10';


		SELECT 
			G.g_seq AS g_seq, 
			G.g_writer AS g_writer, 
		    G.g_date AS g_date, G.g_time AS g_time,
			G.g_subject AS g_subject, 
		    G.g_content AS g_content, 
		    G.g_image AS g_image,
		    
		    F.file_seq AS f_seq, 
		    F.file_original AS f_original, 
		    F.file_upname AS f_upname
		FROM tbl_gallery G
			LEFT JOIN tbl_files F
				ON G.g_seq = F.file_gseq
		WHERE G.g_seq = '10';