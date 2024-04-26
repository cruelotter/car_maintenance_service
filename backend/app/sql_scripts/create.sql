-- 1 customers table
create table customers (
    customer_id integer,
    name text,
    contact_information text,
    address text,
    primary key(customer_id)
);

-- 2 vehicles table
create table vehicles (
    vehicle_id integer,
    make text,
    model text,
    year integer,
    vin text,
    customer_id integer,
    primary key(vehicle_id),
    foreign key (customer_id) references customers(customer_id)
);

-- 3 Services
CREATE TABLE services (
    service_id integer,
    name text,
    description text,
 PRIMARY KEY(service_id)
);

-- 4 Appointments table
CREATE TABLE appointments (
    appointment_id integer,
    date date,
    time time,
    customer_id integer,
    vehicle_id integer,
    service_id integer,
 PRIMARY KEY(appointment_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

-- 5 Technicians table ----------------------------------------Document-Oriented
CREATE TABLE Technicians (
    technician_id integer,
    name text,
    contact_information text,
 PRIMARY KEY(technician_id)
);
-- 6 Maintenance Records table
CREATE TABLE maintenance_records (
    record_id integer,
    vehicle_id integer,
    technician_id integer,
    date date,
    description text,
 PRIMARY KEY(record_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY (technician_id) REFERENCES Technicians(technician_id)
);

-- 7 Parts Inventory table
CREATE TABLE parts_inventory (
    part_id integer,
    name text,
    description text,
    quantity_in_stock integer,
 PRIMARY KEY(part_id)
);

-- 8 Invoices table
CREATE TABLE Invoices (
    invoice_id integer,
    appointment_id integer,
    total_cost decimal,
    date date,
 PRIMARY KEY(invoice_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- 9 Feedback/Ratings table
CREATE TABLE feedback_ratings (
    feedback_id integer,
    customer_id integer,
    technician_id integer,
    rating integer,
    comments text,
 PRIMARY KEY(feedback_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (technician_id) REFERENCES Technicians(technician_id)
);

-- 10 Warranty Information table
CREATE TABLE warranty_information (
    warranty_id integer,
    vehicle_id integer,
    provider text,
    coverage_details text,
    expiration_date timestamp,
 PRIMARY KEY(warranty_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);

-- 11 Supplier Information table--------------------Document-Oriented
CREATE TABLE supplier_information (
    supplier_id integer,
    name text,
    contact_information text,
    parts_supplied text,
 PRIMARY KEY(supplier_id)
);

-- 12 Employee Information table-------------------Document-Oriented
CREATE TABLE employee_information (
    employee_id integer,
    name text,
    position text,
    contact_information text,
 PRIMARY KEY(employee_id)
);

-- 13 Service Packages table ----------------------Document-Oriented
CREATE TABLE service_packages (
    package_id integer,
    name text,
    description text,
    services_included text,
    cost decimal,
 PRIMARY KEY(package_id)
);

-- 14 Insurance Information table
CREATE TABLE insurance_information (
    insurance_id integer,
    policy_number text,
    expiration_date date,
    coverage_details text,
 PRIMARY KEY(insurance_id)
);

-- 15 Payment Transactions table
CREATE TABLE payment_transactions (
    transaction_id integer,
    invoice_id integer,
    payment_date timestamp,
    amount decimal,
    payment_method text,
 PRIMARY KEY(transaction_id),
    FOREIGN KEY (invoice_id) REFERENCES Invoices(invoice_id)
);
