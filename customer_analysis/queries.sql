/* Creating the dataset table */

CREATE TABLE shopping_behavior.customer_orders(
	customer_id SMALLINT UNSIGNED,
   	age TINYINT UNSIGNED,
	gender VARCHAR(20),
    	item_sub_cat VARCHAR(20),
   	category VARCHAR(20),
    	purchase_total SMALLINT UNSIGNED,
    	location VARCHAR(20),
   	 size VARCHAR(20),
  	color VARCHAR(20),
    	season ENUM('spring', 'summer', 'fall', 'winter'),
  	review_rating float(2,1),
    	subscription_status ENUM('yes', 'no'),
  	shipping_type VARCHAR(20),
    	discount_applied ENUM('yes', 'no'),
  	promo_code_applied ENUM('yes', 'no'),
  	previous_orders SMALLINT UNSIGNED,
    	payment_method VARCHAR(20),
   	purchase_frequency VARCHAR(20),
    
    CONSTRAINT unique_id PRIMARY KEY (customer_id)
    )

	
/* Filling in the new table with data from the original dataset */
	
INSERT INTO customer_orders (
	customer_id,
	age,
	gender,
	item_sub_cat,
	category,
	purchase_total,
	location,
	size,
	color,
	season,
	review_rating,
	subscription_status,
	shipping_type,
	discount_applied,
	promo_code_applied,
	previous_orders,
	payment_method,
	purchase_frequency
)

SELECT customer_id,
	age,
	gender,
	items_purchased,
	category,
	purchase_amount,
	location,
	size,
	color,
	season,
	review_rating,
	subscription_status,
	shipping_type,
	discount_applied,
	promo_code_used,
	previous_purchases,
	payment_method,
	frequency_of_purchases
FROM sb_clean

	
/* Discovering the clientele gender and age diversity */

SELECT gender, COUNT(gender) total_customers, ROUND(avg(age), 1) avg_age
FROM customer_orders
GROUP BY gender
ORDER BY total_customers DESC

	
/* Finding the revenue and number of customers for each state */
	
SELECT location, COUNT(customer_id) customer_count, SUM(purchase_total) state_revenue
FROM customer_orders
GROUP BY location
ORDER BY state_revenue DESC
LIMIT 10


/* Finding customer favorite products */
	
SELECT item_sub_cat product, category, (item_sub_cat) quantity_sold, SUM(purchase_total) item_revenue
FROM customer_orders
GROUP BY product, category
ORDER BY item_revenue DESC
LIMIT 10

-----------------------------------------------------------------------------------------------------------
/* work in process */
	
/* Creating a view to get the average product review score across all categories */
	
CREATE VIEW avg_overall_rating (review_rating) 
AS
SELECT ROUND(AVG(review_rating), 2)
FROM customer_orders

	
/*  */
	
SELECT item_sub_cat product, ROUND(AVG(review_rating), 2) avg_rating
FROM customer_orders
GROUP BY item_sub_cat
ORDER BY avg_rating DESC
LIMIT 10


/*  */
	
SELECT ROUND(AVG(review_rating), 2) avg_overall_rating
FROM customer_orders
ORDER BY avg_rating DESC

	
/*  */
	
SELECT shipping_type, COUNT(shipping_type) shipping_total
FROM customer_orders
GROUP BY shipping_type
ORDER BY shipping_total DESC

	
/*  */
	
SELECT COUNT(previous_orders) '10+_orders_customers'
FROM customer_orders
WHERE previous_orders > 10
ORDER BY previous_orders DESC
