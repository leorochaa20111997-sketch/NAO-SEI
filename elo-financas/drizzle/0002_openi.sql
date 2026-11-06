ALTER TABLE connections ADD COLUMN provider_item_id TEXT;
--> statement-breakpoint
CREATE TABLE connection_attempts (id TEXT PRIMARY KEY, member_id TEXT NOT NULL REFERENCES members(id), created_at TEXT NOT NULL, expires_at TEXT NOT NULL, consumed INTEGER NOT NULL DEFAULT 0);
