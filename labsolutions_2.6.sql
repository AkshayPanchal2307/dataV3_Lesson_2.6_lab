USE Sakila
-- In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT * FROM sakila.actor;
SELECT DISTINCT last_name FROM sakila.actor;
SELECT last_name FROM sakila.actor 
GROUP BY last_name
HAVING COUNT(*) < 2;

-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT last_name FROM sakila.actor 
GROUP BY last_name
HAVING COUNT(*) > 1;

-- Using the rental table, find out how many rentals were processed by each employee.
SELECT * FROM sakila.rental;
SELECT count(staff_id) FROM sakila.rental
GROUP BY staff_id;


-- Using the film table, find out how many films were released each year.
select * FROM sakila.film;
Select count(*),release_year from film 
group by release_year;


-- Using the film table, find out for each rating how many films were there.
SELECT * FROM sakila.film;
SELECT count(*), rating from film
GROUP BY rating;


-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT * FROM sakila.film;
SELECT AVG(length), rating from film
GROUP BY rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?
SELECT * FROM sakila.film;
SELECT (AVG(length)/60) as mean_time, rating FROM sakila.film
GROUP BY rating 
Having mean_time > 2.00;


-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT * FROM sakila.film;
SELECT title, length FROM sakila.film
rank() OVER (ORDER BY count(*) ASC) as Ranking,
Group by title, length, rank;









