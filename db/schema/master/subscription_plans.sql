DO $$ BEGIN
    CREATE TYPE master.plan_type AS ENUM ('free', 'paid');
EXCEPTION WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
    CREATE TYPE master.billing_period AS ENUM ('monthly', 'quarterly', 'half_yearly', 'yearly');
EXCEPTION WHEN duplicate_object THEN null;
END $$;

CREATE TABLE
    if not exists master.subscription_plans (
        record_id SERIAL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        code VARCHAR(50) UNIQUE NOT NULL,
        plan_type master.plan_type NOT NULL DEFAULT 'paid',
        tagline VARCHAR(250),
        price NUMERIC(10, 2) NOT NULL DEFAULT 0,
        currency VARCHAR(10) NOT NULL DEFAULT 'INR',
        billing_period master.billing_period,
        is_free BOOLEAN DEFAULT false,
        is_recommended BOOLEAN DEFAULT false,
        listing_limit INT,
        enquiry_limit INT,
        boost_per_listing INT DEFAULT 0,
        agent_networking BOOLEAN DEFAULT false,
        agent_stories BOOLEAN DEFAULT false,
        video_profile BOOLEAN DEFAULT false,
        features JSONB,
        cta_label VARCHAR(50),
        play_store_product_id TEXT UNIQUE,
        app_store_product_id TEXT UNIQUE,
        order_num INT,
        is_active BOOLEAN DEFAULT true,
        is_deleted BOOLEAN DEFAULT false,
        description TEXT,
        inserted_by INT,
        insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_by INT,
        update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
