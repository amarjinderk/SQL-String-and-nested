SELECT * from Salesman;

SELECT name, commission from Salesman ;

CREATE SampleData; 
CREATE TABLE SampleData (ord_no INT, purch_amt INT, ord_date datetime, customer_id INT, salesman_id INT);

INSERT INTO SampleData (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES 
(70001,150.5,'2012-10-05', 3005,5002),(70009,270.65,'2012-09-10', 3001,5005),
(70002,65.26,'2012-10-05', 3002,5001),
(70004,110.5,'2012-08-17', 3009,5003),
(70007,948.5,'2012-09-10', 3005,5002),
(70005,2400.6,'2012-07-27', 3007,5001),
(70008,5760,'2012-09-10', 3002,5001),
(70010,1983.43,'2012-10-10', 3004,5006),
(70003,2480.4,'2012-10-10', 3009,5003),
(70012,250.45,'2012-06-27', 3008,5002),
(70011,75.29,'2012-08-17', 3003,5007),
(70013,3045.6,'2012-04-25', 3002,5001);

SELECT * FROM SampleData;
DELETE FROM SampleData WHERE ord_no = NULL;

SELECT salesman_id from SampleData;

SELECT * FROM Order_data;
INSERT INTO Order_data (customer_id, cust_name, city, grade, salesman_id) VALUES 
(3002,"Nick Rimando","New York",100,5001),
(3007,"Brad Davis","New York",200,5001),
(3005,"Graham Zusi","California",200,5002),
(3008,"Julian Green","London",300,5002),	
(3004,"Fabian Johnson","Paris",300,5006),
(3009,"Geoff Cameron","Berlin",100,5003),
(3003,"Jozy Altidor","Moscow",200,5007),
(3001,"Brad Guzan","London",100,5005);


SELECT * FROM Order_data WHERE grade = 200;
------ question 6
SELECT ord_no, ord_date, purch_amt FROM SampleData WHERE salesman_id = 5001;

----- question 7
CREATE TABLE NoblePrize (Year INT, Subject Text, Winner TEXT, Country TEXT, Category TEXT);

SELECT * from NoblePrize;
INSERT INTO NoblePrize (Year,Subject,Winner,Country,Category) VALUES (1970,"Physics","Hannes Alfven","Sweden","Scientist"),
(1970,"Physics","Louis Neel","France" ,"Scientist"),
(1970,"Chemistry","Luis Federico Leloir","France","Scientist"),
(1970,"Physiology","Ulf von Euler","Sweden" ,"Scientist"),
(1970,"Physiology","Bernard Katz","Germany","Scientist"),
(1970,"Literature","Aleksandr Solzhenitsyn","Russia" ,"Linguist"),
(1970,"Economics", "Paul Samuelson", "USA"    ,"Economist"),
(1970,"Physiology","Julius Axelrod",  "USA"    ,"Scientist"),
(1971,"Physics",   "Dennis Gabor",          "Hungary","Scientist"),
(1971,"Chemistry", "Gerhard Herzberg",      "Germany","Scientist"),
(1971,"Peace",     "Willy Brandt",          "Germany","Chancellor"),
(1971,"Literature","Pablo Neruda",          "Chile"  ,"Linguist"),
(1971,"Economics", "Simon Kuznets",         "Russia" ,"Economist"),
(1978,"Peace",     "Anwar al-Sadat",        "Egypt"  ,"President"),
(1978,"Peace",     "Menachem Begin",        "Israel" ,"Prime Minister"),
(1987,"Chemistry", "Donald J. Cram",        "USA"    ,"Scientist"),
(1987,"Chemistry", "Jean-Marie Lehn",       "France" ,"Scientist"),
(1987,"Physiology","Susumu Tonegawa",       "Japan"  ,"Scientist"),
(1994,"Economics", "Reinhard Selten",       "Germany","Economist"),
(1994,"Peace",     "Yitzhak Rabin",         "Israel" ,"Prime Minister"),
(1987,"Physics",   "Johannes Georg Bednorz","Germany","Scientist"),
(1987,"Literature","Joseph Brodsky",        "Russia" ,"Linguist"),
(1987,"Economics", "Robert Solow",          "USA"    ,"Economist"),
(1994,"Literature","Kenzaburo Oe",          "Japan"  ,"Linguist");


SELECT * from NoblePrize WHERE Year = 1970;
SELECT * from NoblePrize;
----- question 8
SELECT Year, Subject from NoblePrize where Winner = "Dennis Gabor";

---- question 9
SELECT Winner FROM NoblePrize WHERE Subject = "Physics" and Year > 1950;

------ question 10

SELECT Year, Subject, Winner, Country FROM NoblePrize WHERE Subject = "Chemistry" AND(Year BETWEEN 1965 and 1975);

----- question 11
------ Prime Minister 
SELECT * FROM NoblePrize WHERE Category = "Prime Minister" AND Year > 1972;


----- ques 12 with first name Louis

SELECT * from NoblePrize WHERE Winner like 'Louis%';

----- quest 13

select * from NoblePrize where Subject = "Physics" and year >= 1970;

------ question 14 

SELECT * from NoblePrize WHERE Year = 1970 and Subject not in ("Physiology","Economics");

------ question 15

SELECT * from NoblePrize WHERE (Subject = "Physiology" AND Year < 1971) or (Subject = "Peace" and Year >= 1974);

---- quest 16
-------- SELECT * FROM Student ORDER BY Age ASC , ROLL_NO DESC;
SELECT * from NoblePrize WHERE Subject NOT LIKE '[P]%' ORDER BY Year ASC, Winner ASC;

-------SELECT * from NoblePrize ORDER BY Subject ASC, Winner ASC;

--------- quest 17

SELECT * from NoblePrize WHERE Year = 1970 ORDER BY 
(CASE Subject
	WHEN 'Economics' THEN 7
	WHEN 'Chemistry' THEN 8
	ELSE 100 END) ASC, Winner ASC;

------SELECT * FROM CUSTOMERS



create table product_data (PRO_ID int,PRO_NAME text,PRO_PRICE int,PRO_COM int);
select * from product_data;
insert into product_data (PRO_ID,PRO_NAME,PRO_PRICE,PRO_COM)
values
(101,"Mother Board",3200,         15),
(102,"Key Board",    450,         16),
(103,"ZIP drive",    250,         14),
(104,"Speaker",      550,         16),
(105,"Monitor",     5000,         11),
(106,"DVD drive",    900,         12),
(107,"CD drive",     800,         12),
(108,"Printer",     2600,         13),
(109,"Refill cartridge",350,       13),
(110,"Mouse",        250,         12);

---- quest 18

SELECT avg(PRO_PRICE) from product_data where PRO_COM = 16;

select * from product_data;
-------- quest 19
SELECT * from product_data where PRO_PRICE BETWEEN 200 AND 600;


------ quest 20
SELECT PRO_NAME, PRO_PRICE from product_data where PRO_PRICE >= 250 ORDER by PRO_PRICE DESC, PRO_NAME ASC;

------ quest 21 
SELECT AVG(PRO_PRICE) as "Average price",PRO_COM  as "Company ID" from product_data order by PRO_COM;

------ quest 22
SELECT PRO_NAME, min(PRO_PRICE) from product_data;

----- quest 23

create table emp_data (EMP_IDNO int, EMP_FNAME text, EMP_LNAME text, EMP_DEPT int);
select * from emp_data;
insert into emp_data
values
(127323,"Michale"         ,"Robbin"                  ,57),
(526689,"Carlos"          ,"Snares"                  ,63),
(843795,"Enric"           ,"Dosio"                   ,57),
(328717,"Jhon"            ,"Snares"                  ,63),
(444527,"Joseph"          ,"Dosni"                   ,47),
(659831,"Zanifer"         ,"Emily"                   ,47),
(847674,"Kuleswar"        ,"Sitaraman"               ,57),
(748681,"Henrey"          ,"Gabriel"                 ,47),
(555935,"Alex"            ,"Manuel"                  ,57),
(539569,"George"          ,"Mardy"                   ,27),
(733843,"Mario"           ,"Saule"                   ,63),
(631548,"Alan"            ,"Snappy"                  ,27),
(839139,"Maria"           ,"Foster"                  ,57);
select * from emp_data;

SELECT DISTINCT(EMP_LNAME) from emp_data   ;


----------- ques 24

SELECT * from emp_data WHERE EMP_LNAME = "Snares"  ;


----- quest 25

SELECT * from emp_data  WHERE EMP_DEPT = 57;


  
























