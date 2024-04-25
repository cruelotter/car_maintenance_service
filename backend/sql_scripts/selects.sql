-- Report on Total Revenue per Month:
SELECT
    YEAR(i.Date) AS Year,
    MONTH(i.Date) AS Month,
    SUM(i.TotalCost) AS TotalRevenue
FROM
    Invoices i
GROUP BY
    YEAR(i.Date),
    MONTH(i.Date)
ORDER BY
    YEAR(i.Date),
    MONTH(i.Date);


-- Report on Most Popular Services:
SELECT
    s.Name AS ServiceName,
    COUNT(*) AS TotalAppointments
FROM
    Appointments a
JOIN
    Services s ON a.ServiceID = s.ServiceID
GROUP BY
    s.Name
ORDER BY
    COUNT(*) DESC;


-- Report on Technician Performance:
SELECT
    t.Name AS TechnicianName,
    COUNT(*) AS TotalMaintenanceRecords
FROM
    MaintenanceRecords m
JOIN
    Technicians t ON m.TechnicianID = t.TechnicianID
GROUP BY
    t.Name
ORDER BY
    COUNT(*) DESC;


-- Report on Inventory Status:
SELECT
    Name AS PartName,
    Description AS PartDescription,
    QuantityInStock AS AvailableQuantity
FROM
    PartsInventory;

-- Report on Customer Feedback:
SELECT
    f.CustomerID,
    AVG(f.Rating) AS AverageRating
FROM
    FeedbackRatings f
GROUP BY
    f.CustomerID;