CREATE TABLE IF NOT EXISTS propertybox.property_views (
    record_id SERIAL PRIMARY KEY,
    
    user_id INT NOT NULL REFERENCES propertybox.users(record_id) ON DELETE CASCADE,

    property_id INT NOT NULL REFERENCES propertybox.properties(record_id) ON DELETE CASCADE,

    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DO $$ BEGIN
    CREATE TYPE propertybox.visit_path AS ENUM ('qr', 'browsing');
EXCEPTION WHEN duplicate_object THEN null;
END $$;

ALTER TABLE IF EXISTS propertybox.property_views
    ADD COLUMN IF NOT EXISTS user_source VARCHAR(100),
    ADD COLUMN IF NOT EXISTS visit_path propertybox.visit_path;
