CREATE TABLE IF NOT EXISTS propertybox.payment (
    record_id SERIAL PRIMARY KEY,

    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,
    
    payment_status VARCHAR(255) NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    error_message TEXT,
    user_id INT REFERENCES propertybox.users(record_id) ON DELETE CASCADE,

    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);