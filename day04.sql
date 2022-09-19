# auto_increment
use web0315;
create table product(
	prodnum int primary key auto_increment,
    prodname varchar(300) not null,
    prodprice int not null,
    # regdate 등록시간
    regdate datetime
);

insert into product(prodname, prodprice)
values('구찌 지우개', 100000);
insert into product(prodname, prodprice)
values('구찌 연필', 100000);

select * from product;

insert into product(prodname, prodprice, regdate)
values('구찌 공책', 300000, '2022-04-13 19:25:37');

# 현재시간으로 등록을 나타낼 때
insert into product(prodname, prodprice, regdate)
values('구찌 필통', 250000, now());

select * from product;

# Like 조건식
select * from product where prodname like('%구찌%');
select * from product where prodname like('%필%');

# 단일행 함수
# 문자함수
# 문자열 연결, 문자열 길이
select concat('He', 'llo'), length('flower') from dual;

# 숫자함수
# 올림, 버림, 반올림
select ceil(3.14), floor(3.14), round(3.141592, 2) from dual;

# 널처리 함수( Null 값을 0 등으로 바꾸고 싶을 때)
select ifnull(regdate, '등록날짜 없음') "등록시간" from product where prodname = '구찌 지우개';

# 그룹함수
use world;
select * from country;
select count(Population) from country;
# null 값도 세고 싶어서 사용
# '????'는 null대신 숫자가 아닌 아무 값넣어서 데이터 갯수 확인
select count(ifnull(IndepYear, '????')) from country;
select sum(Population), avg(population), max(population), min(population) from country;

# 단축키 : Ctrl + D : 바로 아래로 복사

# 대륙별 총 인구수
select Continent 대륙, sum(population) "총 인구수" from country group by Continent;

# 대륙별로 정렬
select Continent 대륙, Region 지역, sum(population) "총 인구수" 
from country group by Continent, Region order by 1,2 desc;

# 대륙별, 지역별 총 인구수
select Continent 대륙, Region 지역, sum(population) "총 인구수" 
from country where sum(Population) > 100000000
group by Continent, Region order by 1,2 desc;


use world;
#대륙별로 평균 gnp 검색
select avg(gnp) from country group by Continent; 

#gnp 평균이 100000 이상인 지역들의 지역명, gnp 최대값, gnp 최소값, gnp 평균 검색
# group by를 사용하고 조건문을 사용할거면 having을 사용해야 한다.
select Region 지역명, max(gnp), min(gnp), avg(gnp) from country  group by Region having avg(gnp) > 100000;

#대륙별 평균 인구를 출력하되 15000000명을 넘는 대륙만 검색
select Continent 대륙, avg(Population) "평균 인country구" from country where population > 150000000 group by Continent order by 1 asc;

#인구수가 2000만명을 넘는 나라들의 평균 넓이가 2000000 제곱km를 넘는 대륙들만 검색
select Continent 대륙 from country where population > 20000000 group by Continent having avg(SurfaceArea) > 2000000;

#대륙별, 그리고 지역별로 나라들의 평균 수명 검색
select Continent 대륙별, Region 지역별, avg(LifeExpectancy) "평균 수명" from country group by Continent, Region order by 1,2; 


