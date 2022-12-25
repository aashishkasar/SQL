#use db3;
#1
#create table employee(empid int(3),empname varchar(100),department varchar(50),contactno bigint, emailid varchar(100),empheadid int, constraint pk primary key (empid));
#insert into employee values(1,'vamsi','IT',1114567890,'111@gmail.com',121);
#insert into employee values(2,'Parag','IT',1234567890,'abc@gmail.com',123);
#insert into employee values(3,'chaitu','IT',3334567890,'333@yahoo.com',122);
#insert into employee values(4,'Rahul','IT',1234567890,'abc@gmail.com',124);
#insert into employee values(5,'praveen','CSE',5554567890,'555@yahoo.com',128);
#insert into employee values(6,'vinay','CSE',4444567890,'444@gmail.com',129);
#insert into employee values(7,'Rohit','CSE',9994567890,'def@gmail.com',125);
#insert into employee values(8,'mani','DS',8884567890,'888@gmail.com',120);
#insert into employee values(9,'Ram','DS',7774567890,'123@yahoo.com',126);
#insert into employee values(10,'Renuka','DS',6664567890,'999@gmail.com',127);
#create table empdept(deptid varchar(50),deptname varchar(100),dept_off varchar(100),depthead char(10), constraint pk primary key (deptid));
#insert into empdept values('IT03','IT','Nampally','HYD');
#insert into empdept values('IT02','IT','Monikonda','HYD');
#insert into empdept values('IT01','IT','Ameerpet','HYD');
#insert into empdept values('IT04','IT','Nacharam','HYD');
#insert into empdept values('CSE01','CSE','Gachibowli','HYD');
#insert into empdept values('CSE02','CSE','Panjaguta','HYD');
#insert into empdept values('CSE03','CSE','Miyapur','HYD');
#insert into empdept values('DS01','DS','Kukatpally','HYD');
#insert into empdept values('DS02','DS','RangaReddy','RR');
#insert into empdept values('DS03','DS','Secundarbad','SEC');
#create table empsalary(empid int ,salary bigint,ispermanent varchar(3), constraint foreign key(empid) references employee(empid));
#insert into empsalary values(1,25000,'no');
#insert into empsalary values(2,25000,'yes');
#insert into empsalary values(3,33000,'yes');
#insert into empsalary values(4,42000,'no');
#insert into empsalary values(5,42000,'yes');
#insert into empsalary values(6,22000,'no');
#insert into empsalary values(7,56000,'yes');
#insert into empsalary values(8,56000,'yes');
#insert into empsalary values(9,60000,'no');
#insert into empsalary values(10,70000,'yes');
#2a
#select * from employee where empname like 'P%' 
#2b
#select count(empid) as count from empsalary where ispermanent='yes' and salary>50000
#2c
#select * from employee where emailid regexp 'g'
#select * from employee where emailid like '%g%' 
#3a
#select sum(salary) as total_salary from empsalary where ispermanent='yes'
#3b
#select * from employee where empname like '%a'
#select * from employee where empname regexp 'a$'
#4a

#4b
#select empheadid from employee join empsalary on employee.empid=empsalary.empid where ispermanent='yes'
#5a
#select * from employee left join empsalary on employee.empid=empsalary.empid;
#5b
#select * from employee right join empdept on employee.department=empdept.deptname; 
#5c
#select * from employee  join empdept on employee.department=empdept.deptname; 
#5d
#select * from employee cross join empsalary on employee.empid=empsalary.empid;
#5e

#6
#update employee Set empname='Maria' where empid=10
#7
#set sql_safe_updates=0;
#alter table empsalary drop foreign key fk_salaray ;
#alter table employee drop primary key;
#delete from employee where empid=10;
#set sql_safe_updates=1;
#8a
#alter table employee add column ( phone_number bigint )
#set sql_safe_updates=0;
#update employee set phone_number=1111 where empid=1;
#update employee set phone_number=2222 where empid=2;
#update employee set phone_number=3333 where empid=3;
#update employee set phone_number=4444 where empid=4;
#update employee set phone_number=5555 where empid=5;
#update employee set phone_number=6666 where empid=6;
#update employee set phone_number=7777 where empid=7;
#update employee set phone_number=8888 where empid=8;
#update employee set phone_number=9999 where empid=9;
#8b
#alter table employee drop column phone_number
#9
#select count(salary) from empsalary group by salary
#10
#select salary,empname,count(salary) as count_salary from employee join empsalary on employee.empid=empsalary.empid group by salary order by salary 