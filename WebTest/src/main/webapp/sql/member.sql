SELECT * --�̷��� ��� �츮�� ���� �״�α���....
  FROM TAB;

CREATE TABLE T_TEST (
--�Ӽ����� �˷��ֱ� ���� �տ� ���ξ t_Ȥ�� tba_�ξ�..�˾ƺ��� ���ϰ� �ϱ� ���ؼ�..�ҹ��ڿ� �빮�� ������ �����Ƿ� ���ٹ��ڷ� �� ���̺�� �÷��� �ѱ۷ε� �����ϱ� �ϳ�, �ѱ۷� ���� �츮���� �����쿡���� ��밡�������Ƿ� ��κ� ����� ����Ѵ�
       ID   VARCHAR2(20) PRIMARY KEY--�⺻Ű�� ����ũ�ϸ鼭 �ʼ�Ű�� ���̹Ƿ� �����ڷ� ��������� primary key�� �Է��� ��� ������ �ߺ���� ����
       ,NAME VARCHAR2(20) NOT NULL--������� ���ƶ�

);

SELECT *
  FROM T_TEST;--���ϸ�......���̺� �̳� ����� �� �Ŷ�.....��....

INSERT INTO T_TEST (ID, NAME)--���� ������ ���� ���� �޽������� ���� ora�κ� ���۸��ϸ� �� �ڼ��ϰ� �� �� ����
 VALUES ('hong','ȫ�浿');

COMMIT;--�μ�Ʈ�ϴ� �͵��� ���������� Ŀ��Ű���带 ���� ���������??


SELECT *
  FROM EMPLOYEES;

SELECT TO_CHAR(HIRE_DATE, 'mm') AS DD
  FROM EMPLOYEES;

SELECT TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') AS DA
  FROM EMPLOYEES;

SELECT *
  FROM T_TEST;

--������ ����
UPDATE T_TEST
SET NAME = '����浿'
WHERE ID = 'hong';

UPDATE T_TEST
SET NAME = '�̱��'
WHERE ID = 'lee';

UPDATE T_TEST
SET NAME = 'SEONWOO'
WHERE NAME = '����浿';

INSERT INTO T_TEST(ID,NAME)
 VALUES('HONG', 'ȫ�浿');
 
COMMIT; 

drop table t_member;

create table t_member(
       id varchar2(100) primary key,
       password varchar2(100) not null,
       name varchar2(100),
       type char(1) default 'U'
       );
       
insert into t_member(id, password, name, type)
values('admin', 'admin', '������', 'S');

insert into t_member(id, password, name)
values('aaa', '1234', 'ȫ�浿');

commit;

select * from t_member;
