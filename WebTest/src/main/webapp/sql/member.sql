SELECT * --이렇게 써야 우리가 쓰던 그대로구나....
  FROM TAB;

CREATE TABLE T_TEST (
--속성명을 알려주기 위해 앞에 접두어를 t_혹은 tba_로씀..알아보기 편하게 하기 위해서..소문자와 대문자 구분이 없으므로 밑줄문자로 씀 테이블명 컬럼명 한글로도 가능하긴 하나, 한글로 쓰면 우리나라 윈도우에서만 사용가능해지므로 대부분 영어로 써야한다
       ID   VARCHAR2(20) PRIMARY KEY--기본키는 유니크하면서 필수키로 쓰이므로 구분자로 만들기위해 primary key를 입력함 얘는 무조건 중복허용 안함
       ,NAME VARCHAR2(20) NOT NULL--비워두지 말아라

);

SELECT *
  FROM T_TEST;--웹하면......테이블 겁나 만들게 될 거라구.....와....

INSERT INTO T_TEST (ID, NAME)--만약 오류가 나면 오류 메시지에서 앞의 ora부분 구글링하면 더 자세하게 알 수 있음
 VALUES ('hong','홍길동');

COMMIT;--인서트하는 것들은 물리적으로 커밋키워드를 통해 합쳐줘야함??


SELECT *
  FROM EMPLOYEES;

SELECT TO_CHAR(HIRE_DATE, 'mm') AS DD
  FROM EMPLOYEES;

SELECT TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') AS DA
  FROM EMPLOYEES;

SELECT *
  FROM T_TEST;

--데이터 변경
UPDATE T_TEST
SET NAME = '선우길동'
WHERE ID = 'hong';

UPDATE T_TEST
SET NAME = '이길순'
WHERE ID = 'lee';

UPDATE T_TEST
SET NAME = 'SEONWOO'
WHERE NAME = '선우길동';

INSERT INTO T_TEST(ID,NAME)
 VALUES('HONG', '홍길동');
 
COMMIT; 

drop table t_member;

create table t_member(
       id varchar2(100) primary key,
       password varchar2(100) not null,
       name varchar2(100),
       type char(1) default 'U'
       );
       
insert into t_member(id, password, name, type)
values('admin', 'admin', '관리자', 'S');

insert into t_member(id, password, name)
values('aaa', '1234', '홍길동');

commit;

select * from t_member;
