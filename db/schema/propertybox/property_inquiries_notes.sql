CREATE TABLE IF NOT EXISTS propertybox.property_inquiries_notes (
    record_id SERIAL PRIMARY KEY,

    message TEXT NOT NULL,
    inquiry_id INT NOT NULL REFERENCES propertybox.property_inquiries(record_id) ON DELETE CASCADE,

    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,

    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

    
    

