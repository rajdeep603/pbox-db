CREATE TABLE IF NOT EXISTS propertybox.app_users (
    record_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES propertybox.users (record_id),
    app_pl_id INT REFERENCES master.picklist (record_id),
    is_primary BOOLEAN DEFAULT false,
    is_active BOOLEAN DEFAULT true,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
