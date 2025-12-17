CREATE TABLE IF NOT EXISTS propertybox.village (
    record_id SERIAL PRIMARY KEY,
    village_name VARCHAR(255) NOT NULL,
    village_pin_code VARCHAR(20),
    is_active BOOLEAN DEFAULT true,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 
);
