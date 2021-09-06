--liquibase formatted sql

--changeset your.name:5
CREATE TABLE TA_GENRES (
  GENRE_ID  INT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
  GENRE     VARCHAR(255) NOT NULL, 
  PARENT_ID INT NULL
);

CREATE UNIQUE INDEX XPKTA_GENRES ON TA_GENRES (GENRE_ID);

ALTER TABLE TA_GENRES ADD CONSTRAINT XPKTA_GENRES PRIMARY KEY (GENRE_ID);

CALL SYSPROC.ADMIN_CMD ( 'RUNSTATS ON TABLE TA_GENRES ON ALL COLUMNS SET PROFILE' );
