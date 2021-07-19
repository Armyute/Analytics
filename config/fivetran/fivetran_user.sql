begin;

   -- create variables for user / password / role / warehouse / database (needs to be uppercase for objects)
   set role_name = 'ETL';
   set user_name = 'FIVETRAN';
   set user_password = 'u9IrARwmCm95OHfUA2W96V';
   set warehouse_name = 'ANALYTICS';
   set database_name = 'RAW';

   -- change role to securityadmin for user / role steps
   use role securityadmin;

   -- create role for fivetran
   create role if not exists identifier($role_name);
   grant role identifier($role_name) to role SYSADMIN;

   -- create a user for fivetran
   create user if not exists identifier($user_name)
   password = $user_password
   default_role = $role_name
   default_warehouse = $warehouse_name;

   grant role identifier($role_name) to user identifier($user_name);

   -- change role to sysadmin for warehouse / database steps
   use role sysadmin;

   -- create a warehouse for fivetran
   create warehouse if not exists identifier($warehouse_name)
   warehouse_size = xsmall
   warehouse_type = standard
   auto_suspend = 60
   auto_resume = true
   initially_suspended = true;

   -- create database for fivetran
   create database if not exists identifier($database_name);

   -- grant fivetran role access to warehouse
   grant USAGE
   on warehouse identifier($warehouse_name)
   to role identifier($role_name);

   -- grant fivetran access to database
   grant CREATE SCHEMA, MONITOR, USAGE
   on database identifier($database_name)
   to role identifier($role_name);

 commit;
