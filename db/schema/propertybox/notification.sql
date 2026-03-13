CREATE TABLE IF NOT EXISTS propertybox.notifications (
    record_id SERIAL PRIMARY KEY,

    user_id INT NOT NULL
      REFERENCES propertybox.users(record_id) ON DELETE CASCADE,
    title TEXT,
    body TEXT,

    notification_screen VARCHAR(100),
    notification_id VARCHAR(100),

    is_active BOOLEAN DEFAULT TRUE,
    is_deleted BOOLEAN DEFAULT FALSE,

    inserted_by INT,
    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

