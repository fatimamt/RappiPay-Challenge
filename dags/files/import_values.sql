-- Import data from csv
COPY sd254_users
FROM '/var/lib/postgresql/data/pgdata/sd254_users.csv'
DELIMITER ','
CSV HEADER;

COPY sd254_cards
FROM '/var/lib/postgresql/data/pgdata/sd254_cards.csv'
DELIMITER ','
CSV HEADER;

COPY credit_card_transactions
FROM '/var/lib/postgresql/data/pgdata/User0_credit_card_transactions.csv'
DELIMITER ','
CSV HEADER;