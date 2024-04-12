/* Creating the dataset table */

CREATE TABLE shopping_behavior.customer_orders
	(customer_id SMALLINT UNSIGNED,
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

SELECT
customer_id,
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

/* Discovering the gender diversity of the total clientele  */

SELECT co.gender, COUNT(co.gender)
FROM customer_orders co
GROUP BY co.gender
ORDER BY avg(co.age) DESC

/* Discovering the age diversity of the total clientele  */

SELECT co.gender, avg(co.age)
FROM customer_orders co
GROUP BY co.gender
ORDER BY avg(co.age) DESC

/*  */

