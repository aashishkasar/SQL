#1
#create table student_table ( id int(10) , name char(100), marks int(10),primary key (id) );
#2
#insert into student_table values(1,'vamsi',98);
#3
#delete from student_table where id=1
#4 
#insert into student_table values(1,'vamsi',98);
#insert into student_table values(2,'praveen',99);
#insert into student_table values(3,'chaitu',95);
#insert into student_table values(4,'kasi',89);
#insert into student_table values(5,'vinay',93);
#insert into student_table values(6,'mani',94);
#insert into student_table values(7,'chandhu',91);
#insert into student_table values(8,'aashish',90);
#insert into student_table values(9,'rohit',93);
#insert into student_table values(10,'kiran',91);
#5
#select * from student_table where marks>=94
#6
#select min(marks) as minimum_marks from student_table;
#select max(marks) as maximun_marks from student_table;
#select sum(marks) as total_marks from student_table;
#select avg(marks) as average_marks from student_table
#7
#select name from student_table where marks>=95 or marks<=90
#8
#select id,marks from student_table order by marks desc 
#9
#select marks, marks%3 as reminder,power(marks,2) as power from student_table 
#10
#select upper(name) as upper,lower(name) as lower,left(name,3) as first_three, right(name,3) as last_three,instr(name,'a') as A  from student_table;
#11
#create table nametable (name varchar(500));
#insert into nametable values('     Innomatics Research Labs     ');
#select ltrim(name) as left_trim, rtrim(name) as right_trim, trim(name) as total_trim from nametable
#12
#select curdate() as today_date
#13
#select dayname(curdate()) as day_name, monthname(curdate()) as month_name, year(curdate()) as year_name
#14
#PRIMARY KEY
# 
