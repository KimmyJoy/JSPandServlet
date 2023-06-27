MERGE INTO LO_OUT_M M1
USING DUAL
ON (M1.INVOICE_NO = '#394821')
WHEN NOT MATCHED THEN INSERT (M1.INVOICE_NO , M1.OUTBOUND_DATE, M1.OUTBOUND_NO, M1.ORDER_PLACE, M1.OUTBOUND_BATCH)
VALUES ('#394821' , TRUNC(SYSDATE) , 00001 , 'A' , 'AAA');

MERGE INTO LO_OUT_M M1
USING DUAL
ON (M1.INVOICE_NO = '#394820')
WHEN NOT MATCHED THEN INSERT (M1.INVOICE_NO , M1.OUTBOUND_DATE, M1.OUTBOUND_NO, M1.ORDER_PLACE, M1.OUTBOUND_BATCH)
VALUES ('#394820' , TRUNC(SYSDATE) , 00002 , 'B' , 'BBB');


SELECT OUTBOUND_DATE, OUTBOUND_NO, ORDER_PLACE, OUTBOUND_BATCH
FROM LO_OUT_M
WHERE INVOICE_NO LIKE '#3948%';

MERGE INTO LO_OUT_M M1
USING DUAL
ON (M1.INVOICE_NO LIKE '#3948%')
WHEN MATCHED THEN UPDATE SET M1.ORDER_PLACE = 'X';

MERGE INTO LO_OUT_M M1
USING DUAL
ON (M1.INVOICE_NO LIKE '#3948%')
WHEN MATCHED THEN UPDATE SET M1.ORDER_PLACE = 'X' WHERE M1.OUTBOUND_BATCH = 'BBB'
DELETE WHERE M1.OUTBOUND_BATCH = 'AAA';
--������ UPDATE������ ������ UPDATE�� ���ڵ常 ���� ����� ��!!! --> ���⼭�� ���� �ȵ�
--UPDATE���� �������� ������ UPDATE �Ŀ� DELETE�� 


MERGE INTO LO_OUT_M M1
USING (SELECT '#394821' AS INVOICE_NO, TRUNC(SYSDATE) AS OUTBOUND_DATE, '00001' AS OUTBOUND_NO, 'A' AS ORDER_PLACE, 'AAA' AS OUTBOUND_BATCH
         FROM DUAL
       UNION ALL
       SELECT '#394820' AS INVOICE_NO, TRUNC(SYSDATE) AS OUTBOUND_DATE, '00002' AS OUTBOUND_NO, 'B' AS ORDER_PLACE, 'BBB' AS OUTBOUND_BATCH
         FROM DUAL
       ) U1
  ON (M1.INVOICE_NO = U1.INVOICE_NO)
  WHEN MATCHED THEN UPDATE SET M1.ORDER_PLACE = 'X'
                     DELETE WHERE M1.OUTBOUND_BATCH = 'AAA'
  WHEN NOT MATCHED THEN INSERT (M1.INVOICE_NO , M1.OUTBOUND_DATE, M1.OUTBOUND_NO, M1.ORDER_PLACE, M1.OUTBOUND_BATCH)
                        VALUES (U1.INVOICE_NO , U1.OUTBOUND_DATE, U1.OUTBOUND_NO, U1.ORDER_PLACE, U1.OUTBOUND_BATCH);
                     
                     
SELECT OUTBOUND_DATE, OUTBOUND_NO, ORDER_PLACE, OUTBOUND_BATCH, SET_QTY
  FROM LO_OUT_M
  WHERE INVOICE_NO = '#394821';
  
COMMIT;

MERGE INTO LO_OUT_D M1
USING DUAL
ON (M1.INVOICE_NO = '#394821')
WHEN NOT MATCHED THEN INSERT (M1.INVOICE_NO , M1.LINE_NO, M1.ITEM_CD, M1.ORDER_QTY)
VALUES ('#394821' , 1 , 'ABCD' , 1);

MERGE INTO LO_OUT_M M1
USING LO_OUT_D U1
ON (M1.INVOICE_NO = '#394821' AND M1.INVOICE_NO = U1.INVOICE_NO)
WHEN MATCHED THEN UPDATE SET M1.SET_QTY = 0;


SELECT LINE_NO, ITEM_CD, ORDER_QTY
FROM LO_OUT_D
WHERE INVOICE_NO LIKE '#3948%';


SELECT M1.OUTBOUND_DATE, U1.SUM_QTY
  FROM LO_OUT_M
       JOIN (M1.INVOICE_NO = U1.INVOICE_NO);

SELECT *
 FROM Z_DAY17_1;
 
 
CREATE TABLE Z_DAY17_1
AS;

SELECT M1.OUTBOUND_DATE AS OUTBOUND_DATE
              ,SUM(M2.ORDER_QTY) AS SUM_QTY
              FROM LO_OUT_M M1
              JOIN LO_OUT_D M2 ON M2.INVOICE_NO = M1.INVOICE_NO
              WHERE OUTBOUND_DATE BETWEEN '20190801' AND '20190831'
              GROUP BY M1.OUTBOUND_DATE
              ORDER BY M1.OUTBOUND_DATE;


MERGE INTO z_day17_1 AS Z1
     USING    (SELECT M1.OUTBOUND_DATE AS OUTBOUND_DATE
              ,SUM(M2.ORDER_QTY) AS SUM_QTY
              FROM LO_OUT_M M1
              JOIN LO_OUT_D M2 ON M2.INVOICE_NO = M1.INVOICE_NO
              WHERE OUTBOUND_DATE BETWEEN TO_DATE('20190801', 'YYYY-MM-DD') AND TO_DATE('20190831', 'YYYY-MM-DD')
              GROUP BY M1.OUTBOUND_DATE
              ORDER BY M1.OUTBOUND_DATE) AS U1 ON(Z1.OUTBOUND_DATE
     WHEN MATCHED THEN
              UPDATE SET Z1.update_col2 = (SELECT SUM(SUM_QTY)
                                             FROM ( SELECT SUM(LO_OUT_D.ORDER_QTY) AS SUM_QTY
                                                      FROM LO_OUT_M
                                                      JOIN LO_OUT_D ON LO_OUT_M.OUTBOUND_DATE = LO_OUT_D.OUTBOUND_DATE
                                                      WHERE
                                                       LO_OUT_M.OUTBOUND_DATE >= '2019-08-01'
                                                       AND LO_OUT_M.OUTBOUND_DATE < '2019-09-01'
                                                       AND DATEPART(DW, LO_OUTM.OUTBOUND_DATE) = DATEPART(DW, Z1.OUTBOUND_DATE)
                                                       AND LO_OUT_M.OUTBOUND_DATE <>Z1.OUTBOUND_DATE
                                                        GROUP BY LO_OUT_M.OUTBOUND_DATE) AS SUBQUERY
                                                        );
              


MERGE INTO z_day17_1 Z
USING (
    SELECT
        M1.OUTBOUND_DATE AS OUTBOUND_DATE,
        TO_CHAR(M1.OUTBOUND_DATE, 'D') AS DAY_OF_WEEK,
        SUM(M2.ORDER_QTY) AS SUM_QTY
    FROM
        LO_OUT_M M1
        JOIN LO_OUT_D M2 ON M2.INVOICE_NO = M1.INVOICE_NO
    WHERE
        M1.OUTBOUND_DATE >= TO_DATE('2019-08-01', 'YYYY-MM-DD') AND
        M1.OUTBOUND_DATE < TO_DATE('2019-09-01', 'YYYY-MM-DD')
    GROUP BY
        M1.OUTBOUND_DATE,
        TO_CHAR(M1.OUTBOUND_DATE, 'D')
    ORDER BY
        M1.OUTBOUND_DATE DESC
) U
ON (Z.OUTBOUND_DATE = U.OUTBOUND_DATE)
WHEN MATCHED THEN
    UPDATE SET Z.update_col2 = (
        SELECT SUM(SUM_QTY)
        FROM (
            SELECT SUM(M2.ORDER_QTY) AS SUM_QTY
            FROM LO_OUT_M M1
            JOIN LO_OUT_D M2 ON M2.INVOICE_NO = M1.INVOICE_NO
            WHERE
                M1.OUTBOUND_DATE >= TO_DATE('2019-08-01', 'YYYY-MM-DD') AND
                M1.OUTBOUND_DATE < TO_DATE('2019-09-01', 'YYYY-MM-DD') AND
                TO_CHAR(M1.OUTBOUND_DATE, 'D') = U.DAY_OF_WEEK AND
                M1.OUTBOUND_DATE <> Z.OUTBOUND_DATE
            GROUP BY
                M1.OUTBOUND_DATE
        ) SUBQUERY
        WHERE Z.OUTBOUND_DATE = U.OUTBOUND_DATE
    );



--�ؼ�
SELECT M1.OUTBOUND_DATE
       ,SUM(M2.ORDER_QTY) AS SUM_QTY
  FROM LO_OUT_M M1
       JOIN LO_OUT_D M2 ON M2.INVOICE_NO = M1.INVOICE_NO
-- �÷����� ���� �����ϸ� �ȵȴ�
  WHERE M1.OUTBOUND_DATE BETWEEN TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD'))
----  WHERE TO_CHAR(M1.OUTBOUND_DATE, 'D') =YYYYMM || '01'
--
--���� �̰� �ʳװ� �˷��� �κ����ڳ�
--201908�̶� 01�ٿ��� 20190801~20190831 ���� ã�� ��
--  �̷��� ���������� �̷������� ����(�����ϸ�) ���� �ʴ� �����Ǵ� ���� �� �ε����� ����� �� ����
  GROUP BY M1.OUTBOUND_DATE
  ORDER BY M1.OUTBOUND_DATE;
  
--  �м��Լ��� ���� ���

-- �м��Լ��� �Ⱦ��� ���

-- 2�ϵ� �ڽ� �ܿ��� ã�� ����� ����? �м��Լ�=> �����Լ��� ���� �Ȱ���
-- �м��Լ��� group by�� ���� �ʴ´�



SELECT OUTBOUND_DATE
       ,SUM_QTY
       ,0 AS UPDATE_COL1
       ,SUM(SUM_QTY) OVER(PARTITION BY ����) AS UPDATE_COL2
  FROM (
        SELECT M1.OUTBOUND_DATE
              ,SUM(M2.ORDER_QTY) AS SUM_QTY
         FROM LO_OUT_M M1
              JOIN LO_OUT_D M2 ON M2.INVOICE_NO = M1.INVOICE_NO
        WHERE M1.OUTBOUND_DATE BETWEEN TO_DATE(:YYYYMM || '01','YYYY-MM-DD') AND LAST_DAY(TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD'))
        GROUP BY M1.OUTBOUND_DATE
        ORDER BY M1.OUTBOUND_DATE
        )
       ORDER BY DD, OUTBOUND_DATE;


SELECT OUTBOUND_DATE
       ,SUM_QTY
       ,0 AS UPDATE_COL1
       ,TO_CHAR(OUTBOUND_DATE, 'D') AS DD
       ,SUM(SUM_QTY) OVER(PARTITION BY TO_CHAR(OUTBOUND_DATE, 'D')) - SUM_QTY AS UPDATE_COL2
--    �м��Լ��� ������ �Ʒ�ó�� �������� �� �߰��ؾ���   
       ,( SELECT SUM(M2.ORDER_QTY) AS SUM_QTY
            FROM LO_OUT_M M1
               JOIN LO_OUT_D M2 ON M2.INVOICE_NO = M1.INVOICE_NO
           WHERE M1.OUTBOUND_DATE BETWEEN TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD'))
             AND TO_CHAR(M1.OUTBOUND_DATE, 'D') = TO_CHAR(L1.OUTBOUND_DATE, 'D')
      ) AS UPDATE_COL2
  FROM (
        SELECT M1.OUTBOUND_DATE
              ,SUM(M2.ORDER_QTY) AS SUM_QTY
         FROM LO_OUT_M M1
              JOIN LO_OUT_D M2 ON M2.INVOICE_NO = M1.INVOICE_NO
        WHERE M1.OUTBOUND_DATE BETWEEN TO_DATE(:YYYYMM || '01','YYYY-MM-DD') AND LAST_DAY(TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD'))
        GROUP BY M1.OUTBOUND_DATE
        ORDER BY M1.OUTBOUND_DATE
        ) L1
       ORDER BY DD, OUTBOUND_DATE;         



SELECT OUTBOUND_DATE
       ,SUM_QTY
       ,0 AS UPDATE_COL1
       ,TO_CHAR(OUTBOUND_DATE, 'D') AS DD
--    �м��Լ��� ������ �Ʒ�ó�� �������� �� �߰��ؾ���   
       ,( SELECT SUM(M2.ORDER_QTY) AS SUM_QTY
            FROM LO_OUT_M M1
               JOIN LO_OUT_D M2 ON M2.INVOICE_NO = M1.INVOICE_NO
           WHERE M1.OUTBOUND_DATE BETWEEN TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD'))
             AND TO_CHAR(M1.OUTBOUND_DATE, 'D') = TO_CHAR(L1.OUTBOUND_DATE, 'D')
             AND M1.OUTBOUND_DATE != L1.OUTBOUND_DATE
      ) AS UPDATE_COL2
-- ��� �Ѵް��� �����͸� 22�� �Ѱ� �ȴ�??      
  FROM (
        SELECT M1.OUTBOUND_DATE
              ,SUM(M2.ORDER_QTY) AS SUM_QTY
         FROM LO_OUT_M M1
              JOIN LO_OUT_D M2 ON M2.INVOICE_NO = M1.INVOICE_NO
        WHERE M1.OUTBOUND_DATE BETWEEN TO_DATE(:YYYYMM || '01','YYYY-MM-DD') AND LAST_DAY(TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD'))
        GROUP BY M1.OUTBOUND_DATE
        ORDER BY M1.OUTBOUND_DATE
        ) L1
       ORDER BY DD, OUTBOUND_DATE;
       
       

select *
from z_day17_1 Z
order by outbound_date;

MERGE INTO z_day17_1 Z
USING (
    SELECT AVG(SUM_QTY) AS AVG_QTY, OUTBOUND_DATE
    FROM (
        SELECT SUM(D.ORDER_QTY) AS SUM_QTY, M.OUTBOUND_DATE
        FROM LO_OUT_M M
        JOIN LO_OUT_D D ON M.INVOICE_NO = D.INVOICE_NO
        WHERE 
            M.OUTBOUND_DATE >= TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD') AND
            M.OUTBOUND_DATE < LAST_DAY(TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD'))
        GROUP BY D.INVOICE_NO, M.OUTBOUND_DATE
    )
    GROUP BY OUTBOUND_DATE
) U ON (Z.OUTBOUND_DATE = U.OUTBOUND_DATE)
WHEN MATCHED THEN
    UPDATE SET Z.UPDATE_COL1 = U.AVG_QTY
WHERE Z.OUTBOUND_DATE >= TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD') AND
      Z.OUTBOUND_DATE < LAST_DAY(TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD'));


rollback;


MERGE INTO Z_DAY17_1 M1
USING(
       SELECT AVG(SUM_QTY) AS AVG_QTY
         FROM (
              SELECT M1.OUTBOUND_DATE
                     ,SUM(M2.ORDER_QTY) AS SUM_QTY
                FROM LO_OUT_M M1
                     JOIN LO_OUT_D M2 ON M2.INVOICE_NO = M1.INVOICE_NO
                WHERE M1.OUTBOUND_DATE BETWEEN TO_DATE(TO_NUMBER(:YYYYMM)-1 || '01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE(TO_NUMBER(:YYYYMM)-1|| '01', 'YYYY-MM-DD'))
                GROUP BY M1.OUTBOUND_DATE
                ORDER BY M1.OUTBOUND_DATE
                )L1
       ) U1
-- ON�ڿ� Z_DAY17_1 ���̺��� ���� ������ �־����� 
  ON(
       M1.OUTBOUND_DATE BETWEEN TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD') AND LAST_DAY(TO_DATE(:YYYYMM || '01', 'YYYY-MM-DD'))
    )
WHEN MATCHED THEN UPDATE SET M1.UPDATE_COL1 = U1.AVG_QTY
                  DELETE WHERE M1.SUM_QTY < U1.AVG_QTY;
                  
SELECT *
FROM Z_DAY17_1;

COMMIT;