-- create role for technicians
create role technicians_role;

-- create role for managers
create role managers_role;

-- create role for administrators
create role administrators_role;


-- grant select permission on certain tables to technicians_role
grant select on maintenance_records to technicians_role;
grant select on vehicles to technicians_role;
grant select on appointments to technicians_role;

-- grant select, insert, update, delete permissions on all tables to managers_role
grant select, insert, update, delete on all tables IN SCHEMA public to managers_role;

-- grant all permissions on all tables to administrators_role
grant all on all tables IN SCHEMA public to administrators_role;
