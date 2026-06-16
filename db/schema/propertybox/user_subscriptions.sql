DO $$ BEGIN
    CREATE TYPE propertybox.subscription_status AS ENUM ('active', 'expired', 'cancelled', 'pending');
EXCEPTION WHEN duplicate_object THEN null;
END $$;

CREATE TABLE
    if not exists propertybox.user_subscriptions (
        record_id SERIAL PRIMARY KEY,
        user_id INT NOT NULL REFERENCES propertybox.users (record_id),
        plan_id INT REFERENCES master.subscription_plans (record_id),
        plan_item_id INT REFERENCES master.subscription_plan_items (record_id),
        status propertybox.subscription_status NOT NULL DEFAULT 'pending',
        start_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        end_date TIMESTAMP,
        auto_renew BOOLEAN DEFAULT false,
        pan_number VARCHAR(20),
        aadhaar_number VARCHAR(20),
        rera_number VARCHAR(50),
        profile_video_url TEXT,
        bio TEXT,
        is_active BOOLEAN DEFAULT true,
        is_deleted BOOLEAN DEFAULT false,
        description TEXT,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
