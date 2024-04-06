/* Discovering the gender diversity of the total clientele  */

SELECT sb.Gender, COUNT(sb.Gender)
FROM shopping_behavior_updated sb
GROUP BY sb.Gender
ORDER BY avg(sb.Age) DESC

/* Discovering the age diversity of the total clientele  */

SELECT sb.Gender, avg(sb.Age)
FROM shopping_behavior_updated sb
GROUP BY sb.Gender
ORDER BY avg(sb.Age) DESC

/*  */

