-- Drop tables if exist
DROP TABLE IF EXISTS credit_card_transactions;
DROP TABLE IF EXISTS sd254_cards;
DROP TABLE IF EXISTS sd254_users;

-- Drop types if exist
DROP TYPE IF EXISTS months;
DROP TYPE IF EXISTS gender;
DROP TYPE IF EXISTS card_brand;
DROP TYPE IF EXISTS card_type;
DROP TYPE IF EXISTS chip;
DROP TYPE IF EXISTS question;
DROP TYPE IF EXISTS use_chip;

-- Prepare datatypes
CREATE TYPE months AS ENUM ('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12');
CREATE TYPE gender AS ENUM ('Male', 'Female');
CREATE TYPE card_brand AS ENUM ('Amex', 'Discover', 'Visa', 'Mastercard');
CREATE TYPE card_type AS ENUM ('Debit', 'Debit (Prepaid)', 'Credit');
CREATE TYPE chip AS ENUM ('YES', 'NO');
CREATE TYPE question AS ENUM ('Yes', 'No');
CREATE TYPE use_chip AS ENUM ('Chip Transaction', 'Online Transaction', 'Swipe Transaction');

-- Create tables
CREATE TABLE sd254_users(
    card_user INTEGER NOT NULL,
    person VARCHAR(300) NOT NULL,
    current_age SMALLINT,
    retirement_age SMALLINT,
    birth_year SMALLINT,
    birth_month months,
    gender gender,
    address_user VARCHAR(300),
    apartment VARCHAR(10),
    city VARCHAR(100),
    state_user VARCHAR(5),
    zipcode INTEGER,
    latitude FLOAT,
    longitude FLOAT,
    income_percapita FLOAT,
    income_yearly FLOAT,
    total_debt FLOAT,
    fico_score INTEGER,
    num_creditcard SMALLINT
);

CREATE TABLE sd254_cards(
    card_user INTEGER NOT NULL,
    card_id INTEGER NOT NULL,
    brand card_brand,
    card_type card_type,
    card_number VARCHAR(18) NOT NULL,
    expires VARCHAR(7),
    cvv INTEGER,
    chip chip,
    cards_issued INTEGER,
    credit_limit VARCHAR,
    open_date VARCHAR(7),
    pin_changed SMALLINT,
    on_darkweb question
);

COMMENT ON COLUMN sd254_cards.chip is 'Column answers the question Has Chip?';
COMMENT ON COLUMN sd254_cards.pin_changed is 'Year PIN last changed';
COMMENT ON COLUMN sd254_cards.on_darkweb is 'Column answers the question Is card on Dark Web?';

CREATE TABLE credit_card_transactions(
    card_user INTEGER NOT NULL,
    card_trans INTEGER,
    year_trans SMALLINT,
    month_trans months,
    day_trans SMALLINT,
    time_trans TIME,
    amount VARCHAR,
    use_chip use_chip,
    card_number VARCHAR(18) NOT NULL,
    city_trans VARCHAR(100),
    state_trans VARCHAR(100),
    zipcode_trans INTEGER,
    mcc INTEGER,
    errors VARCHAR(200),
    fraud question
);
