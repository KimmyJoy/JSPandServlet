SELECT C.NO+1 || '��' AS DANSU, C.NO+1 || 'X' || S.NO || '=' || S.NO * C.NO AS CONTENTS
FROM CS_NO C
JOIN CS_NO S ON S.NO <= 9
WHERE C.NO < 9;


CREATE