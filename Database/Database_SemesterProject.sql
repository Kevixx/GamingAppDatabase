CREATE SCHEMA IF NOT EXISTS gaming_application_database;

SET SCHEMA 'gaming_application_database';

--USERS TABLE
CREATE TABLE users
(
    email        varchar(50) primary key not null,
    country      varchar(50)             not null,
    address      varchar(50)             not null,
    profile_name varchar(50)             not null,
    password     varchar(50)             not null,
    isAdmin      boolean                 not null
);
--USERS TABLE END

--GAMES TABLES
CREATE TABLE games
(
    game_id serial primary key,
    title   varchar(50)   not null,
    price   decimal(6, 2) not null
);

CREATE TABLE descriptions
(
    game_id     serial primary key references games (game_id),
    description varchar(500)
);

CREATE TABLE genres
(
    game_id serial references games (game_id),
    genre   varchar(50) not null,
    primary key (game_id, genre)
);
--GAMES TABLES END

--TRANSACTION TABLES
CREATE TABLE transactions
(
    order_id         serial primary key,
    email            varchar(50)   not null references users (email) on update cascade,
    date_of_purchase date          not null,
    purchased_price  decimal(6, 2) not null
);

CREATE TABLE games_in_transaction
(
    game_id  serial references games(game_id),
    order_id serial references transactions (order_id),
    primary key (game_id, order_id)
);
--TRANSACTION TABLES END





