CREATE TABLE IF NOT EXISTS
    master.product_storage (
        record_id SERIAL PRIMARY KEY,
        product_id INT NOT NULL REFERENCES master.products (record_id),
        storage_type_pl_id INT REFERENCES master.picklist (record_id),
        quantity INT NOT NULL DEFAULT 0,
        is_deleted BOOLEAN DEFAULT false,
        description TEXT,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );