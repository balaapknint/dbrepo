CREATE TABLE `department` (
  `deptid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `student` (
  `roll` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `marks` int DEFAULT NULL,
  `dept` int DEFAULT NULL,
  KEY `std_dpt_fk_idx` (`dept`),
  CONSTRAINT `std_dpt_fk` FOREIGN KEY (`dept`) REFERENCES `department` (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into department(name,description) values ('CSE','Computer Science'),('IT','Information Technology'),('ECE','Electronics Communication Engg') ;


insert into student(roll,name,marks) values (1,'Ramu',100), (2,'Bala',85),(3,'Susmita',90);

update student set dept=1 where roll=1;
update student set dept=2 where roll=3;

select s.roll, s.name,s.marks,d.name as departname
from student s,department d
where s.dept = d.deptid;

select s.roll, s.name,s.marks,d.name as departname
from student s  join department d on
s.dept = d.deptid; --inner join

select s.roll, s.name,s.marks,d.name as departname
from student s  right join department d on
s.dept = d.deptid; --right outerjoin

select s.roll, s.name,s.marks,d.name as departname
from student s  left join department d on
s.dept = d.deptid; -- left outer join


create view student_dept_v as 
select s.roll, s.name,s.marks,d.name as departname
from student s  right join department d on
s.dept = d.deptid;


CREATE 
VIEW `student_dept_v` AS
    SELECT 
        `s`.`roll` AS `roll`,
        `s`.`name` AS `studentname`,
        `s`.`marks` AS `marks`,
        `d`.`name` AS `departname`,
        (CASE
            WHEN (`s`.`marks` > 95) THEN 'E'
            WHEN (`s`.`marks` BETWEEN 90 AND 95) THEN 'A'
            WHEN (`s`.`marks` BETWEEN 85 AND 89) THEN 'B'
        END) AS `Grade`
    FROM
        (`student` `s`
        LEFT JOIN `department` `d` ON ((`s`.`dept` = `d`.`deptid`)))
		
		
		
CREATE TABLE customer(  
  cust_id int NOT NULL,  
  name varchar(35),  
  occupation varchar(25),  
  age int  
);  


CREATE TABLE orders (  
    order_id int NOT NULL,   
    cust_id int,   
    prod_name varchar(45),  
    order_date date  
);  


INSERT INTO customer(cust_id, name, occupation, age)   
VALUES (101, 'Peter', 'Engineer', 32),  
(102, 'Joseph', 'Developer', 30),  
(103, 'John', 'Leader', 28),  
(104, 'Stephen', 'Scientist', 45),  
(105, 'Suzi', 'Carpenter', 26),  
(106, 'Bob', 'Actor', 25),  
(107, NULL, NULL, NULL);  


INSERT INTO orders (order_id, cust_id, prod_name, order_date)   
VALUES (1, '101', 'Laptop', '2020-01-10'),  
(2, '103', 'Desktop', '2020-02-12'),  
(3, '106', 'Iphone', '2020-02-15'),  
(4, '104', 'Mobile', '2020-03-05'),  
(5, '102', 'TV', '2020-03-20');  



SELECT name, occupation FROM customer  
WHERE EXISTS (SELECT * FROM Orders   
WHERE customer.cust_id = Orders.cust_id);  		


SELECT name, occupation FROM customer  
WHERE customer.cust_id  in  (SELECT Orders.cust_id FROM Orders   
);


SELECT name, occupation FROM employee  
WHERE employee.emp_id  in  (SELECT attendence.empid FROM attendence   where date=''
);





max(out)-min(in) where empid =id and date =