CREATE TABLE IF NOT EXISTS propertybox.property_inquiries (
    record_id SERIAL PRIMARY KEY,

    user_id INT NOT NULL REFERENCES propertybox.users(record_id) ON DELETE CASCADE,

    property_id INT NOT NULL REFERENCES propertybox.properties(record_id) ON DELETE CASCADE,

    property_interest_pl_id INT NOT NULL REFERENCES master.picklist(record_id), -- E.g., Interested, Not Interested, visit done, waiting for approval

    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,

    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE IF EXISTS propertybox.property_inquiries
    ADD COLUMN IF NOT EXISTS contact_number VARCHAR(15),
    ADD COLUMN IF NOT EXISTS description TEXT,
    ADD COLUMN IF NOT EXISTS email VARCHAR(255),
    ADD COLUMN IF NOT EXISTS callback_request_time TIMESTAMP,
    ADD COLUMN IF NOT EXISTS callback_request_pl_id INT NOT NULL REFERENCES master.picklist(record_id),
    DROP COLUMN IF EXISTS property_interest_pl_id CASCADE;;
    
    

