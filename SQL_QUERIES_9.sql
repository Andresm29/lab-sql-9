# In this lab, you will be using the Sakila database of movie rentals.
USE sakila;

# Create a table rentals_may to store the data from rental table with information for the month of May.
DROP TABLE IF EXISTS rentals_may;
CREATE TABLE rentals_may (
    rental_id INT NOT NULL,
    rental_date DATETIME NOT NULL,
    inventory_id MEDIUMINT UNSIGNED NOT NULL,
    customer_id SMALLINT UNSIGNED NOT NULL,
    return_date DATETIME DEFAULT NULL,
    staff_id TINYINT UNSIGNED NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (rental_id)
);

# Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
INSERT INTO rentals_may
SELECT *
FROM rental
WHERE MONTH(rental_date) = 5;

SELECT 
    *
FROM
    rentals_may;

# Create a table rentals_june to store the data from rental table with information for the month of June.
CREATE TABLE rentals_june (
    rental_id INT NOT NULL,
    rental_date DATETIME NOT NULL,
    inventory_id MEDIUMINT UNSIGNED NOT NULL,
    customer_id SMALLINT UNSIGNED NOT NULL,
    return_date DATETIME DEFAULT NULL,
    staff_id TINYINT UNSIGNED NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (rental_id)
);

# Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
INSERT INTO rentals_june
SELECT *
FROM rental
WHERE MONTH(rental_date) = 6;

# Check the number of rentals for each customer for May.
SELECT 
    customer_id, COUNT(*) AS num_rentals_may
FROM
    rentals_may
GROUP BY customer_id;

# Check the number of rentals for each customer for June.
SELECT 
    customer_id, COUNT(*) AS num_rentals_june
FROM
    rentals_june
GROUP BY customer_id;