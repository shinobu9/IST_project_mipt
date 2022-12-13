PRAGMA foreign_keys=on;
PRAGMA encoding="UTF-8";
CREATE TABLE countries( id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE people(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, date_of_birth INTEGER NOT NULL, name TEXT NOT NULL);
CREATE TABLE type_of_art(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL);
CREATE TABLE city(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, country_id INTEGER NOT NULL, FOREIGN KEY(country_id) REFERENCES countries(id));
CREATE TABLE museums(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, date_of_found INTEGER NOT NULL, city TEXT NOT NULL, city_id INTEGER NOT NULL, FOREIGN KEY(city_id) REFERENCES city(id));
CREATE TABLE artworks(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, type_id INTEGER NOT NULL, people_id INTEGER NOT NULL, date_of_creation INTEGER NOT NULL, museum_id INTEGER NOT NULL, FOREIGN KEY (people_id) REFERENCES people(id), FOREIGN KEY (type_id) REFERENCES type_of_arts(id), FOREIGN KEY (museum_id) REFERENCES museums(id));
CREATE TABLE arts_people(art_id INTEGER NOT NULL, people_id INTEGER NOT NULL, PRIMARY KEY(art_id, people_id), FOREIGN KEY (art_id) REFERENCES artworks(id), FOREIGN KEY(people_id) REFERENCES people(id));
CREATE TABLE country_person( country_id INTEGER NOT NULL, people_id INTEGER NOT NULL, PRIMARY KEY(country_id, people_id), FOREIGN KEY(country_id) REFERENCES countries(id), FOREIGN KEY(people_id) REFERENCES people(id));
CREATE TABLE IF NOT EXISTS "date_of_death"(people_id INTEGER NOT NULL PRIMARY KEY , date INTEGER, FOREIGN KEY(people_id) REFERENCES people(id));
