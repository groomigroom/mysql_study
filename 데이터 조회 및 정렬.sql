USE WORLD;

DESC city;

#auto_increment는 자동으로 증가를 시켜주는 거 지정을 따로 안해도.

SELECT id, name, countrycode, district, population
FROM city;

SELECT district, countrycode, name, id
FROM city;

SELECT *
FROM city LIMIT 5;
#최대 튜플 수를 5개로 제한하기.

SELECT *
FROM world.country;
#world 데이터 베이스 안에 있는 country를 들어갈 때, 다른 데이터베이스에 있는 상태에서도 볼 수 있음.ALTER


SELECT *
FROM groomi.highschool_students;

SELECT *
FROM city
WHERE countrycode = 'KOR';

SELECT count(1)
FROM city;
#위에꺼는 column 개수 세는거

#연산자 중에 !=과 <>의 의미가 같음

#BETWEEN 값1 AND 값2는 날짜 비교할 때 많이 씀.

SELECT *
FROM city
WHERE countrycode = 'KOR'
AND district LIKE '%ong%';

#column LIKE 'A%'는 A로 시작하는 모든 값. '%A'는 중간에 A가 하나라도 있으면 됨.

SELECT *
FROM city
WHERE countrycode = 'KOR'
AND 2 > 3;

#AND 뒤에 다 거짓을 넣으니까 결과가 안 나옴.

SELECT code, name, continent, region, population
FROM country
WHERE population > 100000000;

SELECT code, name, continent, region, population
FROM country
WHERE population >= 45000000
AND population <= 55000000;

SELECT code, name, continent, region, population
FROM country
WHERE population BETWEEN 45000000 AND 55000000;
#위에 쿼리랑 같다 아래꺼가 더 실용적임.



#IN 연산자는 여러 개의 값이 포함되어 이쓴지 확인하는 것

USE groomi;

SELECT *
FROM box_office
WHERE release_date BETWEEN '2019-01-01' AND '2019-12-31'
AND audience_num >= 5000000;

#and, or 연산에 () 사용도 가능함.

SELECT *
FROM box_office;

SELECT seq_no, years, audience_num / 1000 AS audience_1000
FROM box_office;

#AS는 볼 때만 보이는 새로운 속성값 만드는 것

SELECT *
FROM box_office
WHERE years = 2012
AND release_date BETWEEN '2019-01-01' AND '2019-12-31'
ORDER BY release_date DESC;

#order by는 오름차순 및 내림차순 정렬로 정렬할 때 사용하는 거, ASC는 오름차순 DESC는 내림차순 ASC는 생략 가능

USE world;
SELECT code, name, continent, region, population
FROM country
WHERE population > 100000000
ORDER BY population DESC, continent ASC;

SELECT name, continent, region
FROM country
WHERE population > 50000000
ORDER BY continent, region;

#ORDER BY 4, 3, 2는 column의 4번째, 3번째, 2번째 기준으로 정렬하는 거.  column이 속성 4 3 2 순으로 정렬하는 거

