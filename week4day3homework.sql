--1. List all customers who live in Texas (use JOINs)
SELECT * 
FROM address


SELECT count(DISTINCT customer.customer_id)
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
WHERE address.district LIKE 'Texas'

-- 5 customers from texas

--2. Get all payments above $6.99 with the Customer's Full Name

SELECT DISTINCT first_name,last_name
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99


--3. Show all customers names who have made payments over $175(usesubqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id
in (
    Select DISTINCT payment.customer_id
    FROM payment
    where amount > 175
)
--- Mary Smith, Peter Menard, Douglas Graf

--4. List all customers that live in Nepal (use the city table)

SELECT first_name, last_name, country, city
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city 
ON address.city_id = city.city_id
INNER JOIN country 
ON city.country_id = country.country_id
WHERE country.country = 'Nepal'

-- Kevin Schuler


--5. Which staff member had the most transactions?
SELECT count(rental_id), staff_id
FROM rental
GROUP BY staff_id; 



SELECT first_name, last_name, staff_id
FROM staff
GROUP BY staff_id; 

--- Mike Hillyer with 8040


--6. How many movies of each rating are there?


SELECT count(film_id), rating 
FROM film 
GROUP BY rating

--NC 17. 209
--G. 178
--PG-13. 224
--R. 196

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT first_name, last_name
From customer
where customer_id IN(
    select customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING count(payment_id) = 1
)



--8. How many free rentals did our stores give away?
SELECT COUNT(payment.rental_id)
FROM payment
WHERE amount = 0


-- 0 free rentals


