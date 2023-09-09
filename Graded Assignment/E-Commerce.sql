create database E_commerce;
use E_commerce;
drop database E_commerce;

create table supplier(SUPP_ID INT primary KEY,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50)NOT NULL,
SUPP_PHONE varchar(50)not null);

create table customer(CUS_ID INT primary KEY,
CUS_NAME varchar(50)NOT NULL,
CUS_PHONE varchar(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL,
CUS_GENDER char);

create table category(CAT_ID INT primary KEY,
CAT_NAME varchar(20)not null);

create table product (PRO_ID INT primary KEY,
PRO_NAME varchar(20) not null default 'Dummy',
PRO_DESC varchar(60),
CAT_ID int, foreign key(CAT_ID) references category(CAT_ID)
);

create table supplier_pricing(PRICING_ID int primary key,
PRO_ID int , foreign key(PRO_ID) references product(PRO_ID),
SUPP_ID INT , foreign key(SUPP_ID) references supplier(SUPP_ID),
SUPP_PRICE int default 0);

create table Order_table(ORD_ID INT PRIMARY KEY,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT , FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
PRICING_ID INT , FOREIGN KEY(PRICING_ID) REFERENCES supplier_pricing(PRICING_ID));

create table rating(RAT_ID int PRIMARY KEY,
ORD_ID INT,foreign key(ORD_ID) references Order_table(ORD_ID),
RAT_RATSTARS INT NOT NULL);

insert into supplier values(1,'Rajesh Retails','Delhi','1234567890');
insert into supplier values(2,'Appario Ltd.','Mumbai','2589631470');
insert into supplier values(3,'Knome products ','Banglore ','9785462315');
insert into supplier values(4,'Bansal Retails','Kochi ','8975463285');
insert into supplier values(5,'Mittal Ltd.','Lucknow','7898456532');

insert into customer values(1,'AAKASH','9999999999','DELHI','M');
insert into customer values(2,'AMAN','9785463215','NOIDA','M');
insert into customer values(3,'NEHA','9999999999','MUMBAI','F');
insert into customer values(4,'MEGHA','9994562399','KOLKATA','F');
insert into customer values(5,'PULKIT','7895999999','LUCKNOW','M');

insert into category values(1 ,'BOOKS');
insert into category values(2 ,'GAMES');
insert into category values(3 ,'GROCERIES');
insert into category values(4 ,'ELECTRONICS');
insert into category values(5 ,'CLOTHES');

insert into product values(1,'GTA V',
'Windows 7 and above with i5 processor and 8GB RAM'
,2);
insert into product values(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5);
insert into product values(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4);
insert into product values(4,'OATS','Highly Nutritious from Nestle',3);
insert into product values(5 ,'HARRY POTTER' ,'Best Collection of all time by J.K Rowling',1);
insert into product values(6,'MILK', '1L Toned MIlk', 3
);
insert into product values(7,' Boat Earphones',' 1.5Meter long Dolby Atmos', 4);
insert into product values(8,' Jeans', 'Stretchable Denim Jeans with various sizes and color', 5);
insert into product values(9, 'Project IGI',' compatible with windows 7 and above', 2);
insert into product values(10 ,'Hoodie' ,'Black GUCCI for 13 yrs and above' ,5);
insert into product values(11 ,'Rich Dad Poor Dad' ,'Written by RObert Kiyosaki' ,1);
insert into product values(12 ,'Train Your Brain' ,'By Shireen Stephen',1);

insert into supplier_pricing values(1 ,1 ,2 ,1500);
insert into supplier_pricing values(2,3, 5, 30000);
insert into supplier_pricing values(3 ,5 ,1 ,3000);
insert into supplier_pricing values(4 ,2, 3, 2500);
insert into supplier_pricing values(5 ,4 ,1 ,1000);
insert into supplier_pricing values(6 ,12, 2, 780);
insert into supplier_pricing values(7 ,12 ,4 ,789);
insert into supplier_pricing values(8 ,3 ,1, 31000);
insert into supplier_pricing values(9 ,1 ,5 ,1450);
insert into supplier_pricing values(10 ,4 ,2, 999);
insert into supplier_pricing values(11 ,7 ,3 ,549);
insert into supplier_pricing values(12 ,7 ,4, 529);
insert into supplier_pricing values(13 ,6 ,2 ,105);
insert into supplier_pricing values(14 ,6 ,1 ,99);
insert into supplier_pricing values(15 ,2 ,5 ,2999);
insert into supplier_pricing values(16 ,5 ,2 ,2999);

insert into Order_table values(101,1500,'2021-10-06',2,1);
insert into Order_table values(102,1000,'2021-10-12',3,5);
insert into Order_table values(103,30000,'2021-09-16',5,2);
insert into Order_table values(104,1500,'2021-10-05',1,1);
insert into Order_table values(105,3000,'2021-08-16',4,3);
insert into Order_table values(106,1450,'2021-08-18',1,9);
insert into Order_table values(107,789,'2021-09-01',3,7);
insert into Order_table values(108,780,'2021-09-07',5,6);
insert into Order_table values(109,3000,'2021-01-10',5,3);
insert into Order_table values(110,2500,'2021-09-10',2,4);
insert into Order_table values(111,1000,'2021-09-15',4,5);
insert into Order_table values(112,789,'2021-09-16',4,7);
insert into Order_table values(113,31000,'2021-09-16',1,8);
insert into Order_table values(114,1000,'2021-09-16',3,5);
insert into Order_table values(115,3000,'2021-09-16',5,3);
insert into Order_table values(116,99,'2021-09-17',2,14);

insert into rating values(1,101,4);
insert into rating values(2,102,3);
insert into rating values(3,103,1);
insert into rating values(4,104,2);
insert into rating values(5,105,4);
insert into rating values(6,106,3);
insert into rating values(7,107,4);
insert into rating values(8,108,4);
insert into rating values(9,109,3);
insert into rating values(10,110,5);
insert into rating values(11,111,3);
insert into rating values(12,112,4);
insert into rating values(13,113,2);
insert into rating values(14,114,1);
insert into rating values(15,115,1);
insert into rating values(16,116,0);

/*Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000*/
select c.CUS_GENDER,COUNT(CUS_ID) AS Total_no_of_customers from customer c where CUS_ID IN (select distinct o.CUS_ID from Order_table o where ORD_AMOUNT >=3000) group by CUS_GENDER;  

/*Display all the orders along with product name ordered by a customer having Customer_Id=2*/
SELECT o.ORD_ID, p.PRO_NAME
FROM Order_table o
JOIN supplier_pricing sp ON o.PRICING_ID = sp.PRICING_ID
JOIN product p ON sp.PRO_ID = p.PRO_ID
WHERE o.CUS_ID = 2;

/*Display the Supplier details who can supply more than one product.*/
SELECT s.SUPP_ID, s.SUPP_NAME
FROM supplier s
JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
GROUP BY s.SUPP_ID, s.SUPP_NAME
HAVING COUNT(DISTINCT sp.PRO_ID) > 1;	

/*Create a lowest_expensive_productview as lowest_expensive_product and display the least expensive product from each category and print the table
with category id, name, product name and price of the product.*/
CREATE VIEW lowest_expensive_product AS
SELECT c.CAT_ID, c.CAT_NAME, p.PRO_NAME, MIN(sp.SUPP_PRICE) AS Price
FROM category c
JOIN product p ON c.CAT_ID = p.CAT_ID
LEFT JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
GROUP BY c.CAT_ID, c.CAT_NAME, p.PRO_NAME;

select*from lowest_expensive_product;

/*Display the Id and Name of the Product ordered after “2021-10-05”*/
select p.PRO_ID,p.PRO_NAME FROM product p
JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
JOIN Order_table o ON sp.PRICING_ID = o.PRICING_ID
WHERE o.ORD_DATE > '2021-10-05';

/*Display customer name and gender whose names start or end with character 'A'.*/
SELECT CUS_NAME, CUS_GENDER
FROM customer
WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';

/*Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print
“Average Service” else print “Poor Service”. Note that there should be one rating per supplier.*/

DELIMITER //

CREATE PROCEDURE SupplierRatingAndService()
BEGIN
    SELECT 
        s.SUPP_ID, 
        s.SUPP_NAME,
        CASE
            WHEN AVG(r.RAT_RATSTARS) = 5 THEN 'Excellent Service'
            WHEN AVG(r.RAT_RATSTARS) > 4 THEN 'Good Service'
            WHEN AVG(r.RAT_RATSTARS) > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS Type_of_Service,
        AVG(r.RAT_RATSTARS) AS Rating
    FROM supplier s
    LEFT JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
    LEFT JOIN Order_table o ON sp.PRICING_ID = o.PRICING_ID
    LEFT JOIN rating r ON o.ORD_ID = r.ORD_ID
    GROUP BY s.SUPP_ID, s.SUPP_NAME;
END //

DELIMITER ;

CALL SupplierRatingAndService();












