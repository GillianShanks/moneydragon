DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS budgets;
DROP TABLE IF EXISTS months;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS merchants;

CREATE TABLE merchants(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE months(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  position INT
);

CREATE TABLE budgets(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  total INT,
  monthly FLOAT
);

CREATE TABLE transactions(
  id SERIAL PRIMARY KEY,
  amount INT,
  merchant_id INT REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT REFERENCES tags(id) ON DELETE CASCADE,
  month_id INT REFERENCES months(id) ON DELETE CASCADE,
  budget_id INT REFERENCES budgets(id) ON DELETE CASCADE
);
