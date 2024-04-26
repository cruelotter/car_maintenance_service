# 1 report on total revenue per month
total_revenue_per_month = """--sql
select
    year(i.date) as year,
    month(i.date) as month,
    sum(i.totalcost) as total_revenue
from
    invoices i
group by
    year(i.date),
    month(i.date)
order by
    year(i.date),
    month(i.date);
"""

# 2 report on most popular services
report_on_most_popular_services = """--sql
select
    s.name as servic_ename,
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
