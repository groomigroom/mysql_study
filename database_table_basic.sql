CREATE DATABASE groomi;
DROP DATABASE groomi;
USE groomi;

CREATE TABLE highschool_students
(
	student_no VARCHAR(20),
    student_name VARCHAR(100),
    grade TINYINT,
    class VARCHAR(50),
    gender VARCHAR(20),
    age SMALLINT,
    enter_date DATE
);

DESC highschool_students;

DROP TABLE highschol_students;
DROP TABLE highschol_students CASCADE;
/*휴지통??*/

CREATE TABLE doit_dml
(
col_1 INT,
col_2 VARCHAR(50),
col_3 DATETIME
);

DESC doit_dml;

SELECT *
FROM doit_dml;

INSERT INTO doit_dml
VALUE
(1, '구름이', '2026-03-03');

INSERT INTO doit_dml (col_1, col_2, col_3)
VALUES
(2, '김구름이', '2026-04-03');
INSERT INTO doit_dml (col_1, col_3)
VALUES
(3, '2026-07-03');
/*바로 위에꺼는 속성과 속성값이 순서가 같이 바뀌어도 정상적으로 됨*/
