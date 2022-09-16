USE sakila;

-- 1. Write a query to display for each store its store ID, city, and country.
SELECT s.store_id AS 'store_id', c.city AS 'city', b.country AS 'country'
FROM store s
JOIN address a
ON s.address_id = a.address_id
JOIN city c
ON a.city_id = c.city_id
JOIN country b
ON c.country_id = b.country_id
GROUP BY s.store_id;

-- 2. Write a query to display how much business, in dollars, each store brought in.
SELECT s.store_id AS 'store_id', SUM(p.amount) AS 'Amount($)'
FROM store s
JOIN staff f
ON s.store_id = f.staff_id
JOIN payment p
ON f.staff_id = p.staff_id
GROUP BY store_id;

-- 3. Which film categories are longest?
SELECT c.name AS 'film_name', AVG(i.length) AS 'average_length'
FROM category c
JOIN film_category f
ON c.category_id = f.category_id
JOIN film i
ON f.film_id = i.film_id
GROUP BY c.name
ORDER BY AVG(i.length) DESC;


-- 4. Display the most frequently rented movies in descending order.
SELECT COUNT(f.film_id) AS frequency_rent, f.title
FROM rental r
JOIN inventory i
USING (inventory_id)
JOIN film f
USING (film_id)
GROUP BY f.title
ORDER BY frequency_rent DESC
LIMIT 1;


-- 5. List the top five genres in gross revenue in descending order.
SELECT c.name AS 'genres', SUM(p.amount) AS 'gross_revenue'
FROM category c
JOIN film_category f
ON c.category_id = f.category_id
JOIN inventory i
ON f.film_id  = i.film_id
JOIN rental r
ON i.inventory_id = r.inventory_id
JOIN payment p
ON r.rental_id = p.rental_id
GROUP BY c.name;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?
SELECT f.title AS 'film_name', COUNT(s.store_id) AS 'available'
FROM film f
JOIN inventory i
ON f.film_id = i.film_id
JOIN store s
ON i.store_id = s.store_id
WHERE f.title = 'ACADEMY DINOSAUR' AND s.store_id = 1
GROUP BY f.title;


-- 7. Get all pairs of actors that worked together.
SELECT a1.actor_id AS 'Actor_1', a2.actor_id AS 'Actor_2', a1.film_id
FROM film_actor a1
JOIN film_actor a2
ON (a1.actor_id <> a2.actor_id) AND (a1.film_id = a2.film_id)
ORDER BY a1.actor_id;


-- 8. Get all pairs of customers that have rented the same film more than 3 times.


-- 9. For each film, list actor that has acted in more films.

