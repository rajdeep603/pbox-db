CREATE TABLE propertybox.user_connection_requests (
  record_id         SERIAL PRIMARY KEY,
  sender_id         INTEGER NOT NULL REFERENCES propertybox.users(record_id) ON DELETE CASCADE,
  receiver_id       INTEGER NOT NULL REFERENCES propertybox.users(record_id) ON DELETE CASCADE,
  status            SMALLINT NOT NULL DEFAULT 1,   -- 1 = pending, 2 = accepted, 3 = declined
  is_active         BOOLEAN DEFAULT true,
  is_deleted        BOOLEAN DEFAULT false,
  inserted_by       INTEGER,
  insert_date_time  TIMESTAMP(6) DEFAULT now(),
  updated_by        INTEGER,
  update_date_time  TIMESTAMP(6) DEFAULT now(),
  CONSTRAINT chk_sender_not_receiver CHECK (sender_id <> receiver_id)
);

-- One active request per direction; allows re-sending after a soft-deleted (withdrawn) one
CREATE UNIQUE INDEX uq_ucr_pair_active
  ON propertybox.user_connection_requests (sender_id, receiver_id)
  WHERE is_deleted = false;

-- Fast lookups for the two panels
CREATE INDEX idx_ucr_receiver_status ON propertybox.user_connection_requests (receiver_id, status);
CREATE INDEX idx_ucr_sender_status   ON propertybox.user_connection_requests (sender_id, status);
