--liquibase formatted sql

--changeset your.name:6
CREATE TABLE TA_BOOK_GENRES(
  BOOK_ID  INT NOT NULL, 
  GENRE_ID INT NOT NULL
);

CREATE UNIQUE INDEX XPKTA_BOOK_GENRES ON TA_BOOK_GENRES (BOOK_ID, GENRE_ID);

ALTER TABLE TA_BOOK_GENRES ADD CONSTRAINT XPKTA_BOOK_GENRES PRIMARY KEY (BOOK_ID, GENRE_ID);

CALL SYSPROC.ADMIN_CMD ( 'RUNSTATS ON TABLE TA_BOOK_GENRES ON ALL COLUMNS SET PROFILE' );