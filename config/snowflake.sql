begin;

   -- create variables for user / password / role / warehouse / database (needs to be uppercase for objects)
   set role_name = 'ETL';
   set user_name = 'ETL';
   --set user_password = 'u9IrARwmCm95OHfUA2W96V';
   set warehouse_name = 'ANALYTICS';
   set database_name = 'PROD';

   -- change role to securityadmin for user / role steps
   use role securityadmin;

   -- create role
   create role if not exists identifier($role_name);
   grant role identifier($role_name) to role SYSADMIN;

   -- create a user
   create user if not exists identifier($user_name)
   --password = $user_password
   default_role = $role_name
   default_warehouse = $warehouse_name;

   grant role identifier($role_name) to user identifier($user_name);

   -- change role to sysadmin for warehouse / database steps
   use role sysadmin;

   -- grant user role access to warehouse
   grant USAGE
   on warehouse identifier($warehouse_name)
   to role identifier($role_name);

   -- grant user access to database
   grant ALL PRIVILEGES
   on database identifier($database_name)
   to role identifier($role_name);
   
   -- grant user role access to all schemas in database
   grant ALL PRIVILEGES 
   on ALL schemas in database identifier($database_name)
   to role identifier($role_name);
   
   -- grant user role access to all tables in all schemas in database
   grant ALL on ALL tables in database identifier($database_name)
   to role identifier($role_name);
   
 commit;








use role accountadmin;

-- 
-- grant usage
grant usage on database prod to role etl;
grant usage on all schemas in database prod to role etl;
grant usage on database raw to role etl;
grant usage on all schemas in database raw to role etl;

-- grant privileges on SCHEMAS
grant all privileges on all schemas in database prod to role etl;
grant all on future schemas in database prod to role etl;
grant all privileges on all schemas in database raw to role etl;
grant all on future schemas in database raw to role etl;

-- grant privileges on TABLE
grant all on all tables in database prod to role etl;
grant all on future tables in database prod to role etl;
grant all on all tables in database raw to role etl;
grant all on future tables in database raw to role etl;

-- grant privileges on VIEWS
grant all on all views in database prod to role etl;
grant all on future views in database prod to role etl;
grant all on all views in database raw to role etl;
grant all on future views in database raw to role etl;

show grants to role etl;

