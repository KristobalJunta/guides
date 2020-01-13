# SQL snippets

## Convert tables and fields to another charset and collation

```sql
ALTER TABLE tbl_name CONVERT TO CHARACTER SET utf8mb4 collate utf8mb4_unicode_ci;
```

```sql
SELECT concat('alter table ', table_name, ' CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;')
FROM information_schema.tables
WHERE table_schema='<your_database_name>'
AND table_collation != 'utf8mb4_unicode_ci'
GROUP BY table_name;
```

## Get size of all DB tables

[Source](https://tableplus.com/blog/2018/08/mysql-how-to-get-the-size-of-mysql-database.html)

```sql
SELECT
    table_schema AS 'DB Name',
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) AS 'DB Size in MB'
FROM
    information_schema.tables
GROUP BY
    table_schema;
```
