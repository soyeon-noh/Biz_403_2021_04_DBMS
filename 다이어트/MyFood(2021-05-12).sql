-- 여기는 MyFood 접속
CREATE TABLE tbl_foods(
    fd_code	CHAR(7)		PRIMARY KEY,
    fd_name	nVARCHAR2(125)	NOT NULL,	
    fd_year	NUMBER(4),		
    fd_ccode	CHAR(6)	NOT NULL,	
    fd_icode	CHAR(4)	NOT NULL,	
    fd_once	NUMBER(10,2),		
    fd_capa	NUMBER(10,2),		
    fd_cal	NUMBER(10,2),		
    fd_protein	NUMBER(10,2),		
    fd_fat	NUMBER(10,2),
    fd_carbo	NUMBER(10,2),		
    fd_sugar	NUMBER(10,2)	
);		
