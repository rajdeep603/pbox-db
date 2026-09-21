CREATE TABLE IF NOT EXISTS propertybox.crm_users (
    crm_user_id SERIAL PRIMARY KEY,

    user_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(255) UNIQUE NOT NULL,
    user_password VARCHAR(255) NOT NULL,

    is_deleted BOOLEAN DEFAULT FALSE,

    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_crm_users_user_email ON propertybox.crm_users(user_email);
