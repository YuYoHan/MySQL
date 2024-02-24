# 서브쿼리
# id가 14인 임직원보다 생일이 빠른 임직원의 ID, 이름, 생일을 알고 싶다.
select id, name, bith_date from employee
	where birth_date < ( select birth_date from employee where id =1);
 
# ID가 5인 임직원과 같은 프로젝트에 참여한 임직원들의 ID와 이름를 알고 싶다.
# where절 서브 쿼리
select id, name from employee
	where id in(
		select distinct empl_id 
        from works 
		where empl_id != 5 and proj_id in(
			select proj_id 
            from works where empl_id =5)
            );
# from절 서브 쿼리 
# 여기서 id는 employee를 가르키고 from절 서브쿼리의 id가 employee id와 같으면 조건에 맞다.           
select id, name 
from employee,
	(
		select distinct empl_id 
        from works 
		where empl_id != 5 and proj_id in(
			select proj_id 
            from works where empl_id =5)
	) as DSTINCT_E
where id = DSTINCT_E.empl_id;

# ID가 7 혹은 12인 임직원이 참여한 프로젝트의 ID와 이름을 알고 싶다.
# exists : 존재하는 것을 찾아준다.


    
    