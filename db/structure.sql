CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "shops" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "shopify_domain" varchar NOT NULL, "shopify_token" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "token_set" json);
CREATE TABLE sqlite_sequence(name,seq);
CREATE UNIQUE INDEX "index_shops_on_shopify_domain" ON "shops" ("shopify_domain");
CREATE TABLE IF NOT EXISTS "product_quantities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "shopify_id" varchar, "name" varchar, "actualQuantity" integer, "minQuantity" integer DEFAULT 0, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "password_digest" varchar, "active_tenant_id" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "schema_migrations" (version) VALUES
('20200509164951'),
('20200510204359'),
('20200521155138'),
('20200521161300');


