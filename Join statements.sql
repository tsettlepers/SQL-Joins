/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select *
	from products p
    left join categories c on p.CategoryID=c.CategoryID
    where c.name='computers';
    
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select p.ProductID, p.`Name`, p.Price, r.Rating
	from products p
    left join reviews r on p.ProductID=r.ProductID
    where r.Rating=5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.EmployeeID, e.FirstName, e.LastName, sum(s.Quantity) as TotQty
	from employees e
    inner join sales s on e.EmployeeID=s.EmployeeID
	group by e.EmployeeID, e.FirstName, e.LastName
    order by TotQty desc
    limit 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select c.*, d.Name
	from categories c
    inner join departments d on c.DepartmentID=d.DepartmentID
    where c.Name in ('Appliances','Games');
    
/* joins: find the product name, total # sold, and total price sold, for Eagles: Hotel California --You may need to use SUM() */
select p.ProductID, p.`Name`, sum(s.Quantity) as TotQty, sum(s.Quantity*s.PricePerUnit) as Revenue
	from products p
    inner join sales s on p.ProductID=s.ProductID
    where p.name like '%Hotel California%'
    group by p.ProductID, p.`Name`;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */