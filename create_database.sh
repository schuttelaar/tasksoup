rm database/data2.sql
touch database/data2.sql
sqlite3 database/data2.sql < schema.sql
chmod uog+w database/data2.sql
chown -R www-data:www-data database

