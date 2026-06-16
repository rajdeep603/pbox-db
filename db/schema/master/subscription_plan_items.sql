CREATE TABLE
    if not exists master.subscription_plan_items (
        record_id SERIAL PRIMARY KEY,
        plan_id INT NOT NULL REFERENCES master.subscription_plans (record_id),
        name VARCHAR(100) NOT NULL,
        duration_months INT NOT NULL,
        currency VARCHAR(10) NOT NULL DEFAULT 'INR',
        price_per_month NUMERIC(10, 2) NOT NULL,
        base_price_per_month NUMERIC(10, 2),
        total_price NUMERIC(10, 2) NOT NULL,
        effective_saving NUMERIC(10, 2) DEFAULT 0,
        play_store_product_id TEXT UNIQUE,
        app_store_product_id TEXT UNIQUE,
        is_default BOOLEAN DEFAULT false,
        order_num INT,
        is_active BOOLEAN DEFAULT true,
        is_deleted BOOLEAN DEFAULT false,
        description TEXT,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
