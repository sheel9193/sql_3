-- Question 1
select first_name, last_name, district
from customer 
left join address
on customer.address_id = address.address_id 
where district = 'Texas';

-- Question 2
select first_name, last_name, amount
from payment 
inner join customer 
on payment.customer_id = customer.customer_id 
where amount > 6.99;

-- Quesiton 3
select first_name, last_name
from customer 
where customer_id in(
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
);

-- Quesiton 4
select customer.first_name, customer.last_name, country
from customer 
full join address 
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id 
full join country 
on city.country_id = country.country_id 
where country = 'Nepal';

-- Quesiton 5
select first_name, staff.last_name, COUNT(payment_id)
from payment 
left join staff
on payment.staff_id = staff.staff_id 
group by staff.staff_id;

-- Quesiton 6
select count(film_id), rating
from film
group by rating
order by count desc;

-- Question 7
select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by payment.customer_id, payment.amount
	having amount > 6.99
);

-- Question 8
select film_id, rental_rate
from film
where rental_rate = '0.00'
group by film_id;

