CREATE SCHEMA IF NOT EXISTS gaming_application_database;

SET SCHEMA 'gaming_application_database';

CREATE DOMAIN string as varchar(50);
CREATE DOMAIN price_format as decimal(6, 2);

CREATE TABLE profiles
(
    profile_name  string primary key not null,
    first_name    string             not null,
    last_name     string             not null,
    date_of_birth date               not null,
    street_name   string             not null,
    house_number  smallint           not null,
    city          string             not null,
    zip_code      smallint           not null,
    country       string             not null,
    password      string              not null
);

CREATE TABLE emails
(
    profile_name string primary key not null references profiles (profile_name) on update cascade,
    email        string             not null check (email like '%@%.%') unique
);

CREATE TABLE games
(
    game_id     serial primary key,
    title       string       not null,
    description varchar(500) not null,
    price       price_format not null
);

CREATE TABLE transactions
(
    order_id         serial primary key,
    game_id          serial       not null references games (game_id) on update cascade,
    profile_name     string       not null references profiles (profile_name) on update cascade,
    date_of_purchase date         not null,
    purchase_price   price_format not null
);