CREATE TABLE
    if not exists propertybox.top_api_questions (
        record_id SERIAL PRIMARY KEY,
        question TEXT NOT NULL,
        is_active BOOLEAN DEFAULT true,
        is_deleted BOOLEAN DEFAULT false,
        description TEXT,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );