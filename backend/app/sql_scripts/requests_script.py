# ----------------------------------------ORDERS--------------------------------------
orders = """--sql
select 
    a.appointment_id,
    c.name as customer_name,
    c.contact_information,
    v.vehicle_id,
    v.make,
    v.model,
    v.vin,
    s.name as service_name
from appointments a
join customers c on c.customer_id = a.customer_id
join vehicles v on v.vehicle_id = a.vehicle_id
join services s on s.service_id = a.service_id
"""


# ----------------------------------------DASHBOARDS-----------------------------------
# 1 report on total revenue per month
total_revenue_per_month = """--sql
select
    extract(year from i.date) as year,
    extract(month from i.date) as month,
    sum(i.total_cost) as total_revenue
from
    invoices i
group by
    extract(year from i.date),
    extract(month from i.date)
order by
    extract(year from i.date),
    extract(month from i.date);
"""

# 2 report on most popular services
report_on_most_popular_services = """--sql
select
    s.name as service_name,
    count(*) as total_appointments
from
    appointments a
join
    services s on a.service_id = s.service_id
group by
    s.name
order by
    count(*) desc;
"""


# 3 report on technician performance
report_on_technician_performance = """--sql
select
    t.name as technician_name,
    count(*) as total_maintenance_records
from
    maintenance_records m
join
    technicians t on m.technician_id = t.technician_id
group by
    t.name
order by
    count(*) desc;
"""

# 4 report on inventory status:
report_on_inventory_status = """--sql
select
    name as part_name,
    description as part_description,
    quantity_in_stock as available_quantity
from
    parts_inventory;
"""

# 5 report on customer feedback:
report_on_customer_feedback = """--sql
select
    f.customer_id,
    avg(f.rating) as average_rating
from
    feedback_ratings f
group by
    f.customer_id;
"""
