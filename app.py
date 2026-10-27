"""
Electric Vehicle Market Analytics - Flask Web Integration Server
Author: Bhavy Patil
Program: Data Analytics with Tableau
"""

from flask import Flask, render_template, jsonify

app = Flask(__name__)

DASHBOARD_KPIS = {
    "total_manufacturers": 200,
    "total_ev_models": 17980,
    "total_annual_sales": "$1,550.7M Units",
    "avg_customer_rating": "4/5",
    "avg_driving_range": "324.54 KM",
    "avg_battery_capacity": "78.2 kWh"
}

@app.route("/")
def home():
    """Render the primary analytics portal with embedded Tableau visuals."""
    return render_template("index.html", kpis=DASHBOARD_KPIS)

@app.route("/api/kpis")
def get_kpis():
    """API endpoint providing current platform metrics."""
    return jsonify(DASHBOARD_KPIS)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
