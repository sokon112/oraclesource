-- scott ������ ��� ���̺� ��ȸ
select * from tab;

-- bonus ���̺��� ��� ���� ��ȸ
select * from bonus;

-- emp ���̺��� ��� ���� ��ȸ
select * from emp;

select * from salgrade;

select * from dept;
-- emp ���̺��� empno, ename ��ȸ
select empno,ename from emp;

-- emp ���̺��� empno,job,hiredate ��ȸ
select empno,job,hiredate from emp;

-- �ߺ��� �� ���� : DISTINCT
select deptno from emp;
select DISTINCT deptno from emp;

-- ��Ī
SELECT empno from emp;
SELECT empno as �����ȣ from emp;
SELECT empno �����ȣ from emp;
SELECT empno "�����ȣ" from emp;
SELECT empno as "��� ��ȣ" from emp;


SELECT ename,sal,sal*12+comm,comm FROM emp;
SELECT ename,sal,sal*12+comm as ����,comm FROM emp;

-- ename(�����), job(��å) ��Ī�� ���� �� emp ��ȸ
SELECT ename �����,job as "�� å" from emp;

-- ���� : ORDER BY �����Ϸ��� �� �̸� ���Ŀɼ�(ASC(��������),DESC(��������)

-- ENAME,SAL ��ȸ(SAL ��������)
select ename,sal from emp order by sal DESC;
select ename,sal from emp order by sal;

-- ��ü �����͸� ��ȸ�� �� SAL ��������
SELECT * FROM emp ORDER BY sal DESC;

-- EMPNO,ENAME,JOB ��ȸ�� �� EMPNO ��������
SELECT EMPNO,ENAME,JOB FROM emp ORDER BY EMPNO;
SELECT EMPNO,ENAME,JOB FROM emp ORDER BY EMPNO ASC;

-- �μ���ȣ�� ���������� �޿��� �������� �����ϱ�
select * from emp ORDER BY deptno ASC,sal DESC;

-- ��ȸ�� ���̺��� EMP ���̺��̸� ��� ���� ����Ѵ�.
-- ��µǴ� ���� ��Ī�� ������ ���� �����Ѵ�.
-- EMPNO : EMPLOYEE_NO
-- ENAME : EMPLOYEE_NAME
-- MGR : MANAGER
-- SAL : SALARY
-- COMM : COMMISSION
-- DEPTNO : DEPARTMENT_NO
--?
--[Q1] �μ���ȣ�� �������� ������������ �����ϵ� �μ� ��ȣ�� ���ٸ� ��� �̸��� �������� �������� �����Ѵ�.
select empno as EMPLOYEE_NO, ename as EMPLOYEE_NAME, mgr MANAGER, sal SALARY,
COMM COMMISSION, deptno as DEPARTMENT_NO, job,hiredate
from emp order by deptno desc, ename asc;

-- WHERE : ���ǿ� ���缭 ��ȸ

-- �μ���ȣ�� 30���� ��� ��ȸ
SELECT * FROM emp WHERE deptno=30;

-- �����ȣ�� 7782�� ������� ��ȸ
SELECT * FROM emp WHERE empno=7782;

-- �μ���ȣ�� 30�̰� �����å�� SALESMAN �� ��� ��ȸ
SELECT * FROM emp WHERE DEPTNO=30 AND job='SALESMAN';

-- �μ���ȣ�� 30�̰ų� �����å�� CLERK �� ��� ��ȸ
SELECT * FROM emp WHERE DEPTNO=30 OR job='CLERK';



-- ��������� : * / + -

-- SAL*12�� ���� 36000�� ��� ��ȸ
SELECT * FROM emp WHERE SAL*12 = 36000;

-- �񱳿����� : >, <, >=, <=

-- SAL �� ���� 3000 �̻��� ��� ��ȸ
SELECT * FROM emp WHERE SAL >= 3000;

-- �޿��� 2500 �̻� �̰�, ������ ANALYST�� ��� ��ȸ
SELECT * FROM emp WHERE SAL>=2500 AND job='ANALYST';

-- ��� �̸��� ù���ڰ� F�� ���ų� ������ �͸� ��ȸ
SELECT * FROM emp WHERE ename >= 'F';

-- ������ MANAGER, SALESMAN, CLERK �� ��� ��ȸ
SELECT * FROM emp WHERE job='MANAGER' OR job='SALESMAN' OR job='CLERK';

-- � �� ������( = (����), !=,<>,^= )

-- SAL �� 3000�� �ƴ� ������� ��ȸ
SELECT * FROM emp WHERE SAL != 3000;
SELECT * FROM emp WHERE SAL ^= 3000;
SELECT * FROM emp WHERE SAL <> 3000;

-- �� ���� ������ : NOT

SELECT * FROM emp WHERE NOT sal=3000;



-- IN : = 

SELECT * FROM emp WHERE job='MANAGER' OR job='SALESMAN' OR job='CLERK';
SELECT * FROM emp WHERE job IN('MANAGER','SALESMAN','CLERK');

-- NOT IN
SELECT * FROM emp WHERE job!='MANAGER' AND job^='SALESMAN' AND job<>'CLERK';
SELECT * FROM emp WHERE job NOT IN('MANAGER','SALESMAN','CLERK');

-- �μ���ȣ�� 10,20 ��� ��ȸ(IN)

SELECT * FROM emp WHERE DEPTNO IN(10,20);

-- BETWEEN A AND B : Ư�� ������ �����͸� ��ȸ

-- SAL 2000�̻� ~ 3000����
SELECT * FROM emp WHERE SAL>=2000 AND SAL<=3000;
SELECT * FROM emp WHERE SAL BETWEEN 2000 AND 3000;

-- SAL 2000�̻� ~ 3000���ϰ� �ƴ� ��� ��ȸ
SELECT * FROM emp WHERE SAL NOT BETWEEN 2000 AND 3000;


-- LIKE �����ڿ� ���ϵ� ī��
-- ���ϵ� ī�� : _(� ���ڵ� �� ���� ���ڸ� �ǹ�), %(���̿� ������� ��� ���ڸ� �ǹ�)

-- ��� �̸��� S�� �����ϴ� ��� ��ȸ
SELECT * FROM EMP WHERE ename LIKE 'S%'; 

-- ��� �̸��� �ι�° ���ڰ� L�� ��� ��ȸ
SELECT * FROM EMP WHERE ename LIKE '_L%';

-- ��� �̸��� AM�� ���ԵǾ� �ִ� ��� ��ȸ
SELECT * FROM EMP WHERE ename LIKE '%AM%'; 


-- ��� �̸��� AM�� ���ԵǾ� ���� �ʴ� ��� ��ȸ
SELECT * FROM EMP WHERE ename NOT LIKE '%AM%'; 


-- IS NULL
-- NULL : ���� �������� ����/�ش���� ����/Ȯ������ ���� ��
SELECT * FROM emp WHERE comm IS NULL;

SELECT * FROM emp WHERE mgr IS NULL;

SELECT * FROM emp WHERE not mgr IS NULL;
SELECT * FROM emp WHERE mgr IS NOT NULL;

-- ���� ������ : ������ - UNION(�ߺ��� ���� ���ŵ�), UNION ALL, ������-MINUS, ������ - INTERSECT

-- 10���μ��� 20�� �μ� ��ȸ
SELECT * FROM EMP WHERE deptno=10
UNION
SELECT * FROM EMP WHERE deptno=20;

SELECT * FROM EMP WHERE deptno=10
UNION ALL
SELECT * FROM EMP WHERE deptno=20;


SELECT * FROM EMP WHERE deptno=10
UNION
SELECT * FROM EMP WHERE deptno=10;

SELECT * FROM EMP WHERE deptno=10
UNION ALL
SELECT * FROM EMP WHERE deptno=10;


SELECT * FROM EMP
MINUS
SELECT * FROM EMP WHERE deptno=10;



SELECT * FROM EMP
INTERSECT
SELECT * FROM EMP WHERE deptno=10;

-- 20��, 30�� �μ��� �ٹ��ϰ� �ִ� ��� �� �޿��� 2000 �ʰ��� ����� ���� �����ڸ�
-- ����ؼ� ��ȸ�ϱ�

SELECT * FROM EMP WHERE SAL>2000
MINUS
SELECT * FROM EMP WHERE deptno=10;


SELECT * FROM EMP WHERE deptno=20 AND sal > 2000
UNION
SELECT * FROM EMP WHERE deptno=30 AND sal > 2000;

-- �Լ�
-- �����Լ� : ����Ŭ���� �⺻���� �����ϴ� �Լ�
-- ����� ���� �Լ�

-- ���� �Լ� 1) ��ҹ���
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM EMP;

-- ORCLE, oracle, Oracle => �Է°� �پ�
-- where lower(title) like '%oracle%'


-- ���� �Լ� 2) ����
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�')  FROM DUAL;

-- ENAME ����
SELECT ENAME, LENGTH(ENAME) FROM EMP;

-- ENAME ���̰� 5 �̻��� ��� ��ȸ
SELECT ENAME FROM EMP WHERE LENGTH(ENAME) >= 5;

-- �����Լ� : 3) ���ڿ� ����
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5)
FROM EMP;

-- EMP ���̺��� ��� ��� �̸��� ����° ���ں��� ������ ����ϱ�
-- �� �̸�, ����°~
SELECT ENAME, SUBSTR(ENAME,3) FROM EMP;


-- ���ڿ� �Լ� : 4) Ư�� ���� ��ġ ã��
SELECT INSTR('HELLO, ORACLE!','L') AS ù��°, INSTR('HELLO, ORACLE!','L',5) AS �ι�°,
INSTR('HELLO, ORACLE!','L',2,2) AS ����° FROM DUAL;

SELECT INSTR('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�','�̰�') FROM DUAL;

SELECT INSTR('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�','�̰�',2) FROM DUAL;

SELECT INSTRB('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�','�̰�',2) FROM DUAL;

-- ��� �̸��� S�� �ִ� ��� ��ȸ
SELECT * FROM EMP WHERE INSTR(ENAME,'S') > 0;

-- ���ڿ� �Լ� : 5) ���ڿ� ��ü
SELECT REPLACE('�̰��� Oracle�̴�','�̰���','This is') FROM DUAL;

-- 010-1234-5678 , 010 1234 5678, 01012345678
SELECT '010-1234-5678',REPLACE('010-1234-5678','-',' '),REPLACE('010-1234-5678','-')
FROM DUAL;


-- ���ڿ� �Լ� : 6) ���ڿ� ����
SELECT CONCAT(EMPNO,ENAME), CONCAT(EMPNO,CONCAT(':',ENAME))
FROM EMP WHERE ENAME='SMITH'; 

-- CONCAT() == ||
SELECT EMPNO || ENAME, EMPNO ||':'|| ENAME
FROM EMP WHERE ENAME='SMITH'; 

-- ���ڿ� �Լ� : 7) Ư�� ���� ���� - TRIM, LTRIM, RTRIM
SELECT '     �̰���     ',TRIM('     �̰���     ') FROM DUAL;

SELECT '[' || TRIM(' __ORACLE__ ') || ']' as TRIM,
'[' || LTRIM(' __ORACLE__ ') || ']' as LTRIM,
'[' || RTRIM(' __ORACLE__ ') || ']' as RTRIM 
FROM DUAL;

-- ���ڿ� �Լ� : 8) ���ڿ� �ݴ�� ó��
SELECT REVERSE('ORACLE') FROM DUAL;


-- �����Լ� : �ݿø�/�ø�/����/������ ��

-- �ݿø�
SELECT ROUND(1234.5678) AS ROUND, ROUND(1234.5678,0) AS ROUND0,
       ROUND(1234.5678,1) AS ROUND1,ROUND(1234.5678,2) AS ROUND2,
       ROUND(1234.5678,-1) AS ROUND_MINUS1,ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM DUAL;

-- ����
SELECT TRUNC(1234.5678) AS TRUNC, TRUNC(1234.5678,0) AS TRUNC,
       TRUNC(1234.5678,1) AS TRUNC1,TRUNC(1234.5678,2) AS TRUNC2,
       TRUNC(1234.5678,-1) AS TRUNC_MINUS1,TRUNC(1234.5678,-2) AS TRUNC_MINUS2
FROM DUAL;


-- ������ ���ڿ� ���� ����� ������ ã�� CEIL(ū����), FLOOR(���� ����)
SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM DUAL;

-- ������
SELECT MOD(15,6), MOD(10,2), MOD(11,2)
FROM DUAL;


-- ��¥ �Լ� : SYSDATE(����Ŭ ������ ��ġ�� os ���糯¥�� �ð�)
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW FROM DUAL;

-- �� ���� ������ ��¥ ���ϱ� : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM DUAL;

-- �Ի� 10�ֳ��� �Ǵ� ��¥ ���ϱ�
SELECT EMPNO,ENAME,HIREDATE,ADD_MONTHS(HIREDATE,120) FROM EMP;

-- ���� ��¥�� �������� �Ի� 45�� �̸��� ��� ��ȸ
SELECT * FROM EMP WHERE ADD_MONTHS(hiredate,540) > SYSDATE;

--test1
select empno, ename,sal,
    trunc(sal/21.5,2)as day_pay,
    round(sal/21.5/8,1)as time_pay
from emp;

--test2
select empno,ename,hiredate,
    to_char(next_day(add_months(hiredate,3),'월요일'),'YYYY-MM-DD')as r_job,
    --nvl2(comm,to_char(comm),'N/A')as comm
    nvl(to_char(comm),'N/A')as comm
from emp;

--test3
select empno,ename,mgr,
    case 
        when mgr is null then '0000'
        when mgr like '75__' then '5555'
        when mgr like '76__' then '6666'
        when mgr like '77__' then '7777'
        when mgr like '78__' then '8888'
        else to_char(mgr)
    end as chg_mgr
from emp;

--test3_teachers ensur
select empno,ename,mgr,decode(substr(to_char(mgr),1,2),
                        NULL,'0000',
                        '75','5555',
                        '76','6666',
                        '77','7777',
                        '78','8888',
                        substr(to_char(mgr),1))as chg_mgr
from emp;




--sum,count,max,min,average
select sum(comm) from emp;

select count(*) from emp;

select count(*) from emp where deptno=30;

select count(distinct sal),count(sal) from emp;

select max(sal),min(sal) from emp;

select max(hiredate),min(hiredate) from emp;

select min(hiredate) from emp where deptno=20;


--group by : binding results and line what you want.
select deptno,round(avg(sal)) from emp group by deptno;

select deptno,job,avg(sal) from emp group by deptno,job order by deptno,job;

select deptno,job,avg(sal) from emp 
group by deptno,job having avg(sal)>=2000;

--test
select deptno, job, avg(sal) from emp group by deptno, job having avg(sal)>=500
order by deptno,job;

--test
select deptno,round(avg(sal)), max(sal),min(sal),count(empno)
from emp group by deptno;

--test;
select job,count(job) from emp
group by job having count(job)>=3;

--test
select deptno, to_char(hiredate,'yyyy')as hireyear, count(*)
from emp group by deptno, to_char(hiredate,'yyyy');






select deptno,job,avg(sal)
from emp
group by deptno,job having avg(sal)>=2000
order by deptno,job;

select deptno,job,avg(sal)
from emp where sal<=3000
group by deptno,job having avg(sal)>=2000
order by deptno,job;

--join test
--같으면 => 등가조인 : E.deptno = D.deptno
select empno,ename,E.sal,E.deptno,D.dname
from emp E,dept D
where E.deptno = D.deptno and E.sal>=2500 and E.empno<=9999;

--그외 => 비 등가조인
select E.empno,E.ename,E.job,E.sal,E.mgr,E.comm,E.deptno,S.grade
from emp E,salgrade S
where sal between S.losal and S.hisal;

select *
from emp E,salgrade S
where sal between S.losal and S.hisal;

--self join: 자기 자신 내 조인 하고 싶은 내용이 있는 경우 사용
select E1.empno, E1.ename, E1.mgr, E2.empno as mgr_empno, E2.ename as mgr_ename
from emp E1, emp E2
where E1.mgr = E2.empno;

--OUTER join
--left outer join : table1.col1 = table2.col1(+)
select E1.empno, E1.ename, E1.mgr, E2.empno as mgr_empno, E2.ename as mgr_ename
from emp E1, emp E2
where E1.mgr = E2.empno(+);

--right outer join : table1.col1(+) = table2.col1
select E1.empno, E1.ename, E1.mgr, E2.empno as mgr_empno, E2.ename as mgr_ename
from emp E1, emp E2
where E1.mgr(+) = E2.empno;

--full outer join : 표준 코드 방식활용

--표준 grammer join
--NATURAL JOIN( ==join, ex] E1.mgr = E2.empno)
select E.empno,E.ename,E.sal,deptno,D.dname
from emp E natural join dept D
order by deptno, E.empno;
--join~on
select E.empno,E.ename,E.sal,E.deptno,D.dname
from emp E join dept D on E.deptno = D.deptno
order by deptno, E.empno;
--Outer join~on
select E1.empno, E1.ename, E1.mgr, E2.empno as mgr_empno, E2.ename as mgr_ename
from emp E1 left outer join emp E2 on E1.mgr = E2.empno
order by E1.empno;
--full outer join
select E1.empno, E1.ename, E1.mgr, E2.empno as mgr_empno, E2.ename as mgr_ename
from emp E1 full outer join emp E2 on E1.mgr = E2.empno
order by E1.empno;


--test
select e.deptno,d.dname,round(avg(e.sal))as avgsal
    ,max(e.sal)as maxsal,min(e.sal)as minsal,count(e.empno)as count
from emp E, dept D 
where e.deptno = d.deptno group by e.deptno,d.dname;

--test
select d.deptno,d.dname,e.empno,e.ename,e.job,e.sal
from dept d left outer join emp e on d.deptno = e.deptno;

--test
select e.deptno,d.dname,e.empno,e.ename,e.sal
from emp e join dept d on e.sal>2000 
order by e.deptno,e.sal;


--ex
select d.deptno,d.dname,e.empno,e.ename,e.job,e.mgr,e.sal,
    s.losal,s.hisal,s.grade,e2.empno as mgr_empno,e2.ename as mgr_ename
from emp e, dept d, salgrade s,emp e2
where e.deptno(+) = d.deptno 
and e.sal between s.losal(+) and s.hisal(+)
and e.mgr = e2.empno(+)
order by d.deptno,e.ename;

--ex2
select d.deptno,d.dname,e.empno,e.ename,e.job,e.mgr,e.sal,
    s.losal,s.hisal,s.grade,e2.empno as mgr_empno,e2.ename as mgr_ename
from emp e right outer join dept d on e.deptno = d.deptno
        left outer join salgrade s on e.sal between s.losal and s.hisal
        left outer join emp e2 on e.mgr = e2.empno
order by d.deptno,e.ename;


--sub query
select sal from emp where ename='JONES';
select * from emp where sal > 2975;
-- transfrom this one to use sub query
select * from emp where sal > (select sal from emp where ename='JONES');

--s.q 2
select * from emp where comm > (select comm from emp where ename ='ALLEN');

--s.q 3
select * from emp where hiredate < 
(select hiredate from emp where ename ='WARD');


--s.q(inLine View : use sub query in "FROM" line)
-- you must give name for InLineView
select e10.empno, e10.ename, e10.deptno, d.dname, d.loc
from (select * from emp where deptno=10) e10,
     (select * from dept) d
    where e10.deptno = d.deptno;
    
--s.q(Scala sub query : use sub query in "SELECT" line)
select empno, ename, job, sal,
    (select grade 
     from salgrade 
     where e.sal between losal and hisal) as salgrade,
    deptno,
    (select dname
     from dept
     where e.deptno = dept.deptno) as dname
from emp e;


--s.q ex
--teachers code
select e1.empno, e1.ename, e1.job, e1.deptno, d1.dname, d1.loc
from emp e1, dept d1
where e1.deptno = d1.deptno 
and e1.deptno = 10
and e1.job not in (select job from emp where deptno =30);

--s.q ex
select empno, ename, sal, 
    (select grade 
     from salgrade 
     where e1.sal between losal and hisal) as grade
from emp e1
where sal >(select max(sal) from emp where job= 'SALESMAN');
--use all(any/all)
select empno, ename, sal, 
    (select grade 
     from salgrade 
     where e1.sal between losal and hisal) as grade
from emp e1
where sal > all(select sal from emp where job= 'SALESMAN');

create table emp_temp as select * from emp where 1<>1;

select * from emp_temp;
--insert ex
insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
select e.empno,e.ename,e.job, e.mgr, e.hiredate,e.sal,e.comm,e.deptno
from emp e, salgrade s
where e.sal between s.losal and s.hisal
and s.grade = 1;


create table dept_temp as select * from dept;

select * from dept_temp;

insert into dept_temp(deptno,dname,loc) values(50,'web',null);


commit;
--2021.04.20


select * from dept_temp;


--update all values of  in table
update dept_temp
set loc = 'Seoul';
Rollback;
    
update dept_temp
set loc = 'Seoul'
where deptno = 50;

select
    *
from emp_temp;


update emp_temp
set comm = 50
where sal < 1000;



create table dept_temp2 as select * from dept;

select * from dept_temp2;

update dept_temp2
set(dname,loc)=(select dname,loc
                from dept
                where deptno=40)
where deptno=30;
rollback;


update dept_temp2
set loc = 'Seoul'
where deptno = (select deptno
                from dept_temp2
                where dname='OPERATIONS');

create table emp_temp2 as select * from emp;

select * from emp_temp2;

delete from emp_temp2
where job='MANAGER';

rollback;

--use sub query
delete from emp_temp2
where empno in
(select e.empno
 from emp_temp2 e, salgrade s 
 where e.sal between s.losal and s.hisal
 and s.grade = 3 and e.deptno = 30);
 
 
delete from emp_temp2
where sal>=5000;



--test ~
create table exam_emp as select * from emp;
create table exam_dept as select * from dept;
create table exam_salgrade as select * from salgrade;

select * from exam_emp;
delete from exam_emp where empno = 7201;

insert into exam_emp values(7201,'TEST_USER1','MANAGER',7788,'2016/01/02',4500,null,50);
insert into exam_emp values(7202,'TEST_USER2','CLERK',7201,'2016/02/21',1800,null,50);
insert into exam_emp values(7203,'TEST_USER3','ANALYST',7201,'2016/04/11',3400,null,60);
insert into exam_emp values(7204,'TEST_USER4','SALESMAN',7201,'2016/05/31',2700,300,60);
insert into exam_emp values(7205,'TEST_USER5','CLERK',7201,'2016/07/20',2600,null,70);
insert into exam_emp values(7206,'TEST_USER6','CLERK',7201,'2016/09/08',2600,null,70);
insert into exam_emp values(7207,'TEST_USER7','LECTURER',7201,'2016/10/28',2300,null,80);
insert into exam_emp values(7208,'TEST_USER8','STUDENT',7201,'2018/03/09',1200,null,80);

commit;
select * from exam_emp;
select * from exam_emp where deptno=60;
select * from exam_emp where deptno=80;
rollback;

update exam_emp
set deptno = 70
where sal>
(select avg(sal) as avg_sal from exam_emp where deptno = 50)
and deptno=50;

update exam_emp
set sal = sal*1.1,deptno = 80
where empno in (
 select empno 
 from exam_emp 
 where deptno=60 and hiredate=(select min(hiredate)
                               from exam_emp
                               where deptno=60)
 )
and deptno=60;

select * from exam_salgrade where grade = 5;

delete from exam_emp
where empno in (
 select e.empno
 from exam_emp e, exam_salgrade s
 where e.sal between s.losal and s.hisal and s.grade =5
);

--test finish

--transection 

create table dept_tcl as select * from dept;

insert into dept_tcl values(50,'DATABASE','SEOUL');

update dept_tcl set loc='BUSAN' where deptno =40;

delete from dept_tcl where dname = 'RESEARCH';

select * from dept_tcl;

rollback;

commit;


--session

select * from dept_tcl;

delete from dept_tcl where deptno = 50;

commit;

update dept_tcl set loc = 'SEOUL'
where deptno = 30;


--DDL(Data definition language)
--create table [TABLE NAME](FIELDNAME VALUETYPE,FIELDNAME VALUETYPE ....);

create table emp_ddl(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    dep number(2)
);

create table test(
    id number(4),
    name varchar2(3)
);

desc test;

insert into test(id,name) values(10,'mr.hong');
insert into test(id,name) values(10,'kim');

select * from test;

create table test2(
    id number(4),
    name nchar(3)
);

insert into test2(id,name) values(10,'테이블');
insert into test2(id,name) values(10,'kim');

select * from test2 where name = 'kim';

create table test3(
    id number(4),
    name nvarchar2(3)
);

insert into test3(id,name) values(10,'테이블');
insert into test3(id,name) values(10,'kim');

create table dept_ddl as select *from dept;

create table dept_ddl_30 as select *from dept where deptno=30;

select * from dept_ddl;
select * from dept_ddl_30;
select * from dept_ddl2;


create table dept_ddl2 as select *from dept where 1<>1;


--DROP
drop table dept_ddl2;


--ALTER
CREATE TABLE EMP_ALTER as select * from emp;
select * from emp_alter;
desc emp_alter;
ALTER TABLE emp_alter ADD HP varchar2(20);
ALTER TABLE emp_alter rename column hp to tel;
ALTER TABLE emp_alter modify empno number(5);
ALTER TABLE emp_alter DROP COLUMN tel;
RENAME emp_alter to emp_raname;




--test

select * from member;
desc member;
create table member(
    id nchar(8),
    name nvarchar2(10),
    addr nvarchar2(50),
    nation nchar(4),
    email nvarchar2(50),
    age number(7,2)
);

alter table member add bigo varchar2(20);
alter table member modify addr nvarchar2(50);
alter table member modify id nchar(8);
alter table member rename column bigo to remark;

insert into member(id,name,addr,nation,email,age) 
    values('hong1234','홍길동','서울시 구로구 개봉동','대한민국','hong123@naver.com',25);
insert into member(id,name,addr,nation,email,age) 
    values('hong1235','이승기','서울시 강서구 화곡동','대한민국','lee@naver.com',26);
insert into member(id,name,addr,nation,email,age) 
    values('hong1236','강호동','서울시 마포구 상수동','대한민국','kang56@naver.com',42);
insert into member(id,name,addr,nation,email,age) 
    values('hong1237','이수근','경기도 부천시','대한민국','leesu@naver.com',42);
insert into member(id,name,addr,nation,email,age) 
    values('hong1238','서장훈','서울시 강남구 대치동','대한민국','seo568@google.com',36);
insert into member(id,name,addr,nation,email,age) 
    values('hong1239','김영철','서울시 도봉구 도봉동','대한민국','young@naver.com',41);
insert into member(id,name,addr,nation,email,age) 
    values('hong1210','김장훈','서울시 노원구 노원1동','대한민국','kim@naver.com',48);    
insert into member(id,name,addr,nation,email,age) 
    values('hong1211','임창정','서울시 양천구 신월동','대한민국','limchang@naver.com',45);    
insert into member(id,name,addr,nation,email,age) 
    values('hong1212','김종국','서울시 강남구 도곡동','대한민국','kimjong@naver.com',44);
insert into member(id,name,addr,nation,email,age) 
    values('hong1213','김범수','경기도 일산동구 일산동','대한민국','kim77@naver.com',36);
insert into member(id,name,addr,nation,email,age) 
    values('hong1214','김경호','인천시 서구 가좌동','대한민국','ho789@naver.com',26);
insert into member(id,name,addr,nation,email,age) 
    values('hong1215','민경훈','서울시 수원시 수원1동','대한민국','min@naver.com',35);
insert into member(id,name,addr,nation,email,age) 
    values('hong1216','바이브','서울시 용인시 기흥구','대한민국','vibe@naver.com',33);

update member set remark = ' ';

drop table member;

-- test finish

--data dictionary

select * from dict;
select * from USER_INDEXES;


create index IDX_EMP_SAL on EMP(SAL);
drop index IDX_EMP_SAL;


create table usertbl(
    USERID char(8) not null primary key,
    USERNAME nvarchar2(10) not null,
    BIRTHYEAR number(4) not null,
    MOBILE char(3)
);

select INDEX_NAME,UNIQUENESS,INDEX_TYPE from USER_INDEXES;

select * from emp where sal = 1600;

create view VM_EMP20 
    as (select empno,ename,job,deptno from emp where deptno=20);
    
select * from vm_emp20;
select * from emp;

select *from user_views;

drop view vm_emp20;

insert into vm_emp20 values(7903,'James','MANAGER',20);

create view VM_EMP_READ as select empno,ename,job 
from emp with read only;

select * from vm_emp_read;

insert into vm_emp_read values(8000,'Mr.Hong','ANALYST');


create table temp(
 col1 varchar2(20),
 col2 varchar2(20)
 );


grant select,insert on temp to test;

select * from temp;

revoke insert on temp from test;


create table tab_notnull(
    login_id varchar2(20) not null,
    login_pwd varchar2(20) not null,
    tel varchar2(20)
);

insert into tab_notnull(login_id,login_pwd,tel)
values('test_id01','test_pwd01',null);
insert into tab_notnull(login_id,login_pwd)
values('test_id02','test_pwd02');


--check requirement name
select * from user_constraints;
--insert requirement name
create table tab_notnull2(
    login_id varchar2(20) constraint TBL_NN2_LOGID_NN not null,
    login_pwd varchar2(20) constraint TBL_NN2_LOGPWD_NN not null,
    tel varchar2(20)
);
--change requirment name(with field name)
alter table tab_notnull2 
modify(tel constraint TBL_NN2_TEL_NN not null);

--change requirment name
alter table tab_notnull2 
rename constraint TBL_NN2_TEL_NN to TBL_NN2_TEL_NON;

--remove requirment
alter table tab_notnull2 
drop constraint TBL_NN2_TEL_NON;

--show tables
desc tab_notnull2;




--unique
create table tab_unique(
    login_id varchar2(20) unique,
    login_pwd varchar2(20) not null,
    tel varchar2(20)
);

select * from tab_unique;

insert into tab_unique(login_id, login_pwd, tel)
values('h123','h123','01012345678');
insert into tab_unique(login_id, login_pwd, tel)
values('h124','h123','01012345678');
delete from tab_unique where login_id = 'h123';

--primary key = not null + unique
create table tab_pk(
    login_id varchar2(20) primary key,
    login_pwd varchar2(20) not null,
    tel varchar2(20)
);
insert into tab_pk(login_id, login_pwd, tel)
values('h123','h123','01012345678');
delete from tab_pk where login_id = 'h123';

create table tab_pk2(
    login_id varchar2(20) constraint TAB_PK_LOGID_PK primary key,
    login_pwd varchar2(20) not null,
    tel varchar2(20)
);

drop table tab_pk2;

create table tab_const(
    id varchar2(20), 
    pwd varchar2(20),
    tel varchar2(20),
    constraint TAB_CST_ID_PK primary key(id),
    constraint TAB_CST_TEL_UNQ unique(tel)
);


--foreign key
select * from emp;
insert into emp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'홍길동','CLERK','7788',sysdate,1200,null,50);

create table dept_fk(
    deptno number(2) constraint DEPTFK_DEPTNO_PK primary key,
    dname varchar2(14),
    loc varchar2(13)
);

create table emp_fk(
    empno number(4) constraint EMPFK_EMPNO_PK primary key,
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2) constraint EMPFK_DEPTNO_fK 
        references dept_fk(deptno)
        on delete cascade
);

insert into dept_fk values(50,'DATABASE','SEOUL');

insert into emp_fk(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'홍길동','CLERK','7788',sysdate,1200,null,50);

--you cant delete pk value when it use fk in other table
-- so, delete in other table where use pk for fk
-- or take code in create empfk, 'on delete cascade' or 'on delete set null'
delete from emp_fk where empno=9999;
delete from dept_fk where deptno=50;

drop table emp_fk;


--default
select * from tab_df;

create table tab_df(
    login_id varchar2(20) constraint TABDF_LOGID_PK primary key,
    login_pwd varchar2(20) default '1234',
    tel varchar2(20)
);

insert into tab_df(login_id,tel) values('test','01045213131');




--test
--1. dept_const
create table dept_const(
    deptno number(2) constraint DEPTCONST_DEPTNO_PK primary key,
    dname varchar2(14) constraint DEPTCONST_DNAME_UNQ unique,
    loc varchar2(13) constraint DEPTCONST_LOC_NN not null
);
--2. emp_const
create table emp_const(
    empno number(4) constraint EMPCONST_EMPNO_PK primary key,
    ename VARCHAR2(10) constraint EMPCONST_ENAME_NN not null,
    job varchar2(9),
    tel varchar2(20) constraint EMPCONST_TEL_UNQ unique,
    hirdate DATE,
    sal number(7,2),
    deptno number(2) constraint EMPCONST_DEPTNO_FK
    references dept_const(deptno)
);























