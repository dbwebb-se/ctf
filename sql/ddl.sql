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
    'author' TEXT NOT NULL,
    'updated' DATE NOT NULL,
    'level' TEXT NOT NULL,
    'target' TEXT NOT NULL,
    'tts' INTEGER NOT NULL,
    'flag' INTEGER NOT NULL
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
    'name' INTEGER NOT NULL,

    PRIMARY KEY (ctf_id, name)
);



--
-- Table hint
--
CREATE TABLE hint
(
    'id' INTEGER NOT NULL,
    'ctf_id' INTEGER NOT NULL,
    'title' TEXT NOT NULL,
    'content' TEXT NOT NULL,

    PRIMARY KEY (id, ctf_id)
);
