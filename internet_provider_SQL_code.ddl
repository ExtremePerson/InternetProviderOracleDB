-- Generated by Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   at:        2021-10-27 14:50:17 MSK
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE kbnk_account (
    account_id  NUMBER NOT NULL,
    account_num NUMBER(20),
    balance     NUMBER,
    dt_start    TIMESTAMP WITH LOCAL TIME ZONE,
    dt_stop     TIMESTAMP WITH LOCAL TIME ZONE,
    status      NUMBER(1)
)
LOGGING;

COMMENT ON COLUMN kbnk_account.account_id IS
    '????????????????? ????? ????????';

COMMENT ON COLUMN kbnk_account.account_num IS
    '????? ??????????? ?????';

COMMENT ON COLUMN kbnk_account.balance IS
    '???????? ??????';

COMMENT ON COLUMN kbnk_account.dt_start IS
    '?????? ????????????';

COMMENT ON COLUMN kbnk_account.dt_stop IS
    '????? ????????????';

COMMENT ON COLUMN kbnk_account.status IS
    '?????? ????????(1-???????, 0-?????????)';

CREATE INDEX i_account_client_id ON
    kbnk_account (
        account_id
    ASC )
        LOGGING;

ALTER TABLE kbnk_account ADD CONSTRAINT pk_account PRIMARY KEY ( account_id );

CREATE TABLE kclt_client (
    client_id    NUMBER NOT NULL,
    account_id   NUMBER,
    dt_start     TIMESTAMP WITH LOCAL TIME ZONE,
    dt_stop      TIMESTAMP WITH LOCAL TIME ZONE,
    status       VARCHAR2(1 CHAR),
    name         VARCHAR2(25),
    lastname     VARCHAR2(25),
    patronymic   VARCHAR2(25),
    sex          VARCHAR2(1 CHAR),
    phone        VARCHAR2(25),
    email        VARCHAR2(25),
    birthday     DATE,
    description  VARCHAR2(100),
    citizenship  VARCHAR2(2),
    address      VARCHAR2(50),
    is_blacklist NUMBER(1),
    country_id   VARCHAR2(2 CHAR) NOT NULL,
    document_id  NUMBER,
    district_id  NUMBER NOT NULL
)
LOGGING;

COMMENT ON COLUMN kclt_client.client_id IS
    '??.????? ???????';

COMMENT ON COLUMN kclt_client.account_id IS
    '??.????? ?????';

COMMENT ON COLUMN kclt_client.dt_start IS
    '?????? ?????????????? ????? ???????';

COMMENT ON COLUMN kclt_client.dt_stop IS
    '????????? ?????????????? ????? ???????';

COMMENT ON COLUMN kclt_client.status IS
    '?????? (1- ???????, 0 - ?????????)';

COMMENT ON COLUMN kclt_client.name IS
    '??? ???????';

COMMENT ON COLUMN kclt_client.lastname IS
    '??????? ???????';

COMMENT ON COLUMN kclt_client.patronymic IS
    '???????? ???????';

COMMENT ON COLUMN kclt_client.sex IS
    '??? ??????? (m-???????, f-???????)';

COMMENT ON COLUMN kclt_client.phone IS
    '??????? ???????';

COMMENT ON COLUMN kclt_client.email IS
    '??????????? ????? ???????';

COMMENT ON COLUMN kclt_client.birthday IS
    '???? ???????? ???????';

COMMENT ON COLUMN kclt_client.description IS
    '????????(???????????)';

COMMENT ON COLUMN kclt_client.citizenship IS
    '???????????';

COMMENT ON COLUMN kclt_client.address IS
    '????? ??????????';

COMMENT ON COLUMN kclt_client.is_blacklist IS
    '???????????? ?? ???????????? ? ?????? ?????? (1 - ????????????, 0 - ?? ????????????)';

COMMENT ON COLUMN kclt_client.country_id IS
    '??.????? ??????';

COMMENT ON COLUMN kclt_client.document_id IS
    '??.????? ????????? ';

COMMENT ON COLUMN kclt_client.district_id IS
    '??.????? ?????? ??????????';

CREATE INDEX i_client_country_id ON
    kclt_client (
        country_id
    ASC )
        LOGGING;

CREATE INDEX i_client_district_id ON
    kclt_client (
        district_id
    ASC )
        LOGGING;

ALTER TABLE kclt_client ADD CONSTRAINT pk_client PRIMARY KEY ( client_id );

CREATE TABLE kclt_country (
    country_id  VARCHAR2(2 CHAR) NOT NULL,
    name        VARCHAR2(50),
    description VARCHAR2(100)
)
LOGGING;

COMMENT ON COLUMN kclt_country.country_id IS
    '??.????? ??????';

COMMENT ON COLUMN kclt_country.name IS
    '????????';

COMMENT ON COLUMN kclt_country.description IS
    '????????';

ALTER TABLE kclt_country ADD CONSTRAINT pk_country PRIMARY KEY ( country_id );

CREATE TABLE kclt_district (
    district_id NUMBER NOT NULL,
    name        VARCHAR2(25),
    description VARCHAR2(100),
    country_id  VARCHAR2(2 CHAR) NOT NULL
)
LOGGING;

COMMENT ON COLUMN kclt_district.district_id IS
    '??.????? ??????';

COMMENT ON COLUMN kclt_district.name IS
    '???????? ??????';

COMMENT ON COLUMN kclt_district.description IS
    '???????? ??????';

COMMENT ON COLUMN kclt_district.country_id IS
    '??.????? ??????';

CREATE INDEX i_district_country_id ON
    kclt_district (
        country_id
    ASC )
        LOGGING;

ALTER TABLE kclt_district ADD CONSTRAINT pk_district PRIMARY KEY ( district_id );

CREATE TABLE kclt_document (
    document_id   NUMBER NOT NULL,
    document_type VARCHAR2(25),
    country_id    VARCHAR2(2 CHAR) NOT NULL,
    client_id     NUMBER NOT NULL,
    document_data VARCHAR2(50)
)
LOGGING;

COMMENT ON COLUMN kclt_document.document_id IS
    '????????????????? ????? ?????????';

COMMENT ON COLUMN kclt_document.document_type IS
    '??? ?????????';

COMMENT ON COLUMN kclt_document.country_id IS
    '??. ????? ??????';

COMMENT ON COLUMN kclt_document.client_id IS
    '??.????? ???????';

COMMENT ON COLUMN kclt_document.document_data IS
    '?????????? ? ????????? (?????, ????? ? ??)';

CREATE INDEX i_document_country_id ON
    kclt_document (
        country_id
    ASC )
        LOGGING;

CREATE INDEX i_document_client_id ON
    kclt_document (
        client_id
    ASC )
        LOGGING;

ALTER TABLE kclt_document ADD CONSTRAINT pk_document PRIMARY KEY ( document_id );

CREATE TABLE kcnt_contract (
    contract_id NUMBER NOT NULL,
    dt_start    TIMESTAMP WITH LOCAL TIME ZONE,
    dt_stop     TIMESTAMP WITH LOCAL TIME ZONE,
    status      NUMBER(1),
    client_id   NUMBER NOT NULL,
    tariff_id   NUMBER NOT NULL,
    service_id  NUMBER NOT NULL,
    discount_id NUMBER NOT NULL
)
LOGGING;

COMMENT ON COLUMN kcnt_contract.contract_id IS
    '??.????? ?????????';

COMMENT ON COLUMN kcnt_contract.dt_start IS
    '?????? ????? ???????? ?????????';

COMMENT ON COLUMN kcnt_contract.dt_stop IS
    '????? ????? ???????? ?????????';

COMMENT ON COLUMN kcnt_contract.status IS
    '?????? (1-???????, 0-?????????)';

COMMENT ON COLUMN kcnt_contract.client_id IS
    '??.????? ???????';

COMMENT ON COLUMN kcnt_contract.tariff_id IS
    '??.????? ??????';

COMMENT ON COLUMN kcnt_contract.service_id IS
    '??.????? ??????';

COMMENT ON COLUMN kcnt_contract.discount_id IS
    '??.????? ??????';

CREATE INDEX i_contract_client_id ON
    kcnt_contract (
        client_id
    ASC )
        LOGGING;

CREATE INDEX i_contract_discount_id ON
    kcnt_contract (
        discount_id
    ASC )
        LOGGING;

CREATE INDEX i_contract_service_id ON
    kcnt_contract (
        service_id
    ASC )
        LOGGING;

CREATE INDEX i_contract_tariff_id ON
    kcnt_contract (
        tariff_id
    ASC )
        LOGGING;

ALTER TABLE kcnt_contract ADD CONSTRAINT pk_contract PRIMARY KEY ( contract_id );

CREATE TABLE kcnt_discount (
    discount_id      NUMBER NOT NULL,
    name             VARCHAR2(50),
    description      VARCHAR2(100),
    discount_percent NUMBER
)
LOGGING;

COMMENT ON COLUMN kcnt_discount.discount_id IS
    '??.????? ??????';

COMMENT ON COLUMN kcnt_discount.name IS
    '???????? ??????';

COMMENT ON COLUMN kcnt_discount.description IS
    '???????? ??????';

COMMENT ON COLUMN kcnt_discount.discount_percent IS
    '?????? ??????(? ?????????)';

ALTER TABLE kcnt_discount ADD CONSTRAINT pk_discount PRIMARY KEY ( discount_id );

CREATE TABLE kcnt_service (
    service_id  NUMBER NOT NULL,
    name        VARCHAR2(50),
    description VARCHAR2(100),
    price       NUMBER
)
LOGGING;

COMMENT ON COLUMN kcnt_service.service_id IS
    '??. ????? ??????';

COMMENT ON COLUMN kcnt_service.name IS
    '???????? ??????';

COMMENT ON COLUMN kcnt_service.description IS
    '???????? ??????';

COMMENT ON COLUMN kcnt_service.price IS
    '????????? ??????';

ALTER TABLE kcnt_service ADD CONSTRAINT pk_service PRIMARY KEY ( service_id );

CREATE TABLE kcnt_tariff (
    tariff_id        NUMBER NOT NULL,
    name             VARCHAR2(50),
    description      VARCHAR2(100),
    price            NUMBER,
    time_type        VARCHAR2(25),
    active_districts VARCHAR2(100)
)
LOGGING;

COMMENT ON COLUMN kcnt_tariff.tariff_id IS
    '??.????? ??????';

COMMENT ON COLUMN kcnt_tariff.name IS
    '???????? ??????';

COMMENT ON COLUMN kcnt_tariff.description IS
    '???????? ??????';

COMMENT ON COLUMN kcnt_tariff.price IS
    '???? ??????';

COMMENT ON COLUMN kcnt_tariff.time_type IS
    '????? ???????? ?????? (?????, 6 ???????, ???)';

COMMENT ON COLUMN kcnt_tariff.active_districts IS
    '?????? ? ??????? ?????????????? ???????????? ??????';

ALTER TABLE kcnt_tariff ADD CONSTRAINT pk_tariff PRIMARY KEY ( tariff_id );

CREATE TABLE knet_blacklist (
    blacklist_id NUMBER NOT NULL,
    dt_start     TIMESTAMP WITH LOCAL TIME ZONE,
    dt_stop      TIMESTAMP WITH LOCAL TIME ZONE,
    reason       VARCHAR2(100),
    client_id    NUMBER NOT NULL
)
LOGGING;

COMMENT ON COLUMN knet_blacklist.blacklist_id IS
    '????????????????? ????? ??????????';

COMMENT ON COLUMN knet_blacklist.dt_start IS
    '?????? ??????????';

COMMENT ON COLUMN knet_blacklist.dt_stop IS
    '????? ??????????';

COMMENT ON COLUMN knet_blacklist.reason IS
    '??????? ??????????';

COMMENT ON COLUMN knet_blacklist.client_id IS
    '????????????????? ????? ???????';

CREATE INDEX i_blacklist_client_id ON
    knet_blacklist (
        client_id
    ASC )
        LOGGING;

ALTER TABLE knet_blacklist ADD CONSTRAINT pk_blacklist PRIMARY KEY ( blacklist_id );

ALTER TABLE kbnk_account
    ADD CONSTRAINT fk_account_client FOREIGN KEY ( account_id )
        REFERENCES kclt_client ( client_id )
    NOT DEFERRABLE;

ALTER TABLE knet_blacklist
    ADD CONSTRAINT fk_blacklist_client FOREIGN KEY ( client_id )
        REFERENCES kclt_client ( client_id )
    NOT DEFERRABLE;

ALTER TABLE kclt_client
    ADD CONSTRAINT fk_client_country FOREIGN KEY ( country_id )
        REFERENCES kclt_country ( country_id )
    NOT DEFERRABLE;

ALTER TABLE kclt_client
    ADD CONSTRAINT fk_client_district FOREIGN KEY ( district_id )
        REFERENCES kclt_district ( district_id )
    NOT DEFERRABLE;

ALTER TABLE kcnt_contract
    ADD CONSTRAINT fk_contract_client FOREIGN KEY ( client_id )
        REFERENCES kclt_client ( client_id )
    NOT DEFERRABLE;

ALTER TABLE kcnt_contract
    ADD CONSTRAINT fk_contract_discount FOREIGN KEY ( discount_id )
        REFERENCES kcnt_discount ( discount_id )
    NOT DEFERRABLE;

ALTER TABLE kcnt_contract
    ADD CONSTRAINT fk_contract_service FOREIGN KEY ( service_id )
        REFERENCES kcnt_service ( service_id )
    NOT DEFERRABLE;

ALTER TABLE kcnt_contract
    ADD CONSTRAINT fk_contract_tariff FOREIGN KEY ( tariff_id )
        REFERENCES kcnt_tariff ( tariff_id )
    NOT DEFERRABLE;

ALTER TABLE kclt_district
    ADD CONSTRAINT fk_district_country FOREIGN KEY ( country_id )
        REFERENCES kclt_country ( country_id )
    NOT DEFERRABLE;

ALTER TABLE kclt_document
    ADD CONSTRAINT fk_document_client FOREIGN KEY ( client_id )
        REFERENCES kclt_client ( client_id )
    NOT DEFERRABLE;

ALTER TABLE kclt_document
    ADD CONSTRAINT fk_document_country FOREIGN KEY ( country_id )
        REFERENCES kclt_country ( country_id )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                            11
-- ALTER TABLE                             21
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
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
