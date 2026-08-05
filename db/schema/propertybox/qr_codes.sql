DO $$ BEGIN
    CREATE TYPE propertybox.qr_code_status AS ENUM ('AVAILABLE', 'ASSIGNED', 'DISABLED');
EXCEPTION WHEN duplicate_object THEN null;
END $$;

CREATE TABLE IF NOT EXISTS propertybox.qr_codes (
    record_id SERIAL PRIMARY KEY,

    qr_code VARCHAR(100) NOT NULL UNIQUE,

    property_id INT REFERENCES propertybox.properties(record_id) ON DELETE SET NULL,

    status propertybox.qr_code_status NOT NULL DEFAULT 'AVAILABLE',
    assigned_date_time TIMESTAMP,

    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,

    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_qr_codes_property_id ON propertybox.qr_codes(property_id);
CREATE INDEX IF NOT EXISTS idx_qr_codes_status ON propertybox.qr_codes(status);
