CREATE TABLE IF NOT EXISTS propertybox.env_var (
    record_id SERIAL PRIMARY KEY,

    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,
    
    var_name VARCHAR(255) NOT NULL,
    var_value TEXT NOT NULL,

    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



