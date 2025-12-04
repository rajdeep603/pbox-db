CREATE TABLE
    if not exists master.products (
        record_id SERIAL PRIMARY KEY,
        title VARCHAR(250) NOT NULL,
        sku VARCHAR(100) ,
        product_type_pl_id INT REFERENCES master.picklist (record_id),
        name VARCHAR(250) NOT NULL,
        is_deleted BOOLEAN DEFAULT false,
        description TEXT,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );