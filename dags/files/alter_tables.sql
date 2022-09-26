-- Set keys for sd254_users
ALTER TABLE sd254_users 
ADD PRIMARY KEY (card_user);

-- Set keys for sd254_cards
ALTER TABLE sd254_cards
ADD PRIMARY KEY (card_number);

ALTER TABLE sd254_cards
ADD CONSTRAINT fk_cards
FOREIGN KEY (card_user)
REFERENCES sd254_users(card_user)
ON DELETE CASCADE;

-- Set keys for credit_card_transactions
ALTER TABLE credit_card_transactions
ADD COLUMN ID SERIAL PRIMARY KEY;

ALTER TABLE credit_card_transactions
ADD CONSTRAINT fk_transaction
FOREIGN KEY (card_number)
REFERENCES sd254_cards(card_number)
ON DELETE CASCADE;