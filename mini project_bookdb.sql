select * from books;

create database onlinebookstore_db;

select * from customers;

-- Project Questions: 
 -- Basic Level: 
 
 
-- 1.Retrieve all books in the “Fiction” genre. 

select * from books
where Genre like "Fiction%" ;


 
-- 2.Find books published after the year 1950. 
  select * from books
  Where Published_Year > 1950;
 
-- 3.List all customers from Canada.
select * from Customers
where Country like "Canada"; 
 
 
-- 4.Show orders placed in November 2023.

select * from orders
where Order_Date between "2023-11-01" and "2023-11-30"; 
 
 
-- 5.Retrieve the total stock of books available. 
select sum(Stock) " Total Stock" from books; 
 
 
-- 6.Find the details of the most expensive book.
select * from books 
order by price desc
limit 1 ; 
 
 
-- 7.Show all customers who ordered more than 1 quantity of a book. 
 
 select * from customers c
 join orders o
 on c.customer_ID = o.Order_ID
 where Quantity >1;
 
-- 8.Retrieve all orders where the total amount exceeds $20. 
 
 select * from Orders
 where Total_Amount > 20 ;
 
 
-- 9.List all distinct genres in the bookstore. 
 select distinct(Genre) from books;
 
-- 10.Find the book with the lowest stock available.

 select * from books
 where Stock = 0;
 
--  11.Calculate the total revenue from all orders. 
select sum(Total_Amount) from orders;


-- 12.	Retrieve the total number of books sold for each genre
select Books.Genre , sum(orders.quantity) as Totalbooksold
from Books
join orders on
books.book_id = orders.book_id
 group by
 books.genre;
 
  
-- 13.	Find the average price of books in the “Fantasy” genre. 
select avg(Price) from Books
where Genre like "%Fantasy%" ;
 
 
-- 14.	List customers who have placed at least 2 orders. 
SELECT c.CustomerID, c.Name, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING COUNT(o.OrderID) >= 2;

 
 
-- 15.	Find the most frequently ordered book. 
SELECT b.BookID, b.Title, SUM(od.Quantity) AS TotalOrdered
FROM OrderDetails od
JOIN Books b ON od.BookID = b.BookID
GROUP BY b.BookID, b.Title
ORDER BY TotalOrdered DESC
LIMIT 1;

 
 
-- 16.	Show the top 3 most expensive books of the “Fantasy” genre. 
 SELECT * FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;
 
 -- Advanced Level: 
-- 17.	Retrieve the total quantity of books sold by each author. 
SELECT b.Author, SUM(od.Quantity) AS TotalSold
FROM OrderDetails od
JOIN Books b ON od.BookID = b.BookID
GROUP BY b.Author;
 
 
-- 18.	List the cities of customers who spent over $30. 
SELECT DISTINCT c.City
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > 30;
 
 
-- 19.	Find the customer who spent the most on orders. 
 SELECT c.CustomerID, c.Name, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpent DESC
LIMIT 1;
 
-- 20.	Calculate the stock remaining after fulfilling all orders. 
SELECT b.BookID, b.Title, (b.Stock - IFNULL(SUM(od.Quantity), 0)) AS RemainingStock
FROM Books b
LEFT JOIN OrderDetails od ON b.BookID = od.BookID
GROUP BY b.BookID, b.Title, b.Stock;








