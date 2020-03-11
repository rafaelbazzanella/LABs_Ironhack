
**1. What are the different genres?**

	SELECT DISTINCT prime_genre FROM data;

**2. Which is the genre with the most apps rated?**
The count of ratings an app has received is in the rating_count_tot column.

	SELECT prime_genre,sum(rating_count_tot) FROM data GROUP BY prime_genre ORDER BY sum(rating_count_tot) DESC;



**3. Which is the genre with most apps?**

	SELECT prime_genre,count(track_name) FROM data GROUP BY prime_genre ORDER BY count(track_name) DESC LIMIT 1;

**4. Which is the one with least?**

	SELECT prime_genre,count(track_name) FROM data GROUP BY prime_genre ORDER BY count(track_name) LIMIT 1;

**5. Find the top 10 apps most rated.**

	SELECT track_name,sum(rating_count_tot) FROM data GROUP BY track_name ORDER BY sum(rating_count_tot) DESC LIMIT 10;

**6. Find the top 10 apps best rated by users.**

	SELECT track_name,user_rating FROM data ORDER BY user_rating DESC LIMIT 10;

**7. Take a look at the data you retrieved in question 5. Give some insights.**

	I can see that Facebook is the leader as the most rated app being followed by instagram. I can also check that social medias(3), games(4), music related apps(2) and the bible(1) are the top rated apps.

**8. Take a look at the data you retrieved in question 6. Give some insights.**

	I can check that the top 10 best rated apps is not the best way to look at the data because we have a total of 964 with the highest score and when we select only 10 we hide the others. 

**9. Now compare the data from questions 5 and 6. What do you see?**

	SELECT track_name,sum(rating_count_tot),user_rating_ver FROM data GROUP BY track_name,user_rating_ver ORDER BY sum(rating_count_tot) DESC LIMIT 10;
	I can  that some of the most rated apps do not have the best score. I see that the bible has the highest score and angrybird the lowest


**10. How could you take the top 3 regarding both user ratings and number of votes?**

	SELECT track_name,sum(rating_count_tot),user_rating_ver FROM data GROUP BY track_name,user_rating_ver ORDER BY sum(rating_count_tot) DESC LIMIT 3;

**11. Do people care about the price of an app?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

	SELECT track_name,sum(rating_count_tot),user_rating_ver,price FROM data GROUP BY track_name,user_rating_ver,price ORDER BY sum(rating_count_tot) DESC;
	Yes, they do. We can see that the most used apps are the one for free. 
	SELECT count(user_rating_ver) FROM data WHERE user_rating_ver=5;
	--964
	SELECT count(user_rating_ver) FROM data WHERE user_rating_ver=5 AND price =0;
	--491/4056
	SELECT count(user_rating_ver) FROM data WHERE price =0;
	--4056
	SELECT count(user_rating_ver) FROM data WHERE user_rating_ver=5 AND price !=0;
	--473/3141
	SELECT count(user_rating_ver) FROM data WHERE price !=0;
	--3141
	We can also see that the apps that the payed apps have move chances of getting score 5 than free ones

**Bonus: Find the total number of games available in more than 1 language.**

	SELECT prime_genre,sum(count) FROM (
							SELECT prime_genre,count(track_name),"lang.num" FROM data GROUP BY prime_genre,"lang.num" 
							HAVING "lang.num">1 AND prime_genre='Games') AS A GROUP BY prime_genre;

	--1660

**Bonus2: Find the number of free vs paid apps**

	SELECT count(track_name) FROM data WHERE price =0;
	--4056
	SELECT count(track_name) FROM data WHERE price !=0;
	--3141

**Bonus3: Find the number of free vs paid apps for each genre**


	SELECT prime_genre,sum(count) FROM (
							SELECT prime_genre,count(track_name) FROM data GROUP BY prime_genre,price 
							HAVING price =0 ) AS A GROUP BY prime_genre ORDER BY sum desc
	-- de graça 

	SELECT prime_genre,sum(count) FROM (
							SELECT prime_genre,count(track_name) FROM data GROUP BY prime_genre,price 
							HAVING price !=0 ) AS A GROUP BY prime_genre ORDER BY sum desc
	-- sem ser de graça