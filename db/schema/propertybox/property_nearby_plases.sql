CREATE TABLE propertybox.property_nearby_places (
    record_id SERIAL PRIMARY KEY,
    property_id INTEGER NOT NULL,
    place_type VARCHAR(50) NOT NULL,
    place_label VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    address TEXT,
    latitude DECIMAL(10, 7),
    longitude DECIMAL(10, 7),
    distance_meters DECIMAL(10, 2),
    rating DECIMAL(3, 1),
    place_id VARCHAR(255),
    is_active BOOLEAN DEFAULT true,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INTEGER,
    insert_date_time TIMESTAMP(6) DEFAULT now(),
    updated_by INTEGER,
    update_date_time TIMESTAMP(6) DEFAULT now(),
    CONSTRAINT fk_property_nearby_places_property FOREIGN KEY (property_id)
        REFERENCES propertybox.properties(record_id) ON DELETE CASCADE ON UPDATE NO ACTION
);
