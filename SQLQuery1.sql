----Creating data base UC1----
create database AddressBookService;

use AddressBookService;
----- Creating Table UC2-----
CREATE TABLE addressbook(
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    address varchar(100) not null,
    city varchar(20) not null,
    state varchar(20)not null,
    zip int not null,
    phone_no varchar(15) not null,
    email_id varchar(50) not null,
	);

----- Inserting Data UC3----
insert into addressbook (first_name,last_name,address,city,state,zip,phone_no,email_id)
values('Sahil','Sharma','Ramnagar','Nasik','Maharashtra',593282,'6454618524','sash@gmail.com'),
      ('Vikas','Joshi','Great street','Bikaner','Rajasthan',229512,'7410654874','vikj@gmail.com');

select * from addressbook;

-------Edit Contact UC4-----
update addressbook set zip=969381 
where first_name='Sahil' and last_name='Sharma';

-------Delete Contact UC5----
delete from addressbook where first_name='Vikas' and last_name='Joshi';
select * from addressbook;

-------Retrieve person from city or state name UC6-------
select first_name,last_name from addressbook 
where city='Nasik' or  state='Maharashtra';
select * from addressbook;

------Count of addressbook by city and state UC7--------
select count(city) as count_of_address_book
from addressbook where city='Nasik' and state='Maharashtra';

------Retreive data alphabetically by name from city UC8-------
insert into addressbook (first_name,last_name,address,city,state,zip,phone_no,email_id)
values('Vikas','Joshi','Great street','Bikaner','Rajasthan',229512,'7410654874','vikj@gmail.com'),
	('Sana','Rawal','3/111','Vadodara','Gujrat',739512,'8110654875','Sana2@gmail.com'),
	('Reema','Kumar','Street lane','Nasik','Maharashtra',981312,'9510654853','Reema@gmail.com'),
	('Timish','Karad','Aaa','Kota','Rajasthan',621512,'8606548241','TiK@gmail.com')

select first_name,last_name from addressbook where city='Nasik' order by first_name asc;
select * from addressbook;

-------Alter table UC 9--------
alter table AddressBook add AddBookName varchar(50), BookType varchar(50);
update addressbook set AddBookName='Book1', BookType='Family' where last_name='Kumar'; 
update addressbook set AddBookName='Book2', BookType='Close_Friends' where first_name='Sana' or first_name='Timish';
update addressbook set AddBookName='Book3', BookType='Work' where first_name='Sahil';
update addressbook set AddBookName='Book3', BookType='Work' where first_name='Vikas';
select * from addressbook;

--------Count by BookType UC 10-------
select count(first_name) as Contacts from addressbook where BookType='Work';

--------Adding person details in family and close friends columns UC11------
insert into addressbook values('Nisha','Kapoor','4/505','Hydrabad','Telangana',756421,'9319654874','Nisha@gmail.com','Book1','Family'),
	                          ('Nisha','Kapoor','4/505','Hydrabad','Telangana',756421,'9319654874','Nisha@gmail.com','Book2','Close_Friends')
select * from addressbook;

------ ER Diagram UC 12----------
---droping table----
drop table addressbook;

-----Creating new table----------
create table addbooknametype(
book_id varchar(50) not null PRIMARY KEY,
book_name varchar(50) not null,
book_type varchar(50) not null
);

CREATE TABLE contact(
first_name varchar(50) not null,
last_name varchar(50) not null,
address varchar(100) not null,
city varchar(20) not null,
state varchar(20)not null,
zip int not null,
phone_no varchar(15) not null,
email_id varchar(50) not null,
book_id varchar(50) foreign key references addbooknametype(book_id)
);

-----Inserting Data-----
insert into addbooknametype(book_id,book_name,book_type)values('1','Book1','Family'),('2','Book2','Close_Friends'),('3','Book3','Work');
select * from addbooknametype;

insert into contact (first_name,last_name,address,city,state,zip,phone_no,email_id,book_id)
    values('Sahil','Sharma','Ramnagar','Nasik','Maharashtra',593282,'6454618524','sash@gmail.com',1),
	('Vikas','Joshi','Great street','Bikaner','Rajasthan',229512,'7410654874','vikj@gmail.com',2),
	('Sana','Rawal','3/111','Vadodara','Gujrat',739512,'8110654875','Sana2@gmail.com',3),
	('Reema','Kumar','Street lane','Nasik','Maharashtra',981312,'9510654853','Reema@gmail.com',1),
	('Timish','Karad','Aaa','Kota','Rajasthan',621512,'8606548241','TiK@gmail.com',2),
	('Nisha','Kapoor','4/505','Hydrabad','Telangana',756421,'9319654874','Nisha@gmail.com',3)
select * from contact;

------Checking queries UC13-------
select first_name, last_name from contact c inner join addbooknametype a on c.book_id=a.book_id 
where c.city='Kota' or c.state='Maharashtra';

select count (c.first_name) as Total_Count,c.city from contact c inner join addbooknametype a on c.book_id=a.book_id 
group by c.city;

select first_name, last_name from contact c inner join addbooknametype a on c.book_id=a.book_id  where c.city='Nasik'
order by first_name DESC;

select a.book_type as Book_Type, COUNT(a.book_type) as Total_Count from contact c inner join addbooknametype a on c.book_id=a.book_id 
group by a.book_type;

