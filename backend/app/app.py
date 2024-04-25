# from flask import Flask, jsonify, render_template
# from database import CarMaintenanceService
#
# app = Flask(__name__)
# service = CarMaintenanceService()
#
# @app.route('/')
# def index():
#     return render_template('index.html')
#
# @app.route('/total_revenue_per_month')
# def total_revenue_per_month():
#     data = service.get_total_revenue_per_month()
#     return jsonify(data)
#
#
#
# if __name__ == '__main__':
#     app.run(debug=True)

from flask import Flask, jsonify, render_template, after_this_request
from flask_redis import FlaskRedis
from flask_cors import CORS
import psycopg2


app = Flask(__name__)
CORS(app)

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
    # Connect to the database
        conn = psycopg2.connect(database="postgres",
                                user="noodlenickels",
                                password="welcome29I",
                                host="127.0.0.1", port="5432")
        print("Database connected successfully")

        # create a cursor
        cur = conn.cursor()

        # Select all products from the table
        cur.execute('''SELECT * FROM services''')

        # Fetch the data
        data = cur.fetchall()


        # close the cursor and connection
        cur.close()
        conn.close()
        return data

def total_revenue_per_month():
    data = redis_client.get('pics')
    return jsonify([u.to_json() for u in data])

if __name__ == '__main__':
    app.run(debug=True)


