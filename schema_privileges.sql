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

-- Grant Select on table
GRANT SELECT ON table reports.active_subscriptions_detail_v TO <usename>

-- View Table Privileges
SELECT * 
FROM 
    (
    SELECT 
        schemaname
        ,objectname
        ,usename
        ,HAS_TABLE_PRIVILEGE(usrs.usename, fullobj, 'select') AND has_schema_privilege(usrs.usename, schemaname, 'usage')  AS sel
        ,HAS_TABLE_PRIVILEGE(usrs.usename, fullobj, 'insert') AND has_schema_privilege(usrs.usename, schemaname, 'usage')  AS ins
        ,HAS_TABLE_PRIVILEGE(usrs.usename, fullobj, 'update') AND has_schema_privilege(usrs.usename, schemaname, 'usage')  AS upd
        ,HAS_TABLE_PRIVILEGE(usrs.usename, fullobj, 'delete') AND has_schema_privilege(usrs.usename, schemaname, 'usage')  AS del
        ,HAS_TABLE_PRIVILEGE(usrs.usename, fullobj, 'references') AND has_schema_privilege(usrs.usename, schemaname, 'usage')  AS ref
    FROM
        (
        SELECT schemaname, 't' AS obj_type, tablename AS objectname, schemaname + '.' + tablename AS fullobj FROM pg_tables
        WHERE schemaname not in ('pg_internal')
        UNION
        SELECT schemaname, 'v' AS obj_type, viewname AS objectname, schemaname + '.' + viewname AS fullobj FROM pg_views
        WHERE schemaname not in ('pg_internal')
        ) AS objs
        ,(SELECT * FROM pg_user) AS usrs
    ORDER BY fullobj
    )
WHERE (sel = true or ins = true or upd = true or del = true or ref = true)
--and schemaname='<opt schema>'
and usename = 'jeffreyyu';

-- Grant Select on Schema
GRANT SELECT ON ALL TABLES IN SCHEMA events TO jeffreyyu
