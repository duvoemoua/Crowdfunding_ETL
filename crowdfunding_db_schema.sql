--Drop table if exists
DROP TABLE IF EXISTS campaign;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS subcategory;
DROP TABLE IF EXISTS contacts;

--CREATE CAMPAIGN TABLE
CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" VARCHAR   NOT NULL,
    "description" VARCHAR   NOT NULL,
    "goal" numeric   NOT NULL,
    "pledged" numeric   NOT NULL,
    "outcome" VARCHAR   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" VARCHAR   NOT NULL,
    "currency" VARCHAR   NOT NULL,
    "launched_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category" VARCHAR   NOT NULL,
    "subcategory" VARCHAR   NOT NULL,
    "category_id" VARCHAR   NOT NULL,
    "subcategory_id" VARCHAR   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id","contact_id","company_name","category","subcategory","category_id","subcategory_id"
     )
);

--CREATE CATEGORY TABLE
CREATE TABLE "category" (
    "category_id" VARCHAR   NOT NULL,
    "category" VARCHAR   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id","category"
     )
);

--CREATE SUBCATEGORY TABLE
CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR   NOT NULL,
    "subcategory" VARCHAR   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id","subcategory"
     )
);

--CREATE CONTACTS TABLE
CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "email" VARCHAR   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id","first_name","last_name","email"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category" FOREIGN KEY("category")
REFERENCES "category" ("category");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_subcategory_id" FOREIGN KEY("subcategory", "subcategory_id")
REFERENCES "subcategory" ("subcategory", "subcategory_id");

ALTER TABLE "category" ADD CONSTRAINT "fk_category_category_id" FOREIGN KEY("category_id")
REFERENCES "campaign" ("category_id");

ALTER TABLE "contacts" ADD CONSTRAINT "fk_contacts_contact_id" FOREIGN KEY("contact_id")
REFERENCES "campaign" ("contact_id");