CREATE SCHEMA IF NOT EXISTS gaming_application_database;

SET SCHEMA 'gaming_application_database';

--USERS TABLE
--Create user table
CREATE TABLE "user"
(
    email      varchar(50) primary key not null,
    country    varchar(50)             not null,
    address    varchar(50)             not null,
    user_name  varchar(50)             not null,
    "password" varchar(50),
    isAdmin    boolean                 not null
);

--GAMES TABLES
--Create a game table
CREATE TABLE game
(
    game_id serial primary key,
    title   varchar(50)   not null,
    price   decimal(6, 2) not null
);

--Create a description table
CREATE TABLE description
(
    game_id     serial primary key references game (game_id) on delete cascade,
    description varchar(1500)
);

--Create genre table
CREATE TABLE genre
(
    game_id serial references game (game_id) on delete cascade,
    genre   varchar(50) not null,
    primary key (game_id, genre)
);


--TRANSACTION TABLES
--Create transaction table
CREATE TABLE transaction
(
    transaction_id   serial primary key,
    email            varchar(50) not null references "user" (email) on update cascade,
    date_of_purchase date        not null
);

--Create a game in a transaction table
CREATE TABLE game_in_transaction
(
    game_id         serial references game (game_id) on update cascade,
    transaction_id  serial references transaction (transaction_id),
    purchased_price decimal(6, 2) not null,
    primary key (game_id, transaction_id)
);
