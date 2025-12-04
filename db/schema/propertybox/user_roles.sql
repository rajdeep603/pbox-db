CREATE TABLE IF NOT EXISTS propertybox.user_roles (
    record_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES propertybox.users (record_id),
    role_id INT REFERENCES master.roles (record_id),
    is_primary BOOLEAN DEFAULT false,
    is_active BOOLEAN DEFAULT true,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 
);
