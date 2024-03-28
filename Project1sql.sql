/* SQL Project 1 Challenge
#1.Create new schema as ecommerce 
*/
create schema ecommerce;


/*2. 
Import .csv file users_data into MySQL
(right click on ecommerce schema -> Table Data import Wizard -> Give path of the file -> Next -> choose options : Create a new table , select delete if exist -> next -> next)
*/
#Ans:done virtually using mysqlworkbench


#3.Run SQL command to see the structure of table
use ecommerce;
desc users_data;


#4.Run SQL command to select first 100 rows of the database 
select * from users_data limit 100;

#5.How many distinct values exist in table for field country and language
select country from users_data;
select language from users_data;
select count(distinct country),count(distinct language) from users_data;

#6.Check whether male users are having maximum followers or female users.
select gender,sum(socialNbFollowers) as sum_social_followers From users_data group by(gender);


/*7Calculate the total users those
a.Uses Profile Picture in their Profile
b.Uses Application for Ecommerce platform
c.Uses Android app
d.Uses ios app
*/
desc users_data;
Select * from users_data;
#a.Uses Profile Picture in their Profile
select hasProfilePicture, count(hasProfilePicture) from users_data where hasProfilePicture='True';
#b.Uses Application for Ecommerce platform
select hasAnyApp,count(hasAnyApp) from users_data where hasAnyApp='True';
#c.Uses Android app
select hasAndroidApp,count(hasAndroidApp) from users_data where  hasAndroidApp='True';
#d.Uses ios app
select hasIosApp,count(hasIosApp) from users_data where hasIosApp='True';

#now iam Combining all in BY union keyword 
select "hasProfilePicture",hasProfilePicture, count(hasProfilePicture) from users_data  where hasProfilePicture='True'
union
select "hasAnyApp", hasAnyApp,count(hasAnyApp) from users_data where hasAnyApp='True'
union
select "hasAndroidApp", hasAndroidApp,count(hasAndroidApp) from users_data where hasAndroidApp='True'
union
select 'hasIosApp',hasIosApp,count(hasIosApp) from users_data where hasIosApp='True';



/* Q8:
Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers.
 (Hint: consider only those users having at least 1 product bought.)
 */

SELECT COUNT(productsBought), country FROM users_data
where productsBought>0
GROUP BY country
ORDER BY COUNT(productsBought) DESC;

/*: Q9
Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers.
 (Hint: consider only those users having at least 1 product sold.)
 */
SELECT
count(productsSold) total_seller,country
FROM
users_data
where productsSold>0
group by country
order by count(productsSold) asc
;
/*
Q10:
Display name of top 10 countries having maximum products pass rate.
*/
select * from users_data;
select Country,max(ProductsPassRate) from users_data
group by country
order by max(productsPassRate) desc limit 10;



/* 
Q11:
Calculate the number of users on an ecommerce platform for different language choices.
*/
select * from users_data;
SELECT
COUNT(language),language
FROM
users_data
group by language;
/*
Q12:
Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform. 
(Hint: use UNION to answer this question.)
*/
select * from users_data;
select ' putting produts in wishlist',gender,count(productsWished) choice1 from users_data where gender="F"  and productsWished > 0
union
select 'like socially',gender,count(socialProductsLiked) choice2 from users_data where gender="F" and socialProductsLiked > 0;
/*
Q13:

Check the choice of male users about being seller or buyer. (Hint: use UNION to solve this question.)
*/
select ' male Users Seller',count(productsSold) choice1 from users_data where gender="M"  and productsSold > 0
union
select 'Male users Buyer',count(productsBought) choice2 from users_data where gender="M" and productsBought > 0;
/* 
Q14:
Which country is having maximum number of buyers?
*/
select country from users_data where productsBought in (select max(productsBought) from users_data );
select count(productsBought) ,country from users_data group by country order by max(productsBought) desc limit 1;
/*
Q15:
List the name of 10 countries having zero number of sellers.
*/
select * from users_data;
select country from users_data;
select country,count(productsSold) from users_data where productsSold=0 group by country order by count(productsSold) desc limit 10;
select country from users_data group by country order by sum(productsSold) asc limit 10;
select country from users_data group by country having sum(productsSold)=0 limit 10;

/*
Q16:
Display record of top 110 users who have used ecommerce platform recently.
*/
select * from users_data;
select * from users_data order by daysSinceLastLogin limit 110;
/*


Q17:
Calculate the number of female users those who have not logged in since last 100 days.
*/

Select count(gender) no_of_female,daysSinceLastLogin from users_data where gender ="F" and daysSinceLastLogin>=100 
group by country
order by no_of_female desc
;
(select count(gender) from users_data where gender="F" and daysSinceLastLogin>=100);


/*Q18:
Display the number of female users of each country at ecommerce platform.*/
select Count(gender) no_of_Female,country
from users_data
where gender="F"  and hasAnyApp="True"
group by country
order by count(gender) desc;


/*Q19:
Display the number of male users of each country at ecommerce platform.*/
select Count(gender) no_of_Male,country
from users_data
where gender="M"  and hasAnyApp="True"
group by country
order by count(gender) desc;

/*Q20:
Calculate the average number of products sold and bought on ecommerce platform by male users for each country.*/
select 
avg(productsSold),avg(productsBought),count(gender),Country
From 
Users_data
where gender="M" and hasAnyApp="True"
group by country;
