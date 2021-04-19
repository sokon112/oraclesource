select * from employees;

select * from tab;

select * from locations;

select * from departments;

select first_name,last_name,job_id from employees;

select last_name,job_id from employees where employee_id =176;

select last_name,salary from employees where salary >=12000;

select last_name,salary from employees where salary >12000 or salary <5000;


select last_name,salary 
from employees 
where department_id in(20,50) 
and 
salary between 5000 and 12000;

select last_name,salary from employees
where salary not between 5000 and 12000;

select last_name,employee_id,hire_date from employees
where hire_date between '2008-02-20' and '2008-05-01'
order by hire_date desc;

select last_name,hire_date from employees
where hire_date between '2004-01-01'and'2004-12-31'
order by hire_date;

select * from employees where last_name like 'S%';

select * from employees where first_name like '%ev%';


-- test
select last_name,hire_date from employees
where hire_date like '04%'order by hire_date;

select employee_id,last_name from employees
where last_name like '%u%';

select last_name from employees
where last_name like '___a%';

select last_name from employees
where last_name like '%a%' or last_name like '%e%' 
order by last_name;

select last_name from employees
where last_name like '%a%' and last_name like '%e%' 
order by last_name desc;

--test2

select last_name,job_id from employees
where manager_id is null;

select distinct department_id from employees
where job_id not in('sh_clerk') and department_id is not null;

select employee_id,first_name,job_id,salary * commission_pct as COMMISSION 
from employees
where commission_pct is not null;


select length('속도'), lengthb('속도') from dual;

select first_name from employees where length(first_name)>=8;

select job_id, substr(job_id,1,2),substr(job_id,4) from employees;

select last_name, substr(last_name,3) from employees;




select instr('Hello, Oracle!','l') as first_one, instr('Hello, Oracle!','l',5)as second_one,
instr('Hello, Oracle!','l',2,2)as third_one from dual;
select instrb('버퍼 스트림, 버퍼리더 등이 있음','버퍼',2) from dual;



select first_name,last_name from employees where instr(first_name,'s')>0;

select replace('버퍼 스트림, 버퍼리더 등이 있음','퍼','스') from dual;

select replace('010-1234-5678','-',' '),replace('010-1234-5678','-') from dual;



-- test
select employee_id,first_name,lower(job_id)from employees
where first_name ='Curtis';

select employee_id,first_name||' '||last_name,
replace(job_id,'IT_PROG','programmer') from employees
where department_id between 60 and 90;


select round(1234.567) as rd,
    round(1234.567,0) as rd0,
    round(1234.567,1) as rd1,
    round(1234.567,2) as rd2,
    round(1234.567,-1) as rd_minus1,
    round(1234.567,-2) as rd_minus2
from dual;

select trunc(1234.5678) as tc,
    trunc(1234.5678,0) as tc0,
    trunc(1234.5678,1) as tc1,
    trunc(1234.5678,2) as tc2,
    trunc(1234.5678,-1) as tc_minus1,
    trunc(1234.5678,-2) as tc_minus2
from dual;

select ceil(1234.2378) as cl,
    floor(1234.2378) as fl,
    ceil(-1234.2378) as cl_minus,
    floor(-1234.2378) as fl_minus
from dual;

--나머지
select mod(15,6),mod(10,2),mod(11,2) from dual;

select sysdate from dual;

select sysdate as now,
    sysdate-1 as yeterday,
    sysdate+1 as tomorrow
from dual;

select sysdate as today,
    add_months(sysdate,3) as three
from dual;


select employee_id,hire_date,add_months(hire_date,120)from employees;


select * from employees
where add_months(hire_date,160)>sysdate;



--test4
select last_name,salary,
    case
        when salary<1999 then 0
        when salary between 2000 and 3999 then 0.09
        when salary between 4000 and 5999 then 0.2
        when salary between 6000 and 7999 then 0.3
        when salary between 8000 and 9999 then 0.4
        when salary between 10000 and 11999 then 0.42
        when salary between 12000 and 13999 then 0.44
        else 0.45
    end as tax_rate
from employees where department_id=80;

--test5
select count(distinct manager_id) as mg from employees;

--test6
select department_id,count(employee_id) as howmany 
from employees group by department_id
order by department_id;

--test7
select department_id,round(avg(salary)) as avrage from employees
group by department_id order by department_id;

--test8
select job_id,count(job_id)as howmany from employees
group by job_id;

--test
select manager_id, min(salary) from employees
group by manager_id
having manager_id is not null and min(salary)>=6000
order by min(salary) desc;


--join ex1
select e1.hire_date, e1.last_name, e1.manager_id
from employees e1, employees e2
where e1.manager_id = e2.employee_id
and e1.hire_date < e2.hire_date;

select e1.hire_date, e1.last_name, e1.manager_id
from employees e1 join employees e2 on e1.manager_id = e2.employee_id
and e1.hire_date < e2.hire_date;

--join ex2
select e.employee_id,e.last_name,d.department_id,l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
    and d.location_id = l.location_id
    and l.city like 'S%';
    
--join ex3
select e.employee_id,e.last_name,d.department_id, e.salary
from employees e, departments d
where e.department_id = d.department_id
    and d.location_id = 1700;
    
--join ex4
select d.department_name,d.location_id,count(*),round(avg(e.salary),2)
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name,d.location_id;

--join ex5
select e.department_id, e.last_name, e.job_id
from employees e, departments d
where e.department_id = d.department_id
and d.department_name = 'Executive';

--join ex6
select e1.department_id, e1.first_name ||' '|| e1.last_name as name
from employees e1, employees e2
where e1.department_id = e2.department_id
and e1.salary<e2.salary
and e1.hire_date<e2.hire_date
order by e1.department_id;


--sub query ex(InLineView)
select 
    last_name,avg_sal,e2.department_id,e2.salary
from (select department_id, round(avg(salary))as avg_sal
        from employees group by department_id) e1,
     employees e2
where e1.department_id = e2.department_id
and e2.salary < e1.avg_sal
order by department_id desc, salary desc;

--s.q1
select last_name,job_id,salary
from employees e1,
    (select max(salary)as saman_max from employees where job_id = 'SA_MAN') e2
where e1.salary > e2.saman_max;

--s.q2
select last_name, department_id, salary
from employees e1,
    (select ;
    
--s.q3
select e1.last_name, e1.hire_date
from employees e1,
    (select hire_date from employees where last_name = 'Davies') e2
where e1.hire_date > e2.hire_date;

--s.q4
select e1.last_name,e1.salary
from employees e1,
    (select employee_id from employees where last_name = 'King') e2
where e1.manager_id = e2.employee_id;

--s.q5
select e1.employee_id,e1.hire_date
from employees e1,
    (select department_id from employees where last_name = '') e2
where e1.manager_id = e2.employee_id;

--s.q6
select e1.last_name, e1.department_id,e1.salary,e1.commission_pct
from employees e1,
    (select salary,nvl(commission_pct,0)as commit 
     from employees 
     where last_name = 'Kochhar') e2
where e1.salary = e2.salary
and nvl(e1.commission_pct,0) = e2.commit
and last_name != 'Kochhar';
    














