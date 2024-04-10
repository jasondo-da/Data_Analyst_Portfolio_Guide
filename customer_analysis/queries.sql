/* Creating the dataset table */

CREATE TABLE shopping_behavior.sb_customer_orders
	(customer_id SMALLINT UNSIGNED,
    age TINYINT UNSIGNED,
    gender VARCHAR(20),
    item_sub_cat VARCHAR(20),
    category VARCHAR(20),
    purchase_total SMALLINT UNSIGNED,
    location VARCHAR(20),
    size ENUM('small', 'med', 'large', 'xl'),
    color VARCHAR(20),
    season ENUM('spring', 'summer', 'fall', 'winter'),
    review_rating float(2,1),
    subscription_status ENUM('yes', 'no'),
    shipping_type VARCHAR(20),
    discount_applied ENUM('yes', 'no'),
    promo_code_applied ENUM('yes', 'no'),
    previous_orders SMALLINT UNSIGNED,
    payment_method VARCHAR(20),
    purchase_frequency SMALLINT UNSIGNED,
    
    CONSTRAINT unique_id PRIMARY KEY (customer_id)
    )

/* Discovering the gender diversity of the total clientele  */

SELECT sb.gender, COUNT(sb.gender)
FROM sb_customer_orders sb
GROUP BY sb.gender
ORDER BY avg(sb.age) DESC

/* Discovering the age diversity of the total clientele  */

SELECT sb.gender, avg(sb.age)
FROM sb_customer_orders sb
GROUP BY sb.gender
ORDER BY avg(sb.age) DESC

/*  */

