CREATE TABLE IF NOT EXISTS propertybox.communities (
    community_id SERIAL PRIMARY KEY,

    community_name VARCHAR(255) NOT NULL,
    community_location TEXT,

    is_deleted BOOLEAN DEFAULT FALSE,

    insert_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_communities_community_name ON propertybox.communities(community_name);
