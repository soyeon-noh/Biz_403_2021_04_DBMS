
USE db_school;

/*
 tbl_subject, tbl_score table을 가지고
 각 학생의 성적 리스트를 출력해보기
 과목 리스트를 출력하고,
 각 과목의 성적이 입력된 학생의 리스트를 확인하기
 
 학번을 조건으로 하여 한 학생의 성적입력 여부를 확인하기
 
 학생의 점수가 입력된 과목과 입력되지 않은 과목을
 확인하고 싶다.

*/

-- subquery
-- 성능상의 문제 + 복잡한 코드 문제
SELECT SB.sb_code, SB.sb_name, SB.sb_prof,
	SC.sc_stnum, SC.sc_score
FROM tbl_subject SB
	LEFT JOIN (SELECT * FROM tbl_score WHERE sc_stnum = '20210001' ) SC
    /* 그냥 WHERE 를 맨 아래에 두면 성적을 입력하지 않은 과목은 보이지가 않음.*/
		ON SC.sc_sbcode = SB.sb_code;
        
/*
	과목리스트를 전체 보여주고,
    학생의 성적 table을 JOIN하여
    학생의 점수가 있으면 점수를 보이고 
    없으면 null을 보여주는 JOIN SQL문
    
    이 JOIN 명령문에
    특정한 학번을 조건으로 부여하여 
    한 학생의 성적여부를 조회하는 sQL 만들기
    
    순수한 JOIN을 사용하여 한 학생의 성적을 조회하는데 
    학생의 성적이 tbl_score talbe에 있으면 점수를 보이고
    없으면 NULL로 표현하기 위하여
    WHERE 절에서 학번을 조건으로 부여하지 않고
    JOIN문의 ON 절에 학번을 조건으로 부여한다.
*/
        
-- subquery를 쓰지 않아도 join문으로 같은 결과를 낼 수 있다
-- join문 내부의 AND를 사용하여 간결한 코드
SELECT SB.sb_code, SB.sb_name, SB.sb_prof,
	SC.sc_stnum, SC.sc_score
FROM tbl_subject SB
	LEFT JOIN tbl_score SC
		ON SC.sc_sbcode = SB.sb_code /* 여기까지만하면 전체학생의 정보가 나옴*/
        AND SC.sc_stnum = '20210001' LIMIT 5;
        
        
SELECT * FROM tbl_student;    

DESC tbl_subject;
ALTER TABLE tbl_subject MODIFY COLUMN sb_code CHAR(4) PRIMARY KEY;

SELECT COUNT(*) FROM tbl_score
WHERE sc_stnum = '20210001';

SELECT * FROM tbl_score
WHERE sc_stnum = '20210001';

DELETE FROM tbl_score
WHERE sc_stnum = '20210001';


-- 6/28 --------------------------------------

DROP table tbl_score;
/*
TABLE에 
	INSERT INTO ON DUPLICATE KEY UPDATE를
	실행하기 위해서는 PK 설정을 변경해야 한다.
tbl_score는 두개의 칼럼을 기준으로
	UPDATE, DELETE 를 수행해야하는 문제가 발생한다.
가장 좋은 설계는 UPDATE, DELETE 를 수행할 때
	한개의 칼럼으로 구성된 PK를 기준으로 
    수행하는 것이다.
    
*/
CREATE TABLE tbl_score (
	-- sc_seq BIGINT AUTO_INCREMENT PRIMARY KEY,
    sc_stnum char(8) NOT NULL,
    sc_sbcode char(4) NOT NULL,
    sc_score INT NOT NULL,
    PRIMARY KEY(sc_stnum, sc_sbcode) -- 슈퍼키로 칼럼선언
);

/* 방법2
PK는 그대로 살려두고
두개의 칼럼을 묶어 UNIQUE로 설정
두개 칼럼의 값이 동시에 같은 경우엔 추가하지 말라는
제약조건 설정
*/

CREATE TABLE tbl_score (
	sc_seq BIGINT AUTO_INCREMENT PRIMARY KEY,
    sc_stnum char(8) NOT NULL,
    sc_sbcode char(4) NOT NULL,
    sc_score INT NOT NULL,
    UNIQUE(sc_stnum, sc_sbcode) -- double unique! 
);



SELECT * FROM tbl_score;
SELECT * FROM tbl_subject;


-- 한 학생의 3과목 점수를 개별적으로 INSERT하기
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score) VALUES ('20210002', 'S001', 90);
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score) VALUES ('20210002', 'S002', 95);
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score) VALUES ('20210002', 'S003', 92);

-- 1번의 INSERT 명령문으로 다수의 명령문 INSERT하기
INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)  
VALUES ('20210003', 'S001', 90), ('20210003', 'S002', 95), ('20210003', 'S003', 92);
SELECT * FROM tbl_score;