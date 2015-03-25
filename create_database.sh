rm database/data.sql
touch database/data.sql
sqlite3 database/data.sql < schema.sql
chmod uog+w database/data.sql

