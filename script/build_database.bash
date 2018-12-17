#!/usr/bin/env bash
#
# To create a SQLite database from all dbwebb ctfs.
#
db="data/ctf.sqlite"
sqliteOptions="-column -header"

echo "---> Create the database schema"
chmod 777 data
rm -f $db
sqlite3 $db < sql/ddl.sql
#sqlite3 $db ".schema"

echo "---> Read ctf data and insert into database"
php -f script/extract_ctf_details_to_database.php

echo "---> Show all ctf"
sqlite3 $sqliteOptions $db "SELECT id, title, author FROM ctf;" 
