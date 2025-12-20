CREATE TABLE IF NOT EXISTS propertybox.property_amenities (
    record_id SERIAL PRIMARY KEY,

    property_id INT NOT NULL REFERENCES propertybox.properties(record_id) ON DELETE CASCADE,
    amenity_id INT NOT NULL REFERENCES master.picklist(record_id),

    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,

    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    UNIQUE (property_id, amenity_id)
);
