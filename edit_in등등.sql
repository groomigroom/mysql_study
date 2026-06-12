create table 점수22
(
	stu_name varchar(50),
	score integer
);

insert into 점수22
values
("김구름", 100),
("구름이", 90),
("구름씨", 80),
("비숑", 70);

select *
from 점수22
where score > any(
select score
from 점수22
where score <= 80); -- any대신에 some도 같음.
-- 구름씨나, 비숑의 점수보다 높으면 되므로, 구름씨도 조회됨.


select *
from 점수22
where score > all(
select score
from 점수22
where score <= 80);
-- 이건 구름씨 조회 안됨.

create table 고객주문
(
	name_bar varchar(50),
	id varchar(50),
	주문날짜 date,
	주문장소 varchar(50)
);

insert into 고객주문
values
("김구름이", "kimgroomi", "2026-06-12", "광주광역시"),
("김구름", "kimgroom", "2026-06-12", "광주광역시"),
("sqlsql", "sqlsqld", "2026-06-13", "서울특별시"),
("python", "pythonee", "2026-06-14", "제주도");

select *
from 고객주문
where id in
(select 주문장소
from 고객주문
where 주문장소 = "광주광역시");
