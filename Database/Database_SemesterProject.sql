CREATE SCHEMA IF NOT EXISTS gaming_application_database;

SET SCHEMA 'gaming_application_database';

CREATE TABLE profiles
(
    email        varchar(50) primary key not null,
    country      varchar(50)             not null,
    address      varchar(50)             not null,
    profile_name varchar(50)             not null,
    password     varchar(50)             not null,
    isAdmin      boolean                 not null
);


CREATE TABLE games
(
    game_id     serial primary key,
    title       varchar(50)   not null,
    description varchar(500)  not null,
    price       decimal(6, 2) not null
);

CREATE TABLE transactions
(
    order_id         serial primary key,
    game_id          serial        not null references games (game_id) on update cascade,
    email            varchar(50)   not null references profiles (email) on update cascade,
    date_of_purchase date          not null,
    purchase_price   decimal(6, 2) not null
);
