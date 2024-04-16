from flask import Flask, jsonify, render_template
from database import CarMaintenanceService

app = Flask(__name__)
service = CarMaintenanceService()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/total_revenue_per_month')
def total_revenue_per_month():
    data = service.get_total_revenue_per_month()
    return jsonify(data)



if __name__ == '__main__':
    app.run(debug=True)
