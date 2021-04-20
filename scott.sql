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
    









