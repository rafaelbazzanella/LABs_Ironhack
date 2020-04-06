SELECT * FROM authors
SELECT * FROM publishers
SELECT * FROM titleauthor
SELECT * FROM titles


SELECT title_id, title, pub_id FROM titles 
SELECT au_id, title_id FROM titleauthor
SELECT au_id, au_lname, au_fname FROM authors
SELECT pub_id, pub_name FROM publishers



--SELECT t1.title_id, t1.title, t1.pub_id, ta.au_id FROM titles as t1 INNER JOIN titleauthor AS ta ON  t1.title_id = ta.title_id

--(SELECT joined_table.title_id, joined_table.title, joined_table.pub_id, joined_table.au_id, au.au_fname, au.au_lname FROM authors AS au INNER JOIN 
--		(SELECT t1.title_id, t1.title, t1.pub_id, ta.au_id FROM titles as t1 INNER JOIN titleauthor AS ta ON t1.title_id = ta.title_id) AS joined_table
--					ON joined_table.au_id = au.au_id)



--SELECT last_joined_table.title_id, last_joined_table.title, last_joined_table.pub_id, last_joined_table.au_id, last_joined_table.au_fname, last_joined_table.au_lname, pub.pub_name FROM publishers as pub INNER JOIN 
--	(SELECT joined_table.title_id, joined_table.title, joined_table.pub_id, joined_table.au_id, au.au_fname, au.au_lname FROM authors AS au INNER JOIN 
--			(SELECT t1.title_id, t1.title, t1.pub_id, ta.au_id FROM titles as t1 INNER JOIN titleauthor AS ta ON t1.title_id = ta.title_id) AS joined_table
--						ON joined_table.au_id = au.au_id) AS last_joined_table
--							ON last_joined_table.pub_id = pub.pub_id
-- question 01
SELECT  last_joined_table.au_id, last_joined_table.au_lname, last_joined_table.au_fname,last_joined_table.title, pub.pub_name FROM publishers as pub INNER JOIN 
	(SELECT joined_table.title_id, joined_table.title, joined_table.pub_id, joined_table.au_id, au.au_fname, au.au_lname FROM authors AS au INNER JOIN 
			(SELECT t1.title_id, t1.title, t1.pub_id, ta.au_id FROM titles as t1 INNER JOIN titleauthor AS ta ON t1.title_id = ta.title_id) AS joined_table
						ON joined_table.au_id = au.au_id) AS last_joined_table
							ON last_joined_table.pub_id = pub.pub_id 
								ORDER BY last_joined_table.au_id

--question 02

SELECT tq1.au_id AS "AUTHOR ID", tq1.au_lname AS "LAST NAME",
		tq1.au_fname AS "FIRST NAME",tq1.pub_name AS "PUBLISHER",COUNT(tq1.title) AS "TITLE COUNT" FROM 
		(SELECT  last_joined_table.au_id, last_joined_table.au_lname, last_joined_table.au_fname,last_joined_table.title, pub.pub_name FROM publishers as pub INNER JOIN 
			(SELECT joined_table.title_id, joined_table.title, joined_table.pub_id, joined_table.au_id, au.au_fname, au.au_lname FROM authors AS au INNER JOIN 
					(SELECT t1.title_id, t1.title, t1.pub_id, ta.au_id FROM titles as t1 INNER JOIN titleauthor AS ta 
					 		ON t1.title_id = ta.title_id) AS joined_table
								ON joined_table.au_id = au.au_id) AS last_joined_table
									ON last_joined_table.pub_id = pub.pub_id 
										ORDER BY last_joined_table.au_id) AS tq1
						GROUP BY tq1.au_id,tq1.au_lname,tq1.au_fname,tq1.pub_name
						ORDER BY "TITLE COUNT" DESC 

--Usar alias para reduzir código(no caso eu fiz o contário) ou para usar uma coluna criada no momento e não se consegue usar direto.
-- Para reduzir o código, ao invés de um alias para nomear a tabela, realizar um join direto no final de outro join. 
--question 03


--Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
-- `AUTHOR ID` - the ID of the author
-- `LAST NAME` - author last name
-- `FIRST NAME` - author first name
-- `TOTAL` - total number of titles sold from this author
-- Your output should be ordered based on `TOTAL` from high to low.
-- Only output the top 3 best selling authors.

SELECT au_id,au_lname,au_fname FROM authors
SELECT * FROM sales
SELECT title_id,SUM(qty) FROM sales GROUP BY title_id 
SELECT * FROM 
