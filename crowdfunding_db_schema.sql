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
    constraint "pk_campaign" PRIMARY KEY (
        "cf_id","contact_id","company_name","category","subcategory","category_id","subcategory_id"
     )
);

--CREATE CATEGORY TABLE
CREATE TABLE "category" (
    "category_id" VARCHAR   NOT NULL,
    "category" VARCHAR   NOT NULL,
    constraint "pk_category" PRIMARY KEY (
        "category_id","category"
     )
);

--CREATE SUBCATEGORY TABLE
CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR   NOT NULL,
    "subcategory" VARCHAR   NOT NULL,
    constraint "pk_subcategory" PRIMARY KEY (
        "subcategory_id","subcategory"
     )
);

--CREATE CONTACTS TABLE
CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "email" VARCHAR   NOT NULL,
    constraint "pk_contacts" PRIMARY KEY (
        "contact_id","first_name","last_name","email"
     )
);
