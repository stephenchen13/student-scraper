CREATE TABLE students (
	id INTEGER PRIMARY KEY,
	name TEXT

);

CREATE TABLE bio (
	id INTEGER PRIMARY KEY,
	students_id INTEGER,
	tagline VARCHAR(140),
	content TEXT,

);

CREATE TABLE apps (
	id INTEGER PRIMARY KEY,
	students_id INTEGER,
	name TEXT,
	link TEXT,
	description TEXT
);

CREATE TABLE social (
	id INTEGER PRIMARY KEY,
	students_id INTEGER,
	name TEXT,
	username TEXT,
	link TEXT
);