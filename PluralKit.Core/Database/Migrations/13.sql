-- SCHEMA VERSION 13: 2021-03-28 --
-- added reminders table

CREATE TABLE IF NOT EXISTS reminders
(
    mid bigint NOT NULL PRIMARY KEY,
    channel bigint NOT NULL,
    guild bigint,
    member integer REFERENCES members (id) ON DELETE CASCADE,
    system integer NOT NULL,
    seen boolean NOT NULL,
    timestamp timestamp NOT NULL default (current_timestamp at time zone 'utc'),
);

-- Add system and group colors --

alter table systems add column color char(6);
alter table groups add column color char(6);

update info set schema_version = 13;