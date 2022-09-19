#join
use web0315;

select * from owner;
select * from car;


# 회원명 핸드폰번호 자동차번호 브랜드 가격
select 
	o.name,
	o.phone,
    c.carnum,
    c.brand,
    c.price
from owner o join car c on o.id = c.id;


# sub query
# 방법1 → 단점) 자바에서 2번 작업해야한다.
select avg(price) from car;
select * from car where price > 12480;

# 방법 2
# (select avg(price) from car) ← 하나의 값처리를 한다.
select * from car where price > (select avg(price) from car);


# apple의 자동차 중에서 가장 비싼 자동차 가격
# (select * from car where id = 'apple') r ← r을 쓴이유는 
# from절 뒤라서 테이블로 치는데 테이블 이름이 없기 때문에 r이라는 테이블명을 정해준 것이다.
select max(price) from (select * from car where id = 'apple') r;

# 차번호, 브랜드, 가격, 자동차 평균 가격
select carnum 차량번호, brand 브랜드, price 가격, (select avg(price) from car) 평균가격 from car;


create table test(
	intdata int primary key auto_increment,
    strdata varchar(1000),
    timedata datetime
);

select * from test;


insert into test (strdata, timedata) values('첫번째 문자열', now());
insert into test (strdata, timedata) values('두번째 문자열', now());







