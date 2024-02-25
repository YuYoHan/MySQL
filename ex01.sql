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
select P.id, P.name
	from project P
    where exists (
		select W.proj_id
        from works W
        where W.empl_id in(7, 12)
        );
        
# 위에꺼와 같은 의미
select P.id, P.name
	from project P
    where id in(
		select W.proj_id
        from works W
        where W.empl_id in(7, 12)
        );        

# 2000년대생이 없는 부서의 ID와 이름을 알고싶다.
select D.id, D.name
from department as D
where not exists(
	select * from employee E
    where E.dept_id = D.id and E.birth_date >= '2000-01-01'
    );
    
# 리더보다 높은 연봉을 받는 부서원을 가진 리더의 Id와 이름과 연봉을 알고 싶다.
# <>는 != 와 같다.
# any : 단 하나라도 조건에 맞는게 있다면 true
# some == any
select E.id, E.name, E.salary
from department D, employee E
where D.leader_id = E.id and E.salary < any(
		select salary
        from employee
        where id <> D.leader_id and dept_id = E.dept_id
        );
        
        
    
    