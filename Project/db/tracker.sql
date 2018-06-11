DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE users;
DROP TABLE tags;


CREATE TABLE users(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE merchants(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  amount DECIMAL(18,2),
  description VARCHAR(255),
  tag_id INT4 REFERENCES tags(id),
  merchant_id INT4 REFERENCES merchants(id),
  user_id INT4 REFERENCES users(id),
  date DATE
);