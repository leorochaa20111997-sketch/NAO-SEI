CREATE TABLE members (id TEXT PRIMARY KEY, email TEXT NOT NULL UNIQUE, label TEXT NOT NULL, created_at TEXT NOT NULL);
--> statement-breakpoint
CREATE TABLE transactions (id TEXT PRIMARY KEY, description TEXT NOT NULL, amount_cents INTEGER NOT NULL CHECK(amount_cents>=0), date TEXT NOT NULL, type TEXT NOT NULL CHECK(type IN ('income','expense','transfer')), owner TEXT NOT NULL, bank TEXT NOT NULL, category TEXT NOT NULL, source TEXT NOT NULL DEFAULT 'manual', account_id TEXT, provider_id TEXT, status TEXT NOT NULL DEFAULT 'POSTED', ignored INTEGER NOT NULL DEFAULT 0, custom INTEGER NOT NULL DEFAULT 0, deleted INTEGER NOT NULL DEFAULT 0, revision INTEGER NOT NULL DEFAULT 1, updated_at TEXT NOT NULL, UNIQUE(account_id, provider_id));
--> statement-breakpoint
CREATE INDEX transactions_date ON transactions(date);
--> statement-breakpoint
CREATE TABLE budgets (category TEXT PRIMARY KEY, amount_cents INTEGER NOT NULL CHECK(amount_cents>=0));
--> statement-breakpoint
CREATE TABLE connections (id TEXT PRIMARY KEY, member_id TEXT NOT NULL REFERENCES members(id), bank TEXT NOT NULL, status TEXT NOT NULL, last_synced TEXT, provider_updated TEXT, consent_expires TEXT, error TEXT, sync_locked_until TEXT);
--> statement-breakpoint
CREATE TABLE accounts (id TEXT PRIMARY KEY, connection_id TEXT NOT NULL REFERENCES connections(id), name TEXT NOT NULL, type TEXT NOT NULL, balance_cents INTEGER NOT NULL, currency TEXT NOT NULL, updated_at TEXT NOT NULL);
--> statement-breakpoint
CREATE TABLE sync_jobs (id TEXT PRIMARY KEY, connection_id TEXT NOT NULL REFERENCES connections(id), account_id TEXT NOT NULL, cursor TEXT, started_at TEXT NOT NULL, complete INTEGER NOT NULL DEFAULT 0);
--> statement-breakpoint
CREATE TABLE settings (key TEXT PRIMARY KEY, value TEXT NOT NULL);
