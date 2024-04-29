-- 1 Customers table
INSERT INTO customers (customer_id, name, contact_information, address)
VALUES
    (1, 'John Doe', 'john.doe@example.com', '123 Main St, Anytown, USA'),
    (2, 'Alice Smith', 'alice.smith@example.com', '456 Elm St, Othertown, USA'),
    (3, 'Bob Johnson', 'bob.johnson@example.com', '789 Oak St, Anycity, USA'),
    (4, 'Emily Brown', 'emily.brown@example.com', '101 Pine St, Anothercity, USA'),
    (5, 'Michael Davis', 'michael.davis@example.com', '222 Cedar St, Yetanothercity, USA'),
    (6, 'Sarah Wilson', 'sarah.wilson@example.com', '333 Maple St, Metropolis, USA'),
    (7, 'David Lee', 'david.lee@example.com', '444 Walnut St, Gotham, USA'),
    (8, 'Jennifer Garcia', 'jennifer.garcia@example.com', '555 Birch St, Springfield, USA'),
    (9, 'James Martinez', 'james.martinez@example.com', '666 Oakwood St, Capital City, USA'),
    (10, 'Linda Robinson', 'linda.robinson@example.com', '777 Elmwood St, Central City, USA');

-- 2 Vehicles table
INSERT INTO vehicles (vehicle_id, make, model, year, vin, customer_id)
VALUES
    (1, 'Toyota', 'Camry', 2015, '1HGBH41JXMN109186', 1),
    (2, 'Honda', 'Civic', 2018, '2C3CDZFJ9KH502307', 2),
    (3, 'Ford', 'F-150', 2019, '3J8HD48D1T1077505', 3),
    (4, 'Chevrolet', 'Malibu', 2017, '4Y1SL65848Z411439', 4),
    (5, 'Nissan', 'Altima', 2016, '5TFCY5F11DX025916', 5),
    (6, 'BMW', 'X5', 2020, '6JTDJ41J9B6765872', 6),
    (7, 'Mercedes-Benz', 'E-Class', 2019, '7GHDD48F9V1083902', 7),
    (8, 'Audi', 'A4', 2018, '8Y1SL65848Z432342', 8),
    (9, 'Hyundai', 'Elantra', 2017, '9HGBH41JXMN109182', 9),
    (10, 'Volkswagen', 'Jetta', 2016, '10YFCY5F11DX025915', 10);

-- 3 Services table
INSERT INTO services (service_id, name, description, cost)
VALUES
    (1, 'Oil Change', 'Regular oil change service', 100),
    (2, 'Brake Replacement', 'Replace worn brake pads and rotors', 584),
    (3, 'Tire Rotation', 'Rotate tires to ensure even wear', 234),
    (4, 'Engine Tune-Up', 'Inspect and tune engine components', 670),
    (5, 'Wheel Alignment', 'Align wheels to ensure proper steering and handling', 543),
    (6, 'Transmission Flush', 'Flush and replace transmission fluid', 555),
    (7, 'Coolant Flush', 'Flush and replace engine coolant', 120),
    (8, 'Battery Replacement', 'Replace worn-out car battery', 640),
    (9, 'Air Filter Replacement', 'Replace dirty air filter', 430),
    (10, 'Spark Plug Replacement', 'Replace worn-out spark plugs', 780);

-- 4
INSERT INTO appointments (appointment_id, date, time, customer_id, vehicle_id, service_id)
VALUES
    (1, '2024-04-20', '09:00', 1, 1, 1),
    (2, '2024-04-21', '10:30', 2, 2, 2),
    (3, '2024-04-22', '11:00', 3, 3, 3),
    (4, '2024-04-23', '13:00', 4, 4, 4),
    (5, '2024-04-24', '14:30', 5, 5, 5),
    (6, '2024-04-25', '15:00', 6, 6, 6),
    (7, '2024-04-26', '16:30', 7, 7, 7),
    (8, '2024-04-27', '17:00', 8, 8, 8),
    (9, '2024-04-28', '18:30', 9, 9, 9),
    (10, '2024-04-29', '19:00', 10, 10, 10);

-- 5
INSERT INTO technicians (technician_id, name, contact_information)
VALUES
    (1, 'John Smith', 'john.smith@example.com'),
    (2, 'Alice Johnson', 'alice.johnson@example.com'),
    (3, 'Bob Williams', 'bob.williams@example.com'),
    (4, 'Emily Brown', 'emily.brown@example.com'),
    (5, 'Michael Davis', 'michael.davis@example.com'),
    (6, 'Sarah Wilson', 'sarah.wilson@example.com'),
    (7, 'David Lee', 'david.lee@example.com'),
    (8, 'Jennifer Garcia', 'jennifer.garcia@example.com'),
    (9, 'James Martinez', 'james.martinez@example.com'),
    (10, 'Linda Robinson', 'linda.robinson@example.com');

-- 6
INSERT INTO maintenance_records (record_id, vehicle_id, technician_id, date, description)
VALUES
    (1, 1, 1, '2024-04-20', 'Performed routine oil change'),
    (2, 2, 2, '2024-04-21', 'Replaced brake pads and rotors'),
    (3, 3, 3, '2024-04-22', 'Rotated tires and tuned engine'),
    (4, 4, 4, '2024-04-23', 'Flushed transmission fluid and replaced coolant'),
    (5, 5, 5, '2024-04-24', 'Replaced battery and aligned wheels'),
    (6, 6, 6, '2024-04-25', 'Replaced air filter and spark plugs'),
    (7, 7, 7, '2024-04-26', 'Performed coolant flush and transmission flush'),
    (8, 8, 8, '2024-04-27', 'Performed wheel alignment and engine tune-up'),
    (9, 9, 9, '2024-04-28', 'Replaced worn-out parts and tuned engine'),
    (10, 10, 10, '2024-04-29', 'Performed routine maintenance and inspections');


-- 7
INSERT INTO parts_inventory (part_id, name, description, quantity_in_stock)
VALUES
    (1, 'Oil Filter', 'Replacement oil filter for various vehicles', 100),
    (2, 'Brake Pads', 'Replacement brake pads for various vehicles', 150),
    (3, 'Air Filter', 'Replacement air filter for various vehicles', 200),
    (4, 'Spark Plugs', 'Replacement spark plugs for various vehicles', 120),
    (5, 'Battery', 'Car battery for various vehicles', 80),
    (6, 'Coolant', 'Engine coolant for various vehicles', 90),
    (7, 'Transmission Fluid', 'Transmission fluid for various vehicles', 100),
    (8, 'Tires', 'Tires for various vehicles', 160),
    (9, 'Wheel Alignment Kit', 'Kit for wheel alignment service', 50),
    (10, 'Engine Tune-Up Kit', 'Kit for engine tune-up service', 70);

-- 8
INSERT INTO invoices (invoice_id, appointment_id, total_cost, date)
VALUES
    (1, 1, 75.00, '2024-04-20'),
    (2, 2, 150.00, '2024-04-21'),
    (3, 3, 200.00, '2024-04-22'),
    (4, 4, 250.00, '2024-04-23'),
    (5, 5, 300.00, '2024-04-24'),
    (6, 6, 350.00, '2024-04-25'),
    (7, 7, 400.00, '2024-04-26'),
    (8, 8, 450.00, '2024-04-27'),
    (9, 9, 500.00, '2024-04-28'),
    (10, 10, 550.00, '2024-04-29');


-- 9
INSERT INTO feedback_ratings (feedback_id, customer_id, technician_id, rating, comments)
VALUES
    (1, 1, 1, 5, 'Excellent service, highly recommended!'),
    (2, 2, 2, 4, 'Good job overall, but could improve communication'),
    (3, 3, 3, 3, 'Average service, some issues need attention'),
    (4, 4, 4, 2, 'Disappointed with the quality of work'),
    (5, 5, 5, 1, 'Terrible experience, will not return'),
    (6, 6, 6, 4, 'Satisfied with the service provided'),
    (7, 7, 7, 5, 'Great service, friendly staff!'),
    (8, 8, 8, 3, 'Service was okay, but a bit pricey'),
    (9, 9, 9, 4, 'Overall satisfied, but could be faster'),
    (10, 10, 10, 5, 'Excellent experience, will definitely return');

-- 10
INSERT INTO warranty_information (warranty_id, vehicle_id, provider, coverage_details, expiration_date)
VALUES
    (1, 1, 'Toyota', '3-year warranty covering major components', '2027-04-20'),
    (2, 2, 'Honda', '5-year warranty covering engine and transmission', '2029-04-21'),
    (3, 3, 'Ford', '2-year warranty covering powertrain components', '2026-04-22'),
    (4, 4, 'Chevrolet', '4-year warranty covering bumper-to-bumper', '2028-04-23'),
    (5, 5, 'Nissan', '5-year warranty covering engine, transmission, and drivetrain', '2029-04-24'),
    (6, 6, 'BMW', '4-year warranty covering major systems', '2028-04-25'),
    (7, 7, 'Mercedes-Benz', '3-year warranty covering mechanical and electrical components', '2027-04-26'),
    (8, 8, 'Audi', '4-year warranty covering vehicle components', '2028-04-27'),
    (9, 9, 'Hyundai', '5-year warranty covering major systems', '2029-04-28'),
    (10, 10, 'Volkswagen', '3-year warranty covering powertrain components', '2027-04-29');

-- 11
INSERT INTO supplier_information (supplier_id, name, contact_information, parts_supplied)
VALUES
    (1, 'Auto Parts Co.', 'contact@autoparts.com', 'Oil filters, Brake pads, Air filters'),
    (2, 'Tire Distributors', 'contact@tiredistributors.com', 'Tires, Wheel alignment kits'),
    (3, 'Battery Warehouse', 'contact@batterywarehouse.com', 'Car batteries'),
    (4, 'Fluid Suppliers', 'contact@fluidsuppliers.com', 'Coolant, Transmission fluid'),
    (5, 'Spark Plug Depot', 'contact@sparkplugdepot.com', 'Spark plugs'),
    (6, 'Parts R Us', 'contact@partsrus.com', 'Various vehicle parts and accessories'),
    (7, 'Alignment Tools Inc.', 'contact@alignmenttools.com', 'Wheel alignment tools'),
    (8, 'Tune-Up Supplies', 'contact@tuneupsupplies.com', 'Engine tune-up kits'),
    (9, 'Coolant Solutions', 'contact@coolantsolutions.com', 'Engine coolant'),
    (10, 'Transmission Fluid Co.', 'contact@transmissionfluid.com', 'Transmission fluid');

-- 12
INSERT INTO employee_information (employee_id, name, position, contact_information)
VALUES
    (1, 'Manager Smith', 'Manager', 'manager.smith@example.com'),
    (2, 'Service Advisor Johnson', 'Service Advisor', 'advisor.johnson@example.com'),
    (3, 'Technician Brown', 'Technician', 'technician.brown@example.com'),
    (4, 'Receptionist Davis', 'Receptionist', 'receptionist.davis@example.com'),
    (5, 'Parts Specialist Wilson', 'Parts Specialist', 'parts.specialist@example.com'),
    (6, 'Sales Representative Lee', 'Sales Representative', 'sales.lee@example.com'),
    (7, 'Accountant Garcia', 'Accountant', 'accountant.garcia@example.com'),
    (8, 'HR Manager Martinez', 'HR Manager', 'hr.manager@example.com'),
    (9, 'Marketing Coordinator Robinson', 'Marketing Coordinator', 'marketing.coordinator@example.com'),
    (10, 'IT Support Smith', 'IT Support', 'it.support@example.com');


-- 13
-- Service Packages table
INSERT INTO service_packages (package_id, name, description, services_included, cost)
VALUES
    (1, 'Basic Service Package', 'Includes oil change and tire rotation', 'Oil Change, Tire Rotation', 50.00),
    (2, 'Standard Service Package', 'Includes oil change, tire rotation, and brake inspection', 'Oil Change, Tire Rotation, Brake Inspection', 75.00),
    (3, 'Premium Service Package', 'Includes oil change, tire rotation, brake inspection, and engine tune-up', 'Oil Change, Tire Rotation, Brake Inspection, Engine Tune-Up', 100.00),
    (4, 'Deluxe Service Package', 'Includes oil change, tire rotation, brake inspection, engine tune-up, and coolant flush', 'Oil Change, Tire Rotation, Brake Inspection, Engine Tune-Up, Coolant Flush', 150.00),
    (5, 'Ultimate Service Package', 'Includes oil change, tire rotation, brake inspection, engine tune-up, coolant flush, and transmission flush', 'Oil Change, Tire Rotation, Brake Inspection, Engine Tune-Up, Coolant Flush, Transmission Flush', 200.00),
    (6, 'Custom Service Package', 'Customize your service package based on your vehicle needs', 'Custom', 0.00),
    (7, 'Winter Service Package', 'Special package for winter maintenance', 'Oil Change, Tire Rotation, Battery Check, Coolant Check', 75.00),
    (8, 'Summer Service Package', 'Special package for summer maintenance', 'Oil Change, Tire Rotation, A/C Inspection, Coolant Check', 75.00),
    (9, 'Spring Service Package', 'Special package for spring maintenance', 'Oil Change, Tire Rotation, Brake Inspection, Engine Tune-Up', 100.00),
    (10, 'Fall Service Package', 'Special package for fall maintenance', 'Oil Change, Tire Rotation, Battery Check, Coolant Check', 75.00);

-- 14
INSERT INTO insurance_information (insurance_id, policy_number, expiration_date, coverage_details)
VALUES
    (1, 'ABC123', '2024-12-31', 'Comprehensive coverage for vehicle damage and theft'),
    (2, 'XYZ456', '2024-12-31', 'Liability coverage for bodily injury and property damage'),
    (3, 'DEF789', '2024-12-31', 'Collision coverage for vehicle damage'),
    (4, 'GHI101', '2024-12-31', 'Coverage for medical expenses and personal injury protection'),
    (5, 'JKL202', '2024-12-31', 'Uninsured/underinsured motorist coverage'),
    (6, 'MNO303', '2024-12-31', 'Additional coverage for rental car reimbursement'),
    (7, 'PQR404', '2024-12-31', 'Emergency roadside assistance and towing coverage'),
    (8, 'STU505', '2024-12-31', 'Coverage for damage caused by natural disasters'),
    (9, 'VWX606', '2024-12-31', 'Gap insurance coverage for vehicle depreciation'),
    (10, 'YZA707', '2024-12-31', 'Extended warranty coverage for vehicle components');

-- 15
INSERT INTO payment_transactions (transaction_id, invoice_id, payment_date, amount, payment_method) 
VALUES 
    (1, 1, '2022-01-15 10:30:00', 100.50, 'Credit Card'),
    (2, 2, '2022-01-16 11:45:00', 75.25, 'PayPal'),
    (3, 3, '2022-01-17 09:00:00', 200.00, 'Bank Transfer'),
    (4, 4, '2022-01-18 14:20:00', 150.75, 'Cash'),
    (5, 5, '2022-01-19 16:30:00', 120.00, 'Credit Card'),
    (6, 6, '2022-01-20 08:45:00', 90.50, 'PayPal'),
    (7, 7, '2022-01-21 12:10:00', 180.25, 'Bank Transfer'),
    (8, 8, '2022-01-22 15:40:00', 95.75, 'Cash'),
    (9, 9, '2022-01-23 17:50:00', 110.00, 'Credit Card'),
    (10, 10, '2022-01-24 13:15:00', 85.50, 'PayPal');

-- 16
INSERT INTO users VALUES (1, 1, 'john_doe', 'password123', 1);
INSERT INTO users VALUES (2, 2, 'jane_smith', 'securepass', 2);
INSERT INTO users VALUES (3, 3, 'mike_jones', 'letmein', 1);
INSERT INTO users VALUES (4, 4, 'sara_wilson', 'password321', 2);
INSERT INTO users VALUES (5, 5, 'alex_green', 'qwerty', 1);
INSERT INTO users VALUES (6, 6, 'emily_brown', 'abc123', 2);
INSERT INTO users VALUES (7, 7, 'chris_taylor', 'p@ssw0rd', 1);
INSERT INTO users VALUES (8, 8, 'lisa_jackson', 'password456', 2);
INSERT INTO users VALUES (9, 9, 'kevin_adams', 'letmeout', 1);
INSERT INTO users VALUES (10, 10, 'sophia_miller', 'password789', 2);

-- 17
INSERT INTO users_relations VALUES (1, 2, 1);
INSERT INTO users_relations VALUES (2, 3, 1);
INSERT INTO users_relations VALUES (3, 4, 2);
INSERT INTO users_relations VALUES (4, 5, 2);
INSERT INTO users_relations VALUES (5, 6, 3);
INSERT INTO users_relations VALUES (6, 7, 3);
INSERT INTO users_relations VALUES (7, 8, 4);
INSERT INTO users_relations VALUES (8, 9, 4);
INSERT INTO users_relations VALUES (9, 10, 5);
INSERT INTO users_relations VALUES (10, 1, 5);