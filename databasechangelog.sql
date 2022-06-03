-- liquibase formatted sql changeLogId:7770466b-8224-45e9-a33b-7f391012f352


--changeset liquibase:ID-1
Create Schema Dev
go

CREATE TABLE  Dev.AGENTS 
   (	
    "AGENT_CODE" CHAR(6) NOT NULL PRIMARY KEY, 
	"AGENT_NAME" CHAR(40), 
	"WORKING_AREA" CHAR(35), 
	"COMMISSION" decimal(10,2), 
	"PHONE_NO" CHAR(15), 
	"COUNTRY" char(25) 
	 );


INSERT INTO Dev.AGENTS VALUES ('A007', 'Ramasundar', 'Bangalore', '0.15', '077-25814763', 'India');
INSERT INTO Dev.AGENTS VALUES ('A003', 'Alex ', 'London', '0.13', '075-12458969', 'England');
INSERT INTO Dev.AGENTS VALUES ('A008', 'Alford', 'New York', '0.12', '044-25874365', 'Usa');
INSERT INTO Dev.AGENTS VALUES ('A011', 'Ravi Kumar', 'Bangalore', '0.15', '077-45625874', 'Inida');
INSERT INTO Dev.AGENTS VALUES ('A010', 'Santakumar', 'Chennai', '0.14', '007-22388644', 'India');
INSERT INTO Dev.AGENTS VALUES ('A012', 'Lucida', 'San Jose', '0.12', '044-52981425', 'Germany');
INSERT INTO Dev.AGENTS VALUES ('A005', 'Anderson', 'Brisban', '0.13', '045-21447739', 'Australia');
INSERT INTO Dev.AGENTS VALUES ('A001', 'Subbarao', 'Bangalore', '0.14', '077-12346674', 'India');
INSERT INTO Dev.AGENTS VALUES ('A002', 'Mukesh', 'Mumbai', '0.11', '029-12358964', 'India');
INSERT INTO Dev.AGENTS VALUES ('A006', 'McDen', 'London', '0.15', '078-22255588', 'England');
INSERT INTO Dev.AGENTS VALUES ('A004', 'Ivan', 'Torento', '0.15', '008-22544166', 'America');
INSERT INTO Dev.AGENTS VALUES ('A009', 'Benjamin', 'Hampshair', '0.11', '008-22536178', 'China');


select * from Dev.agents

--rollback drop table Dev.AGENTS



--changeset liquibase:ID-2
CREATE TABLE Employee_Info
(
EmployeeID int,
EmployeeName varchar(255),
EmergencyContactName varchar(255),
PhoneNumber bigint,
Address varchar(255),
City varchar(255),
Country varchar(255)
);

--changeset liquibase:ID-3
INSERT INTO Employee_Info(EmployeeID, EmployeeName, EmergencyContactName, PhoneNumber, Address, City, Country)
VALUES ('06', 'Sanjana','Jagannath', '9921321141', 'Camel Street House No 12', 'Chennai', 'India');
 
INSERT INTO Employee_Info
VALUES ('07', 'Sayantini','Praveen', '9934567654', 'Nice Road 21', 'Pune', 'India');

--rollback drop table Employee_Info



--changeset liquibase:ID-4
--comment Product Catalog table is dependent on sku tracking being activated.
CREATE TABLE product_catalog_tbl (
    id int primary key,
    product varchar(50) not null,
    sku varchar(20) not null,
    description varchar(50) not null,
    quantity int,
    cost float,
    category varchar(20) not null
)
--rollback drop table product_catalog_tbl

--changeset gina.s:insert-sample-data-product-catalog-table
--comment This data is meant for QA environment only. Do not run in production.
INSERT INTO product_catalog_tbl
    (id, product, sku, description, quantity, cost, category)
        VALUES
    (1, 'Item1', '123456', 'Test Item1 Description', 4, '50.99', 'CAT4')
-- rollback DELETE FROM product_catalog_tbl WHERE id = 1