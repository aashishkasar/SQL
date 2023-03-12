use music;
# Who is the senior most employee based on job title?
select concat(first_name,' ',last_name) as senior  from employee where title='Senior General Manager';

#Which countries have the most Invoices?
select billing_country,count(billing_country) as invoice_count from invoice group by billing_country order by invoice_count desc limit 1;

#What are top 3 values of total invoice?
select billing_country, total from invoice order by total desc limit 3;

#Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money.
#Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals
select billing_country,sum(total) as sum_total from invoice group by billing_country order by sum_total desc limit 1;

#Who is the best customer? The customer who has spent the most money will be declared the best customer. 
#Write a query that returns the person who has spent the most money

select concat(c.First_Name,' ',c.Last_Name) AS BestCustomer, SUM(Unit_Price * Quantity) AS TotalSpent from Customer as  c
JOIN Invoice as  i ON c.Customer_Id = i.Customer_Id
JOIN Invoice_line as ii ON i.Invoice_Id = ii.Invoice_Id
GROUP BY c.Customer_Id
ORDER BY TotalSpent DESC
LIMIT 1;


#Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
#Return your list ordered alphabetically by email starting with A

SELECT DISTINCT employee.first_name,employee.last_name,employee.email,genre.name
FROM employee
left JOIN customer ON employee.employee_id = customer.support_rep_id
left JOIN invoice ON customer.customer_id = invoice.customer_id
left JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
left JOIN track ON invoice_line.track_id = track.track_id
left JOIN genre ON track.genre_id = genre.genre_id
where genre.name = 'Rock' order by email;

#Let's invite the artists who have written the most rock music in our dataset. 
# Write a query that returns the Artist name and total track count of the top 10 rock bands
SELECT artist.name,count(track.track_id) as track_count
FROM artist
left JOIN album ON album.artist_id = artist.artist_id
left JOIN track ON album.album_id = track.album_id
left JOIN genre ON track.genre_id = genre.genre_id
where genre.name = 'rock' group by artist.name order by track_count desc limit 10;

#Return all the track names that have a song length longer than the average song length. 
#Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first

select name,milliseconds from track where milliseconds >= (select avg(milliseconds) from track) order by  milliseconds desc;

#Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent
SELECT concat(c.First_Name,' ',c.Last_Name) AS CustomerName, ar.Name AS ArtistName, SUM(ii.Unit_Price * ii.Quantity) AS TotalSpent
FROM Customer c
JOIN Invoice as i ON c.Customer_Id = i.Customer_Id
JOIN Invoice_line as ii ON i.Invoice_Id = ii.Invoice_Id
JOIN Track as t ON ii.Track_Id = t.Track_Id
JOIN Album as al ON t.Album_Id = al.Album_Id
JOIN Artist as ar ON al.Artist_Id = ar.Artist_Id
GROUP BY c.Customer_Id, ar.Artist_Id
ORDER BY TotalSpent DESC;

#We want to find out the most popular music Genre for each country. 
#We determine the most popular genre as the genre with the highest amount of purchases. 
#Write a query that returns each country along with the top Genre. 
#For countries where the maximum number of purchases is shared return all Genres


WITH RECURSIVE
	sales_per_country AS(
		SELECT COUNT(*) AS purchases_per_genre, customer.country, genre.name, genre.genre_id
		FROM invoice_line
		JOIN invoice ON invoice.invoice_id = invoice_line.invoice_id
		JOIN customer ON customer.customer_id = invoice.customer_id
		JOIN track ON track.track_id = invoice_line.track_id
		JOIN genre ON genre.genre_id = track.genre_id
		GROUP BY 2,3,4
		ORDER BY 2
	),
	max_genre_per_country AS (SELECT MAX(purchases_per_genre) AS max_genre_number, country
		FROM sales_per_country
		GROUP BY 2
		ORDER BY 2)

SELECT sales_per_country.* 
FROM sales_per_country
JOIN max_genre_per_country ON sales_per_country.country = max_genre_per_country.country
WHERE sales_per_country.purchases_per_genre = max_genre_per_country.max_genre_number;


#Write a query that determines the customer that has spent the most on music for each country.
# Write a query that returns the country along with the top customer and how much they spent. 
#For countries where the top amount spent is shared, provide all customers who spent this amount

WITH RECURSIVE 
	customter_with_country AS (
		SELECT customer.customer_id,first_name,last_name ,billing_country,SUM(total) AS total_spending
		FROM invoice
		JOIN customer ON customer.customer_id = invoice.customer_id
		GROUP BY 1,2,3,4
		ORDER BY 2,3 DESC),

	country_max_spending AS(
		SELECT billing_country,MAX(total_spending) AS max_spending
		FROM customter_with_country
		GROUP BY billing_country)

SELECT cc.billing_country, cc.total_spending, concat(cc.first_name,' ',cc.last_name) as name , cc.customer_id
FROM customter_with_country cc
JOIN country_max_spending ms
ON cc.billing_country = ms.billing_country
WHERE cc.total_spending = ms.max_spending
ORDER BY 1;