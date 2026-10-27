-- EV Market Analytics Relational Database Script
-- Author: Bhavy Patil

CREATE TABLE IF NOT EXISTS ev_market_train (
    vehicle_id VARCHAR(50) PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(100) NOT NULL,
    model_year INT NOT NULL,
    manufacturing_country VARCHAR(100) NOT NULL,
    market_region VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    battery_capacity_kwh NUMERIC(8, 2),
    battery_type VARCHAR(50),
    driving_range_km NUMERIC(8, 2),
    top_speed_kmh NUMERIC(8, 2),
    number_of_motors INT,
    drivetrain VARCHAR(20),
    annual_sales_units NUMERIC(12, 2),
    price_usd NUMERIC(10, 2),
    customer_rating INT,
    co2_saved_tons_per_year NUMERIC(8, 2),
    charging_time_hours NUMERIC(6, 2)
);

CREATE INDEX IF NOT EXISTS idx_ev_cat_mfg ON ev_market_train(category, manufacturer);
CREATE INDEX IF NOT EXISTS idx_ev_country ON ev_market_train(manufacturing_country);
CREATE INDEX IF NOT EXISTS idx_ev_year ON ev_market_train(model_year);

-- KPI Summary Query
SELECT 
    COUNT(DISTINCT manufacturer) AS total_manufacturers,
    COUNT(DISTINCT model_name) AS total_ev_models,
    ROUND(SUM(annual_sales_units) / 1000000.0, 1) AS total_annual_sales_millions,
    ROUND(AVG(customer_rating), 1) AS avg_customer_rating,
    ROUND(AVG(driving_range_km), 2) AS avg_driving_range_km,
    ROUND(AVG(battery_capacity_kwh), 2) AS avg_battery_capacity_kwh
FROM ev_market_train;
