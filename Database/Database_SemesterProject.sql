CREATE SCHEMA IF NOT EXISTS gaming_application_database;

SET SCHEMA 'gaming_application_database';

--USERS TABLE
CREATE TABLE "user"
(
    email     varchar(50) primary key not null,
    country   varchar(50)             not null,
    address   varchar(50)             not null,
    user_name varchar(50)             not null,
    "password"  varchar(50)             not null,
    isAdmin   boolean                 not null
);
--USERS TABLE END

--GAMES TABLES
CREATE TABLE game
(
    game_id serial primary key,
    title   varchar(50)   not null,
    price   decimal(6, 2) not null
);

CREATE TABLE description
(
    game_id     serial primary key references game (game_id),
    description varchar(500)
);

CREATE TABLE genre
(
    game_id serial references game (game_id),
    genre   varchar(50) not null,
    primary key (game_id, genre)
);
--GAMES TABLES END

--TRANSACTION TABLES
CREATE TABLE transaction
(
    transaction_id   serial primary key,
    email            varchar(50) not null references "user" (email) on update cascade,
    date_of_purchase date        not null
);

CREATE TABLE game_in_transaction
(
    game_id         serial references game (game_id),
    transaction_id  serial references transaction (transaction_id),
    purchased_price decimal(6, 2) not null,
    primary key (game_id, transaction_id)
);
--TRANSACTION TABLES END


-- SELECT git.game_id
-- FROM games
--          inner join games_in_transaction git on games.game_id = git.game_id
-- WHERE title like '%alo%'
-- group by git.game_id;
--
-- SELECT gt.game_id, g.title, d.description, genre, gt.purchased_price
-- FROM games_in_transaction gt
--          join transactions t on t.transaction_id = gt.transaction_id
--          join games g on gt.game_id = g.game_id
--          join descriptions d on g.game_id = d.game_id
-- join genres g2 on g.game_id = g2.game_id
-- WHERE email = 'kevoboc@yahoo.com'
-- GROUP BY gt.game_id, g.title, d.description, genre, purchased_price;


