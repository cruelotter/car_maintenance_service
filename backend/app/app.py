from flask import Flask, jsonify, render_template, after_this_request
from flask_redis import FlaskRedis
from flask_cors import CORS
import psycopg2

from database import CarMaintenanceService
from sql_scripts import requests_script as rs

app = Flask(__name__)
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
    data = postgres_client.get_data('services')
    return data

@app.route('/dashboards/total_revenue_per_month', methods=['GET'])
def get_dashboard(name):
    data = postgres_client.get_dashboard_data(rs.total_revenue_per_month)


@app.route('/dashboards/report_on_most_popular_services', methods=['GET'])
def get_dashboard(name):
    data = postgres_client.get_dashboard_data(rs.report_on_most_popular_services)


@app.route('/dashboards/report_on_technician_performance', methods=['GET'])
def get_dashboard(name):
    data = postgres_client.get_dashboard_data(rs.report_on_technician_performance)


@app.route('/dashboards/report_on_inventory_status', methods=['GET'])
def get_dashboard(name):
    data = postgres_client.get_dashboard_data(rs.report_on_inventory_status)


@app.route('/dashboards/report_on_customer_feedback', methods=['GET'])
def get_dashboard(name):
    data = postgres_client.get_dashboard_data(rs.report_on_customer_feedback)



# вот это надо переименовать !!!!!!
def total_revenue_per_month():
    data = redis_client.get('pics')
    return jsonify([u.to_json() for u in data])


if __name__ == '__main__':
    app.run(debug=True)


