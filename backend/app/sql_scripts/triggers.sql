-- Trigger for cascading delete on vehicles table
CREATE OR REPLACE FUNCTION delete_vehicle_cascade()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM vehicles WHERE customer_id = OLD.customer_id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER cascade_delete_vehicles
AFTER DELETE ON customers
FOR EACH ROW
EXECUTE FUNCTION delete_vehicle_cascade();

-- Trigger for cascading delete on maintenance_records table
CREATE OR REPLACE FUNCTION delete_maintenance_records_cascade()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM maintenance_records WHERE vehicle_id = OLD.vehicle_id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER cascade_delete_maintenance_records
AFTER DELETE ON vehicles
FOR EACH ROW
EXECUTE FUNCTION delete_maintenance_records_cascade();

-- Trigger for cascading delete on invoices table
CREATE OR REPLACE FUNCTION delete_invoices_cascade()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM invoices WHERE appointment_id = OLD.appointment_id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER cascade_delete_invoices
AFTER DELETE ON appointments
FOR EACH ROW
EXECUTE FUNCTION delete_invoices_cascade();

-- Trigger for cascading delete on feedback_ratings table
CREATE OR REPLACE FUNCTION delete_feedback_ratings_cascade()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM feedback_ratings WHERE customer_id = OLD.customer_id;
    DELETE FROM feedback_ratings WHERE technician_id = OLD.technician_id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER cascade_delete_feedback_ratings
AFTER DELETE ON customers
FOR EACH ROW
EXECUTE FUNCTION delete_feedback_ratings_cascade();


-- Trigger for cascading delete on users_relations table
CREATE OR REPLACE FUNCTION delete_users_relations_cascade()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM users_relations WHERE subordinate = OLD.user_id OR manager = OLD.user_id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER cascade_delete_users_relations
AFTER DELETE ON users
FOR EACH ROW
EXECUTE FUNCTION delete_users_relations_cascade();



-- Trigger for cascading delete on users and users_relations table
CREATE OR REPLACE FUNCTION delete_users_cascade()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM users_relations WHERE subordinate = OLD.user_id OR manager = OLD.user_id;
    DELETE FROM users WHERE user_id = OLD.user_id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER cascade_delete_users
AFTER DELETE ON technicians
FOR EACH ROW
EXECUTE FUNCTION delete_users_cascade();



