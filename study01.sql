use world;

select avg(population) from city;

select countrycode, max(population) from city group by  countrycode having max(population) > 8000000;

select countrycode, name, sum(population) from city group by countrycode, name with rollup;

