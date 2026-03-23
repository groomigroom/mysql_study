
SHOW DATABASES;

USE groomi;

CREATE TABLE highschool_students (
       student_no    VARCHAR(20)  NOT NULL,
       student_name  VARCHAR(100) NOT NULL,
       grade         TINYINT NULL,
       class         VARCHAR(50) NULL,
       gender        VARCHAR(20) NULL,
       age           SMALLINT NULL,
       enter_date    DATE NULL
);

ALTER TABLE highschool_students
ADD PRIMARY KEY (student_no);

SELECT *
FROM highschool_students;

DESC highschool_students;

DROP TABLE highschool_students CASCADE;

INSERT INTO highschool_students
VALUES
(1, "구름이", 1, "1반", "남성", 11, "2002-01-01"),
(2, "김구름", 1, "1반", "여성", 12, "2003-01-01"),
(3, "구름이이", 2, "2반", "남성", 11, "2004-01-01")
;

SELECT *
FROM highschool_students;

INSERT INTO highschool_students
VALUES
(4, "김김김", 2, "2반", "여성", 11, "2204-01-01"),
(5, "나나나", 1, "3반", "남성", 10, "2204-01-11"),
(6, "다다다", 2, "3반", "여성", 11, "2004-10-11");

INSERT INTO highschool_students
VALUES
(7, "구구구", 3, "4반", "남성", 16, "2204-01-01"),
(8, "나구구", 2, "4반", "남성", 16, "2204-01-01"),
(9, "구름구구", 2, "5반", "여성", 12, "2234-03-02");

INSERT INTO highschool_students
VALUES
(10, "한형준", 2, "2반", "남성", 8, "1104-11-11"),
(11, "한형주", 3, "2반", "남성", 7, "1114-11-11");

INSERT INTO highschool_students
VALUES
(12, "한형", 3, "3반", "남성", 6, "1104-02-21"),
(13, "한형", 3, "3반", "남성", 6, "1004-02-21");

CREATE TABLE highschool_students (
       student_no    VARCHAR(20)  NOT NULL PRIMARY KEY,
       student_name  VARCHAR(100) NOT NULL,
       grade         TINYINT          NULL,
       class         VARCHAR(50)      NULL,
       gender        VARCHAR(20)      NULL,
       age           SMALLINT         NULL,
       enter_date    DATE
);

DESC highschool_students;

INSERT INTO highschool_students
VALUES
(14, "한주", 2, "2반", "여성", 5, "3304-02-21"),
(15, "주한", 2, "2반", "남성", 6, "1004-02-21");

ALTER TABLE highschool_students
DROP PRIMARY KEY;

INSERT INTO highschool_students
VALUES
(16, "물주", 2, "2반", "여성", 5, "3304-02-21"),
(17, "건물주", 2, "2반", "남성", 6, "1004-02-21"),
(18, "빌딩주인", 3, "3반", "남성", 5, "1004-12-22"),
(19, "주인", 3, "3반", "남성", 5, "1004-12-22");

INSERT INTO highschool_students
VALUES
(20, "겅물주", 2, "2반", "여성", 5, "3304-02-21"),
(21, "물물주", 2, "7반", "남성", 5, "1224-02-21");

INSERT INTO highschool_students
VALUES
(22, "강물주", 2, "2반", "여성", 5, "3304-02-21"),
(23, "물건주인", 2, "2반", "여성", 5, "3304-02-21"),
(24, "물건물건", 3, "222반", "남성", 122, "1114-01-01"),
(25, "물병사주세요", 4, "12반", "여성", 122, "1114-03-14"),
(26, "물병자리", 3, "3반", "남성", 12342, "1114-03-15");

INSERT INTO highschool_students
VALUES
(27, "물물주", 2, "2반", "여성", 5, "3304-02-21"),
(28, "물무주", 3, "122반", "남성", 444, "1204-02-21"),
(29, "무리주", 4, "222반", "남성", 24, "2004-02-21");

SELECT table_name, table_rows
FROM information_schema.tables
WHERE table_schema = 'groomi';

INSERT INTO highschool_students
VALUES
(30, "무리주", 4, "222반", "남성", 24, "2004-02-21"),
(31, "무무아아", 5, "11반", "남성", 123, "2004-02-30");

INSERT INTO highschool_students
VALUES
(32, "무무무우", 4, "222반", "남성", 24, "2224-02-21"),
(33, "아무도", 5, "11반", "남성", 123, "2041-02-22");

INSERT INTO highschool_students
VALUES
(34, "구우", 4, "222반", "남성", 24, "2224-12-15"),
(35, "구ㄱ우", 4, "222반", "남성", 24, "2224-12-15"),
(36, "구우우", 4, "123424반", "남성", 22424, "2422-12-15");

SELECT 
    'box_office' AS table_name, COUNT(*) FROM box_office
UNION ALL
SELECT 'departments', COUNT(*) FROM departments
UNION ALL
SELECT 'dept_emp', COUNT(*) FROM dept_emp
UNION ALL
SELECT 'dept_manager', COUNT(*) FROM dept_manager
UNION ALL
SELECT 'employees', COUNT(*) FROM employees
UNION ALL
SELECT 'highschool_students', COUNT(*) FROM highschool_students
UNION ALL
SELECT 'salaries', COUNT(*) FROM salaries
UNION ALL
SELECT 'titles', COUNT(*) FROM titles;


INSERT INTO highschool_students
VALUES
(37, "부우부", 4, "1반", "남성", 2, "2000-11-11"),
(38, "줄자", 5, "1반", "남성", 3, "2001-11-11"),
(39, "룰러", 3, "2반", "남성", 1, "2011-11-11"),
(40, "구구름", 2, "3반", "남성", 3, "2000-11-11");


















