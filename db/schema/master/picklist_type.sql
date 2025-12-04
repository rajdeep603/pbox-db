CREATE TABLE
    if not exists master.picklist_type (
        record_id SERIAL PRIMARY KEY,
        code VARCHAR(250) NOT NULL,
        name VARCHAR(250) NOT NULL,
        is_deleted BOOLEAN DEFAULT false,
        description TEXT,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );