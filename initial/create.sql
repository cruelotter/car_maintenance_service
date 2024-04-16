-- 1 Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(100),
    ContactInformation NVARCHAR(100),
    Address NVARCHAR(255)
);

-- 2 Vehicles table
CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    Make NVARCHAR(100),
    Model NVARCHAR(100),
    Year INT,
    VIN NVARCHAR(17),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 3 Services table--------------------------------------------------Document-Oriented
CREATE TABLE Services (
    ServiceID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Description NVARCHAR(MAX)
);

-- 4 Appointments table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    Date DATE,
    Time TIME,
    CustomerID INT,
    VehicleID INT,
    ServiceID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

-- 5 Technicians table ----------------------------------------Document-Oriented
CREATE TABLE Technicians (
    TechnicianID INT PRIMARY KEY,
    Name NVARCHAR(100),
    ContactInformation NVARCHAR(100)
);

-- 6 Maintenance Records table
CREATE TABLE MaintenanceRecords (
    RecordID INT PRIMARY KEY,
    VehicleID INT,
    TechnicianID INT,
    Date DATE,
    Description NVARCHAR(MAX),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (TechnicianID) REFERENCES Technicians(TechnicianID)
);

-- 7 Parts Inventory table
CREATE TABLE PartsInventory (
    PartID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Description NVARCHAR(MAX),
    QuantityInStock INT
);

-- 8 Invoices table
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    AppointmentID INT,
    TotalCost DECIMAL(10, 2),
    Date DATE,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

-- 9 Feedback/Ratings table
CREATE TABLE FeedbackRatings (
    FeedbackID INT PRIMARY KEY,
    CustomerID INT,
    TechnicianID INT,
    Rating INT,
    Comments NVARCHAR(MAX),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (TechnicianID) REFERENCES Technicians(TechnicianID)
);

-- 10 Warranty Information table
CREATE TABLE WarrantyInformation (
    WarrantyID INT PRIMARY KEY,
    VehicleID INT,
    Provider NVARCHAR(100),
    CoverageDetails NVARCHAR(MAX),
    ExpirationDate DATE,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);

-- 11 Supplier Information table--------------------Document-Oriented
CREATE TABLE SupplierInformation (
    SupplierID INT PRIMARY KEY,
    Name NVARCHAR(100),
    ContactInformation NVARCHAR(100),
    PartsSupplied NVARCHAR(MAX)
);

-- 12 Employee Information table-------------------Document-Oriented
CREATE TABLE EmployeeInformation (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Position NVARCHAR(100),
    ContactInformation NVARCHAR(100)
);

-- 13 Service Packages table ----------------------Document-Oriented
CREATE TABLE ServicePackages (
    PackageID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Description NVARCHAR(MAX),
    ServicesIncluded NVARCHAR(MAX),
    Cost DECIMAL(10, 2)
);

-- 14 Insurance Information table
CREATE TABLE InsuranceInformation (
    InsuranceID INT PRIMARY KEY,
    PolicyNumber NVARCHAR(50),
    ExpirationDate DATE,
    CoverageDetails NVARCHAR(MAX)
);

-- 15 Payment Transactions table
CREATE TABLE PaymentTransactions (
    TransactionID INT PRIMARY KEY,
    InvoiceID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod NVARCHAR(50),
    FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID)
);
