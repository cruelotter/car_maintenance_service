-- Customers table
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

-- Vehicles table
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

-- Services table
INSERT INTO services (service_id, name, description)
VALUES
    (1, 'Oil Change', 'Regular oil change service'),
    (2, 'Brake Replacement', 'Replace worn brake pads and rotors'),
    (3, 'Tire Rotation', 'Rotate tires to ensure even wear'),
    (4, 'Engine Tune-Up', 'Inspect and tune engine components'),
    (5, 'Wheel Alignment', 'Align wheels to ensure proper steering and handling'),
    (6, 'Transmission Flush', 'Flush and replace transmission fluid'),
    (7, 'Coolant Flush', 'Flush and replace engine coolant'),
    (8, 'Battery Replacement', 'Replace worn-out car battery'),
    (9, 'Air Filter Replacement', 'Replace dirty air filter'),
    (10, 'Spark Plug Replacement', 'Replace worn-out spark plugs');

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

-- Insurance Information table
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
