create extension if not exists citext;

CREATE TABLE IF NOT EXISTS users (
  id SERIAL NOT NULL PRIMARY KEY,
  about TEXT DEFAULT NULL,
  fullname TEXT DEFAULT NULL,
  nickname CITEXT COLLATE "ucs_basic" UNIQUE,
  email CITEXT UNIQUE
);

CREATE TABLE IF NOT EXISTS forums (
  id SERIAL NOT NULL PRIMARY KEY,
  posts INTEGER DEFAULT 0,
  slug CITEXT COLLATE "ucs_basic" UNIQUE,
  threads INTEGER DEFAULT 0,
  title TEXT NOT NULL,
  nickname CITEXT COLLATE "ucs_basic" REFERENCES "users"(nickname) ON DELETE CASCADE
);