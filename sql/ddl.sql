--
-- Create the schema for the database.
--

--
-- Drop tables
--
DROP TABLE IF EXISTS ctf2tag;
DROP TABLE IF EXISTS ctf;
-- DROP TABLE IF EXISTS tag;



--
-- Table ctf
--
CREATE TABLE ctf
(
    'id' INTEGER PRIMARY KEY NOT NULL,
    'title' TEXT UNIQUE NOT NULL,
    'text' TEXT NOT NULL,
    'author' TEXT NOT NULL
);



-- --
-- -- Table tag
-- --
-- CREATE TABLE tag
-- (
--     'id' INTEGER PRIMARY KEY NOT NULL,
--     'label' TEXT UNIQUE NOT NULL
-- );



--
-- Table ctf2tag
--
CREATE TABLE ctf2tag
(
    'ctf_id' INTEGER NOT NULL,
    'tag' INTEGER NOT NULL,
    PRIMARY KEY (ctf_id, tag)
);
