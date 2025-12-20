CREATE TABLE IF NOT EXISTS propertybox.property_media (
    record_id SERIAL PRIMARY KEY,

    property_id INT NOT NULL REFERENCES propertybox.properties(record_id) ON DELETE CASCADE,

    media_type VARCHAR(20) NOT NULL, -- e.g., 'image', 'video'
    url TEXT NOT NULL,
    display_order INT DEFAULT 0,

    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,

    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
