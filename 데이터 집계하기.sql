USE world;

-- GROUP BY는 WHERE 뒤에 씀
SELECT continent
FROM country
GROUP BY continent;

SELECT continent, region
  FROM country
 GROUP BY continent, region
 ORDER BY 1, 2;
 
 SELECT SUBSTR(district,1,6) "구구"
  FROM city
 WHERE countrycode = 'KOR'
 GROUP BY SUBSTRING(district,1,6)
 ORDER BY 1;
 
 -- 이건 에러뜸 SELECT의 내용에 GROUP BY의 내용이 포함이 안되어서.
 SELECT continent
  FROM country
 GROUP BY region
 ORDER BY 1;
 
  SELECT continent, region
  FROM country
 GROUP BY region
 ORDER BY 1;
 
 -- 위에 명령 실행하려면
 -- 이 명령은 MySQL의 엄격한 그룹화 규칙인 ONLY_FULL_GROUP_BY 모드를 현재 세션에서만 일시적으로 해제하겠다는 의미입니다.
 SET SESSION sql_mode = (SELECT REPLACE(@@SESSION.sql_mode, 'ONLY_FULL_GROUP_BY', ''));
 -- 아래꺼로 다시 그룹화 규칙 적용하기
  SET SESSION sql_mode = CONCAT(@@SESSION.sql_mode, ',ONLY_FULL_GROUP_BY');

-- DISTINCT는 값 중복이 있어도 한번만 출력하라는 의미 (중복 제거) -> 값 종류만 보고 싶을 때.
-- GROUP BY는 선택한거를 그룹으로 묶고, 각 그룹당 한줄씩 출력 (집계)-> COUNT, SUN, AVG, MAX, MIN 등을 포함해서 씀. 항목별 개수, 합계, 평균 등을 구할 때.

SELECT DISTINCT continent
  FROM country;  
  
SELECT region, COUNT(*)
FROM country
GROUP BY region;

-- #####
SELECT DISTINCT region, COUNT(*)
FROM country;
 
-- continent에 NULL값이 있으면 개수에 조회 안됨.
SELECT COUNT(*), COUNT(continent)
  FROM country;
  

SELECT COUNT(*), COUNT(2)
  FROM country
 WHERE continent = 'Europe';
 
 SELECT COUNT(DISTINCT continent)
  FROM country; 
  
SELECT MAX(population), MIN(population), AVG(population)
  FROM COUNTRY
 WHERE continent = 'Europe';
 
 USE groomi;
 SELECT YEAR(release_date) release_year, COUNT(*)
  FROM box_office
 GROUP BY YEAR(release_date)
 ORDER BY 1 DESC; 
 
SELECT movie_type, MAX(sale_amt) sale_max, MIN(sale_amt) sale_min, SUM(sale_amt) sale_sum
  FROM box_office
 WHERE YEAR(release_date) = 2019
 GROUP BY movie_type
 ORDER BY 1;
 
 SELECT QUARTER(release_date) 분기, distributor 배급사, 
       COUNT(*) 영화편수, ROUND(SUM(sale_amt) / 100000000) 매출_억원
  FROM box_office
 WHERE 1=1 -- 그냥 개발자 스타일 AND 여러개 넣을 때, 참 하나 넣어두고, AND 넣는거.
   AND EXTRACT(YEAR FROM release_date) =  2019
   AND distributor IS NOT NULL
   AND sale_amt >= 100000000
 GROUP BY QUARTER(release_date), distributor
 ORDER BY 1, 2, 3;
 
 SELECT movie_type 영화유형, SUM(sale_amt) 금액
  FROM box_office
 WHERE YEAR(release_date) = 2019
   AND SALE_AMT > 10000000
 GROUP BY movie_type
 ORDER BY 1 DESC;
 
 USE world;
 
 SELECT CountryCode, COUNT(*)
 FROM city
 GROUP BY CountryCode;
 
USE groomi;
 
-- WITH ROLLUP은 총계를 구하는거.
 SELECT IFNULL(movie_type, '소계') AS 영화유형, SUM(sale_amt) 금액
  FROM box_office
 WHERE YEAR(release_date) = 2019
   AND SALE_AMT > 10000000
 GROUP BY movie_type WITH ROLLUP;
 
 -- GROUPING()으로 소계인지 확인하기
 
 SELECT MONTH(release_date) 월, movie_type 영화유형, SUM(sale_amt) 금액, GROUPING(movie_type)
  FROM box_office
 WHERE YEAR(release_date) = 2019
   AND QUARTER(release_date) = 1
   AND SALE_AMT > 10000000 
 GROUP BY MONTH(release_date), movie_type WITH ROLLUP;
 
 -- 제한 해제 후에 하기
  SELECT IFNULL(MONTH(release_date), '총계') AS 월, movie_type 영화유형, SUM(sale_amt) 금액, GROUPING(movie_type)
  FROM box_office
 WHERE YEAR(release_date) = 2019
   AND QUARTER(release_date) in(1, 2)
   AND SALE_AMT > 10000000 
 GROUP BY QUARTER(release_date), MONTH(release_date), movie_type WITH ROLLUP;
 
 -- 제약 해제 후에
 SELECT CountryCode, COUNT(DISTINCT CountryCode)
 FROM city;
 
 DESC city;
 
 SELECT IF(GROUPING(movie_type) = 1, '전체합계', IFNULL(movie_type, '기타')) 영화유형, 
       SUM(sale_amt) 금액 
  FROM box_office
 WHERE YEAR(release_date) = 2019
 GROUP BY movie_type WITH ROLLUP;
 
 SELECT EXTRACT(YEAR_MONTH FROM release_date) 개봉년월, 
       COUNT(*) 개봉편수
  FROM box_office
 WHERE ranks BETWEEN 1 AND 10
 GROUP BY EXTRACT(YEAR_MONTH FROM release_date)
 ORDER BY 1 DESC;
 
 
 -- WHERE절에 집계함수 쓸 수 없음.
 SELECT EXTRACT(YEAR_MONTH FROM release_date) 개봉년월, 
       COUNT(*) 개봉편수
  FROM box_office
 WHERE 1=1
   AND ranks BETWEEN 1 AND 10
   AND COUNT(*) > 1
 GROUP BY EXTRACT(YEAR_MONTH FROM release_date)
 ORDER BY 1 DESC;
 
 SELECT EXTRACT(YEAR_MONTH FROM release_date) 개봉년월, 
       COUNT(*) 개봉편수
  FROM box_office
 WHERE 1=1
   AND ranks BETWEEN 1 AND 10
 GROUP BY EXTRACT(YEAR_MONTH FROM release_date)
 HAVING COUNT(*) > 1
 ORDER BY 1 DESC;
 
 SELECT EXTRACT(YEAR_MONTH FROM release_date) 개봉년월, 
       COUNT(*) 개봉편수,
       GROUP_CONCAT(movie_name ORDER BY ranks SEPARATOR ', ') AS 영화제목,
       ROUND(SUM(sale_amt) / 100000000) 금액_억원
  FROM box_office
 WHERE 1=1
   AND ranks BETWEEN 1 AND 10
 GROUP BY EXTRACT(YEAR_MONTH FROM release_date)
 HAVING ROUND(SUM(sale_amt) / 100000000) >= 1500
 ORDER BY 1 DESC;
 
 
