CREATE TABLE IF NOT EXISTS propertybox.users (
    record_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    country_code VARCHAR(10),
    gender_pl_id INT REFERENCES master.picklist (record_id),
    date_of_birth DATE,
    qualification_pl_id INT REFERENCES master.picklist (record_id),
    user_type_pl_id INT REFERENCES master.picklist (record_id), eg. 'admin', 'freelance agent', 'corporate agent', 'customer', 'realtor', 'service provider'
    is_active BOOLEAN DEFAULT true,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 
);
