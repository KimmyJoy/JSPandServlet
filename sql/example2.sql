CREATE TABLE "PROD" (
	"PROD_CD"	NUMBER		NOT NULL,
	"PROD_NM"	VARCHAR2(100)		NULL,
	"PROD_LIST"	VARCHAR2(200)		NULL
);

CREATE TABLE "SUPP" (
	"SUPP_CD"	NUMBER		NOT NULL,
	"SUPP_NM"	VARCHAR2(100)		NULL
);

CREATE TABLE "LIST" (
	"PROD_CD"	NUMBER		NOT NULL,
	"SUPP_CD"	NUMBER		NOT NULL,
	"CUR_PRICE"	NUMBER		NULL,
	"LIST_QA"	NUMBER		NULL,
	"LIST_UNIT"	VARCHAR2(4)		NULL
);

ALTER TABLE "PROD" ADD CONSTRAINT "PK_PROD" PRIMARY KEY (
	"PROD_CD"
);

ALTER TABLE "SUPP" ADD CONSTRAINT "PK_SUPP" PRIMARY KEY (
	"SUPP_CD"
);

ALTER TABLE "LIST" ADD CONSTRAINT "PK_LIST" PRIMARY KEY (
	"PROD_CD",
	"SUPP_CD"
);

ALTER TABLE "LIST" ADD CONSTRAINT "FK_PROD_TO_LIST_1" FOREIGN KEY (
	"PROD_CD"
)
REFERENCES "PROD" (
	"PROD_CD"
);

ALTER TABLE "LIST" ADD CONSTRAINT "FK_SUPP_TO_LIST_1" FOREIGN KEY (
	"SUPP_CD"
)
REFERENCES "SUPP" (
	"SUPP_CD"
);

--Drop table List;
--drop table PROD;
--drop table SUPP;