-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2024-04-09 13:00:34 MYT
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c

-- Capture run of script in file called custorders_schema_output.txt
set echo on
SPOOL custorders_schema_output.txt

--student id: 33402973
--student name: Tan Chun Ling


DROP TABLE customer CASCADE CONSTRAINTS;

DROP TABLE orderline CASCADE CONSTRAINTS;

DROP TABLE orders CASCADE CONSTRAINTS;

DROP TABLE prod_category CASCADE CONSTRAINTS;

DROP TABLE product CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE customer (
    cust_no      NUMBER(7) NOT NULL,
    cust_name    VARCHAR2(50) NOT NULL,
    cust_address VARCHAR2(50) NOT NULL,
    cust_phone   CHAR(10),
    cust_level   CHAR(1) NOT NULL
);

ALTER TABLE customer
    ADD CONSTRAINT chk_custlevel CHECK ( cust_level IN ( 'B', 'G', 'S' ) );

COMMENT ON COLUMN customer.cust_no IS
    'customer number';

COMMENT ON COLUMN customer.cust_name IS
    'customer name';

COMMENT ON COLUMN customer.cust_address IS
    'customer address';

COMMENT ON COLUMN customer.cust_phone IS
    'customer phone number';

COMMENT ON COLUMN customer.cust_level IS
    'customer level, G-Gold, S-Silver, B-Bronze';

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cust_no );

CREATE TABLE orderline (
    order_no      NUMBER(7) NOT NULL,
    prod_no       NUMBER(7) NOT NULL,
    ol_qtyordered NUMBER(3) NOT NULL,
    ol_lineprice  NUMBER(8, 2) NOT NULL
);

COMMENT ON COLUMN orderline.prod_no IS
    'is_used_to';

ALTER TABLE orderline ADD CONSTRAINT oderline_pk PRIMARY KEY ( order_no,
                                                               prod_no );

CREATE TABLE orders (
    order_no   NUMBER(7) NOT NULL,
    order_date DATE NOT NULL,
    cust_no    NUMBER(7) NOT NULL
);

COMMENT ON COLUMN orders.cust_no IS
    'customer number';

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( order_no );

CREATE TABLE prod_category (
    pcat_id   NUMBER(4) NOT NULL,
    pcat_name VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN prod_category.pcat_id IS
    'product category id';

COMMENT ON COLUMN prod_category.pcat_name IS
    'product category name';

ALTER TABLE prod_category ADD CONSTRAINT prod_category_pk PRIMARY KEY ( pcat_id );

CREATE TABLE product (
    prod_no        NUMBER(7) NOT NULL,
    prod_desc      VARCHAR2(50) NOT NULL,
    prod_unitprice NUMBER(7, 2) NOT NULL,
    prod_category  VARCHAR2(50) NOT NULL,
    pcat_id        NUMBER(4) NOT NULL
);

COMMENT ON COLUMN product.prod_no IS
    'is_used_to';

COMMENT ON COLUMN product.pcat_id IS
    'product category id';

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( prod_no );

ALTER TABLE orders
    ADD CONSTRAINT customer_orders FOREIGN KEY ( cust_no )
        REFERENCES customer ( cust_no );

ALTER TABLE orderline
    ADD CONSTRAINT orders_orderline FOREIGN KEY ( order_no )
        REFERENCES orders ( order_no );

ALTER TABLE product
    ADD CONSTRAINT prod_category FOREIGN KEY ( pcat_id )
        REFERENCES prod_category ( pcat_id );

ALTER TABLE orderline
    ADD CONSTRAINT product_orderline FOREIGN KEY ( prod_no )
        REFERENCES product ( prod_no );

SPOOL off
set echo off

-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             10
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
