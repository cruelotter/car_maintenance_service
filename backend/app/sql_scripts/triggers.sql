CREATE TRIGGER CascadeDeleteVehicles
ON Customers
FOR DELETE
AS
BEGIN
    DELETE FROM Vehicles
    WHERE CustomerID IN (SELECT deleted.CustomerID FROM deleted);
END;


CREATE TRIGGER UpdateMaintenanceRecordDate
ON Vehicles
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Year) OR UPDATE(Make) OR UPDATE(Model)
    BEGIN
        UPDATE MaintenanceRecords
        SET Date = GETDATE()  -- Or set it to a specific date based on your requirement
        WHERE VehicleID IN (SELECT inserted.VehicleID FROM inserted);
    END;
END;
