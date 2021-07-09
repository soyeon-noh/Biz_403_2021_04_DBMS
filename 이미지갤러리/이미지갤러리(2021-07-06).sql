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
	file_seq	BIGINT	PRIMARY KEY,
	file_gseq	BIGINT	NOT NULL,
	file_original	VARCHAR(125)	NOT NULL,
	file_upname	VARCHAR(125)	NOT NULL
);


SHOW tables;

DROP TABLE tbl_gallery;
DROP TABLE tbl_files;