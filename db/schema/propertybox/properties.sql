CREATE TABLE IF NOT EXISTS propertybox.properties (
    record_id SERIAL PRIMARY KEY,

    title VARCHAR(255),
    description TEXT,
    

    property_type_id INT REFERENCES master.picklist(record_id),
    community_type_id INT REFERENCES master.picklist(record_id),
    construction_status_id INT REFERENCES master.picklist(record_id),

    area_sqft BIGINT,
    price DECIMAL(15,2),

    total_units INT,
    bank_loan_available BOOLEAN DEFAULT FALSE,

    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),

    builder_name VARCHAR(255),

    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,

    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE IF EXISTS propertybox.properties
    ADD COLUMN IF NOT EXISTS user_id INT REFERENCES propertybox.users(record_id) ON DELETE CASCADE;
