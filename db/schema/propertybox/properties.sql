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
    ADD COLUMN IF NOT EXISTS user_id INT REFERENCES propertybox.users(record_id) ON DELETE CASCADE,
    ADD COLUMN IF NOT EXISTS furniture_type_id INT REFERENCES master.picklist(record_id),
    ADD COLUMN IF NOT EXISTS property_age INT,
    ADD COLUMN IF NOT EXISTS bhk INT,
    ADD COLUMN IF NOT EXISTS no_of_bathrooms INT,
    ADD COLUMN IF NOT EXISTS build_up_area_sqft DECIMAL(10,2),
    ADD COLUMN IF NOT EXISTS car_parking_cost DECIMAL(10,2),
    ADD COLUMN IF NOT EXISTS amenities_cost DECIMAL(10,2),
    ADD COLUMN IF NOT EXISTS additional_cost DECIMAL(10,2),
    ADD COLUMN IF NOT EXISTS monthly_rent DECIMAL(10,2),
    ADD COLUMN IF NOT EXISTS monthly_maintenance DECIMAL(10,2),
    ADD COLUMN IF NOT EXISTS availability_from TIMESTAMP,
    ADD COLUMN IF NOT EXISTS property_current_status_id INT REFERENCES master.picklist(record_id),
    ADD COLUMN IF NOT EXISTS requirement_type_id INT REFERENCES master.picklist(record_id),
    ADD COLUMN IF NOT EXISTS property_inactive_status_id INT REFERENCES master.picklist(record_id),
    ADD COLUMN IF NOT EXISTS primary_location_id INT REFERENCES master.picklist(record_id),
    ADD COLUMN IF NOT EXISTS other_primary_location VARCHAR(255),
    ADD COLUMN IF NOT EXISTS total_floor INT,
    ADD COLUMN IF NOT EXISTS flat_floor INT,
    ADD COLUMN IF NOT EXISTS no_of_parkings INT,
    ADD COLUMN IF NOT EXISTS no_of_balconies INT,
    ADD COLUMN IF NOT EXISTS is_new_listing INT,
    ADD COLUMN IF NOT EXISTS is_listing_verified boolean default false,
    ADD COLUMN IF NOT EXISTS score INT,
    ALTER COLUMN is_listing_verified TYPE INT REFERENCES master.picklist(record_id) default 141,
    ALTER COLUMN bhk TYPE VARCHAR(10),
    ALTER COLUMN property_age TYPE VARCHAR(10),
    ALTER COLUMN community_name TYPE VARCHAR(255),
    ADD COLUMN IF NOT EXISTS plot_area_sqft DECIMAL(10,2);
