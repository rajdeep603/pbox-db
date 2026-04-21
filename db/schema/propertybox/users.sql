CREATE TABLE IF NOT EXISTS propertybox.users (
    record_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    country_code VARCHAR(10),
    gender_pl_id INT REFERENCES master.picklist (record_id),
    date_of_birth DATE,
    qualification_pl_id INT REFERENCES master.picklist (record_id),
    user_type_pl_id INT REFERENCES master.picklist (record_id),
    is_active BOOLEAN DEFAULT true,
    is_deleted BOOLEAN DEFAULT false,
    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 
);

ALTER TABLE IF EXISTS propertybox.users
ADD COLUMN IF NOT EXISTS profile_picture_url TEXT,
ADD COLUMN IF NOT EXISTS guid VARCHAR(36) UNIQUE,
ADD COLUMN IF NOT EXISTS preferred_contact_pl_ids VARCHAR(20),
ADD COLUMN IF NOT EXISTS contact_sharing BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS notes_to_owner TEXT,
ADD COLUMN IF NOT EXISTS prefer_timeline_rent_pl_id INT REFERENCES master.picklist (record_id),
ADD COLUMN IF NOT EXISTS prefer_timeline_sell_pl_id INT REFERENCES master.picklist (record_id),
ADD COLUMN IF NOT EXISTS age_range_pl_id INT REFERENCES master.picklist (record_id),
ADD COLUMN IF NOT EXISTS income_slab_pl_id  INT REFERENCES master.picklist (record_id),
ADD COLUMN IF NOT EXISTS budget_range_sell_pl_ids VARCHAR(20),
ADD COLUMN IF NOT EXISTS budget_range_rent_pl_ids VARCHAR(20),
ADD COLUMN IF NOT EXISTS latitude DECIMAL(10,7),
ADD COLUMN IF NOT EXISTS longitude DECIMAL(10,7),
ALTER COLUMN budget_range_sell_pl_ids TYPE INT[],
ALTER COLUMN budget_range_rent_pl_ids TYPE INT[],
ALTER COLUMN preferred_contact_pl_ids TYPE INT[],
ADD COLUMN IF NOT EXISTS stay_in_home_pl_id INT REFERENCES master.picklist (record_id);