CREATE TABLE
    if not exists propertybox.dashboard (
        record_id SERIAL PRIMARY KEY,
        title TEXT NOT NULL,
        image TEXT NOT NULL,
        is_active BOOLEAN DEFAULT true,
        is_deleted BOOLEAN DEFAULT false,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
