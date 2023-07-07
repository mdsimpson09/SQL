DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE regions (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL 
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  category_name TEXT NOT NULL
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY, 
  username VARCHAR(15) UNIQUE NOT NULL,
  password VARCHAR(20) NOT NULL,
  preferred_region TEXT NOT NULL 
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL, 
  user_id INTEGER FOREIGN KEY REFERENCES users(id),
  region_id INTEGER FOREIGN KEY REFERENCES regions(id),
  category_id INTEGER FOREIGN KEY REFERENCES categories(id)
);