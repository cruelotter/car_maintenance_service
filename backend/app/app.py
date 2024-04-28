from flask import Flask, jsonify, render_template, after_this_request, request
from flask_redis import FlaskRedis
from flask_cors import CORS
import psycopg2

from database import CarMaintenanceService
from sql_scripts import requests_script as rs

app = Flask(__name__)
app.config['CORS_HEADERS'] = 'Content-Type'
CORS(app)

# Initialize Postgres connection
postgres_client = CarMaintenanceService()

# Configure your Redis URI
app.config['REDIS_URL'] = "redis://localhost:6379/0"

# Initialize the Redis client
redis_client = FlaskRedis(app)
@app.route('/pics', methods=['GET'])
def hello():
    @after_this_request
    def add_header(response):
        response.headers.add('Access-Control-Allow-Origin', '*')
        return response

    data = redis_client.lrange('pics', 0, -1)
    return [d.decode("utf-8") for d in data]

@app.route('/getdb')
def index():
    data = postgres_client.get_table_data('services')
    return data

@app.route('/users')
def users():
    data = postgres_client.get_table_data('users')
    return data

@app.route('/addservice', methods=['POST'])
def addservice():
    if request.method == 'POST':
        data = request.json
        d = postgres_client.add_service([data[0], data[1], data[2], data[3]])
    return d

@app.route('/deleteservice', methods=['POST'])
def deleteservice():
    data = request.json
    d = postgres_client.delete_service(data)
    return d

@app.route('/adduser', methods=['POST'])
def adduser():
    if request.method == 'POST':
        data = request.json
        d = postgres_client.add_user([data[0], data[1], data[2], data[3], data[4]])
    return d

@app.route('/dashboards/total_revenue_per_month')
def get_dashboard_revenue():
    data = postgres_client.get_dashboard_data(rs.total_revenue_per_month)
    return data


@app.route('/dashboards/report_on_most_popular_services')
def get_dashboard_services():
    data = postgres_client.get_dashboard_data(rs.report_on_most_popular_services)
    return data


@app.route('/dashboards/report_on_technician_performance')
def get_dashboard_performance():
    data = postgres_client.get_dashboard_data(rs.report_on_technician_performance)
    return data


@app.route('/dashboards/report_on_inventory_status')
def get_dashboard_inventory():
    data = postgres_client.get_dashboard_data(rs.report_on_inventory_status)
    return data


@app.route('/dashboards/report_on_customer_feedback')
def get_dashboard_feedback():
    data = postgres_client.get_dashboard_data(rs.report_on_customer_feedback)
    return data

@app.route('/orders')
def get_dashboard_orders():
    data = postgres_client.get_dashboard_data(rs.orders)
    ## кудо-то сюда еще картинки бы, чтоб вместе с заказами
    return data

@app.route('/login')
def check_credentials():
    users = postgres_client.get_table_data('users')
    print(users)
    creds = [[item[2], item[3], item[4]] for item in users]
    print(creds)
    # if creds[login] is not None:
    #     if creds[login][0] == passw:
    #         return creds[login][1]
    # return -1
    return creds


# вот это надо переименовать !!!!!!
def total_revenue_per_month():
    data = redis_client.get('pics')
    return jsonify([u.to_json() for u in data])


if __name__ == '__main__':
    app.run(debug=True)

