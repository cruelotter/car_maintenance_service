-- Create role for technicians
CREATE ROLE TechniciansRole;

-- Create role for managers
CREATE ROLE ManagersRole;

-- Create role for administrators
CREATE ROLE AdministratorsRole;


-- Grant SELECT permission on certain tables to TechniciansRole
GRANT SELECT ON MaintenanceRecords TO TechniciansRole;
GRANT SELECT ON Vehicles TO TechniciansRole;

-- Grant SELECT, INSERT, UPDATE, DELETE permissions on all tables to ManagersRole
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES TO ManagersRole;

-- Grant all permissions on all tables to AdministratorsRole
GRANT ALL ON ALL TABLES TO AdministratorsRole;
