-- scott ������ ��� ���̺� ��ȸ
select * from tab;

-- bonus ���̺��� ��� ���� ��ȸ
select * from bonus;

-- emp ���̺��� ��� ���� ��ȸ
select * from emp;

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



















