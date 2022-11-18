show databases;
use world;
show tables;

select * from city;
select name, population from city; 
select * from city where population > 8000000 and population < 8500000;
select * from city where countryCode = 'kor' and population >= 1000000;

select * from city where population between 7000000 and 8000000;

select * from city where name in('seoul', 'new york'); 
select * from city where countrycode in ('kor', 'usa', 'jpn');

select * from city where countrycode like 'ko_';
select * from city where name like 'tel %';

select * from city where countrycode = ( select countrycode from city where name = 'seoul');
select * from city where population > any ( select population from city where district = 'new york');

select * from city order by population desc;

select * from city where countrycode = 'kor' order by population desc;

select * from country order by surfacearea desc;

select distinct countrycode from city;

select * from city order by population desc limit 10; 
select countrycode, max(population) from city group by countrycode;
select count(*) from city;
select countrycode, max(population) from city group by countrycode having max(population) > 8000000;
select * from city join country on city;