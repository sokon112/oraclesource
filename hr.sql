select * from employees;

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


















