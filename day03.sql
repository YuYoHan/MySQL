use web0315;
# 데이터 삽입

# null이 들어간다.
insert into car (carnum, brand, color)
values('123가4567','Ferrari','Red');
insert into owner
values('apple', '김사과', '01012234123', 20, '서울시 송파구 잠실동');
# foreign key는 비어있게 넣을 수는 있지만, 참조값이 없는 경우에는 삽입 불가능
# insert into car
# values('134다7961', 'k8', 'White', 4000000, 'banana');
insert into car
values('135다7961', 'k8', 'White', 4000000, 'apple');


# *은 모든 파일이라는 의미
# 간단하게 테이블의 데이터 확인하기
select * from car;
select * from owner;

# 데이터 삭제
delete from car where carnum = '135다7961';

insert into car
values('135다7961', 'k8', 'White', 4000000, 'apple');
# 한줄로 insert, values 같이 사용
insert into car values ('246다2468', 'Porsche', 'Yellow', 180000000, 'apple');
delete from car where id ='apple';

# 데이터 수정
# null 비교는 is(컬럼 is null / 컬럼 is not null)
update car set id = 'apple'  where id is null;
update car set price = 650000000 where carnum = '123가4567';

# 데이터 검색
# 검색된 결과가 하나의 표다.
select carnum, price, id from car;
select price from car where carnum = '123가4567';

select * from car where price > 100000000;

# 별칭(ALIAS)
# 원래는 as를 써야하는데 생략 가능!
select carnum as 차번호, price 가격 from car where price > 100000000;
# dual : 간단한 값이나 연산의 결과를 검색하기 위한 한 행짜리 내장 테이블
# 별칭이 키워드거나 띄어쓰기가 포함된 경우 쌍따옴표로 묶어준다.
select 1+1+12 *364/112 "계산된 결과" from dual; 

select * from car where brand = 'Ferrari' or brand = 'Porsche';
# 컬럼 in (값1, 값2, ...) : 컬럼에 존재하는 값이 뒤
select * from car where brand in('Ferrari', 'Porsche');

select * from car where price >= 100000000 and price <= 200000000;
# 컬럼 between 값1 and 값2 : 컬럼의 값이 값1 이상 값2 이하 이면 참
select * from car where price between 100000000 and 200000000;

# 문자열 대소비교 가능(사전순으로 뒤에 있는 값이 더 큰값)
select * from car where brand > 'Lemon';

use world;
select * from country;
select * from city;


#☆★☆★☆★☆★			database : web0315			☆★☆★☆★☆★☆★☆★
use web0315;
# owner에 두명 더 추가하기(banana, cherry)
insert into owner values('banana','바나나', 01012345678, 22, '서울시 구로구');
insert into owner values('cherry', '체리', 01098245568, 24, '서울시 양천구');

# car에 3대 더 추가하기(cherry의 2000만원 이하짜리 필수, banana의 4000이상 1억이하 필수)
insert into car values('111다1111', 'k8', 'Black', 4000000, 'banana');
insert into car values('222가2222', 'genesis','Black',90000000,'banana');
insert into car values('333나3333', 'tico', 'Red', 3000000,'cherry'); 

# car에서 banana의 자동차 중 4000만원 이상 1억원 이하의 자동차 색깔을 Gold로 바꾸기
update car set color = 'Gold' where id = 'banana' and price between 40000000 and 100000000;

# car에서 cherry 자동차 중 2000만원 이하의 자동차 삭제하기
delete from car where id = 'cherry' and price <= 20000000;

select * from owner;
select * from car;

#☆★☆★☆★☆★			database : world			☆★☆★☆★☆★☆★☆★
use world;
#country 테이블
#소속 대륙(Continent)이 Asia인 나라 검색
select * from country where Continent = 'Asia';  

#소속 대륙(Continent)이 Europe이 아닌 나라 검색
select * from country where Continent != 'Europe';

#인구수(Population)가 1000만 이하인 나라 검색
select * from country where Population <= 10000000;

#인구수(Population)가 7000만 이상인 나라 검색
select * from country where Population >= 70000000;

#인구수(Population)는 4500만 이상이면서 넓이(SurfaceArea)가 10만제곱km이하인 나라 검색
select* from country where Population >= 45000000 and SurfaceArea <= 100000;

#소속 대륙(Continent)은 Asia 이고 건국 연도(IndepYear)가 1948인 나라 검색
select * from country where Continent = 'Asia' and IndepYear = 1948;

#지역(Region)이 동아프리카(Eastern Africa) 이고 건국 연도 가 1970~1980인 나라 검색
select * from country where Region = 'Eastern Africa' and IndepYear between 1970 and 1980;