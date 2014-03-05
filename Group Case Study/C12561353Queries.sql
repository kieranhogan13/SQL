/*Student No: C12561353
Name: Kieran Hogan
Case Study: Edmunds Electrics
File: Query SQL*/

/*QUERIES*/
/*Simple queries to show all the individual tables (unjoined) created and populated*/
SELECT *
FROM   appliance;

SELECT *
FROM   customer;

SELECT *
FROM   fault;

SELECT *
FROM   manufacturer;

SELECT *
FROM   new_stock;

SELECT *
FROM   repair_on_site;

SELECT *
FROM   repair_off_site;

SELECT *
FROM   sale;

SELECT *
FROM   service_center;


/*1) Inner EquiJoin*/
/*Only returns the rows matching from the tables that have matching columns, using the equality operator*/
/*This join displays the customer name alongside the serial number of the product they purchased,
would be useful for knowing what type of product the customer buys*/
SELECT customer.customer_name,
       customer.customer_number,
       sale.serial_number
FROM   customer
       inner join sale
               ON customer.customer_id = sale.customer_id
ORDER  BY customer.customer_name;


/*2) Left OuterJoin*/
/*Returns all rows from first table, with rows that match in the second*/
/*This join displays all the deliveries, to the brand name of what appliances were delivered*/
SELECT new_stock.delivery_id,
       appliance.brand_name
FROM   new_stock
       left join appliance
              ON new_stock.serial_number = appliance.serial_number
ORDER  BY new_stock.delivery_id;


/*3) Right OuterJoin*/
/*Returns only the rows from the first table, that match with the second, giving all rows of second too*/
/*This join displays the customer_name and customer_number alongside some of the details of the fault table, 
would be useful for the electrics repair*/
SELECT customer.customer_name,
       customer.customer_number,
       fault.fault_id,
       fault.customer_fault_description,
       fault.staff_fault_description
FROM   customer
       right join fault
               ON customer.customer_id = fault.customer_id
ORDER  BY customer.customer_name;


/*4) Non EquiJoin*/
/*This is a inner join where the equality operator cant be used*/
/*This is an example of a non equijoin where the customers who spent between 100 and 200 
can be viewed alongside their name and address, for instance to send coupons for spending that much*/
/*A bug has resulted in this duplicating table data, and does not work as well as hoped, however a 
solution could not be found*/
SELECT appliance.price,
       customer.customer_id,
       customer.customer_name,
       customer.customer_address
FROM   customer,
       appliance
WHERE  appliance.price BETWEEN 100 AND 200;

/*other example*/
/*Similar to last example, works slightly differently*/
/*The duplicating bug exists in this join too*/
SELECT appliance.price,
       customer.customer_id,
       customer.customer_name,
       customer.customer_address
FROM   customer,
       appliance
WHERE  appliance.price > '100';


/*5) Natural Join*/
/*This is a regular join for combining two tables*/
/*This example is combining all the columns of manufacturer with service centre,
to give a combined look at the tables. This would be useful for staff at Edmunds 
Electrics when it comes to repairs*/
SELECT *
FROM   manufacturer
       NATURAL join service_center;

	   
/*6) Equijoin*/
/*This is a join where the equals operator is used*/
/*This particular example joins fault details with appliance details*/
SELECT *
FROM   fault
       join appliance
         ON fault.serial_number = appliance.serial_number; 