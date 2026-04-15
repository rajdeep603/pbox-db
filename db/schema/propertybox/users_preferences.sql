CREATE TABLE IF NOT EXISTS propertybox.users_preferences (
    record_id SERIAL PRIMARY KEY,

    user_id INT NOT NULL
      REFERENCES propertybox.users(record_id) ON DELETE CASCADE,

    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,

    requirement_type_ids INT[],
    properties_posted_by_ids INT[],
    property_type_ids INT[],
    community_type_ids INT[],
    facing_ids INT[],

    property_age INT[],
    bhk_count INT[],
    bathroom_count INT[],

    

    budget_min INT,
    budget_max INT,
    
    availability_date DATE,

    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,

    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE IF EXISTS propertybox.users_preferences
    ADD COLUMN IF NOT EXISTS primary_location_ids INT[], 
    ADD COLUMN IF NOT EXISTS furniture_type_ids INT[];


