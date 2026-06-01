CREATE DATABASE analytics_db;

USE analytics_db;

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(255),
    cuisines VARCHAR(255),
    location_id INT,

    FOREIGN KEY (location_id)
    REFERENCES locations(location_id)
    ON DELETE CASCADE
);

drop table restaurants;

CREATE TABLE ratings (
    restaurant_id INT,
    user_id INT,
    rating FLOAT,

    PRIMARY KEY (restaurant_id, user_id)
);

drop table ratings;

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(200)
);


CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(200),
    age INT,
    city VARCHAR(100)
);

CREATE TABLE ratings (
    restaurant_id INT,
    user_id INT,
    rating FLOAT,

    PRIMARY KEY (restaurant_id, user_id),
    FOREIGN KEY (restaurant_id)
    REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);


INSERT INTO locations VALUES
(1, 'Ahmedabad'),
(2, 'Mumbai'),
(3, 'Delhi');


INSERT INTO restaurants VALUES
(101, 'Spice Hub', 'Indian', 1),
(102, 'Pizza Town', 'Italian', 2),
(103, 'Dragon House', 'Chinese', 3);


INSERT INTO users VALUES
(1, 'Rahul', 21, 'Ahmedabad'),
(2, 'Priya', 22, 'Mumbai'),
(3, 'Amit', 20, 'Delhi');


INSERT INTO ratings VALUES
(101, 1, 4.5),
(102, 2, 4.0),
(103, 3, 5.0);


SELECT * FROM locations;
SELECT * FROM restaurants;

SELECT 
    r.restaurant_name,
    u.user_name,
    ra.rating
FROM ratings ra
JOIN restaurants r
ON ra.restaurant_id = r.restaurant_id
JOIN users u
ON ra.user_id = u.user_id; 





