CREATE TABLE
    if not exists master.user_subscriptions (
        record_id SERIAL PRIMARY KEY,
        user_id TEXT NOT NULL,
        is_active BOOLEAN DEFAULT true,
        subscription_type_pl_id INT REFERENCES master.picklist (record_id),
        subscription_status_pl_id INT REFERENCES master.picklist (record_id),
            razorpay_subscription_id TEXT UNIQUE,

     start_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    end_date TIMESTAMP,
    next_billing_date TIMESTAMP, 
        is_deleted BOOLEAN DEFAULT false,
        description TEXT,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );