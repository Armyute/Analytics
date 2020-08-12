-- View Privileges
SELECT
    u.usename,
    s.schemaname,
    has_schema_privilege(u.usename,s.schemaname,'create') AS schema_create_permission,
    has_schema_privilege(u.usename,s.schemaname,'usage') AS schema_usage_permission
FROM
    pg_user u
CROSS JOIN
    (SELECT DISTINCT schemaname, tablename FROM pg_tables) s
WHERE
    u.usename = 'jeffreyyu' AND schema_usage_permission = 't'
GROUP BY 1,2,3,4
ORDER BY schemaname
;

-- Grant Privileges on schema
GRANT USAGE ON schema events TO <usename>
