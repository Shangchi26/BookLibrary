IF EXISTS (SELECT * FROM sys.databases WHERE Name='BookLibrary')
DROP DATABASE BookLibrary
GO
CREATE DATABASE BookLibrary
GO
USE BookLibrary
GO

create table Book(
	BookCode int primary key identity,
	BookTitle varchar(100) not null,
	Author varchar(50) not null,
	Edition int,
	BookPrice money,
	Copies int
)
insert into Book (BookTitle, Author, Edition, BookPrice, Copies) values ('book1', 'author1', 9, 59999, 50)
insert into Book (BookTitle, Author, Edition, BookPrice, Copies) values ('book2', 'author2', 5, 69999, 60)
insert into Book (BookTitle, Author, Edition, BookPrice, Copies) values ('book3', 'author3', 7, 49999, 70)
insert into Book (BookTitle, Author, Edition, BookPrice, Copies) values ('book4', 'author4', 8, 79999, 70)
insert into Book (BookTitle, Author, Edition, BookPrice, Copies) values ('book5', 'author5', 6, 69999, 60)

create table Member(
	MemberCode int primary key identity,
	Name Varchar(50) not null,
	Address varchar(100) not null,
	PhoneNumber int
)

insert into Member(Name, Address, PhoneNumber) values ('member1', 'address1', 84123123)
insert into Member(Name, Address, PhoneNumber) values ('member2', 'address2', 84456456)
insert into Member(Name, Address, PhoneNumber) values ('member3', 'address3', 84789789)

create table IssueDetails(
	BCode int,
	constraint fk1 foreign key (BCode) references Book(BookCode),
	MCode int,
	constraint fk2 foreign key (MCode) references Member(MemberCode),
	IssueDate datetime,
	ReturnDate datetime
)
insert into IssueDetails(BCode, MCode, IssueDate, ReturnDate) values (1, 8, '2022-08-30', '2022-09-30')
insert into IssueDetails(BCode, MCode, IssueDate, ReturnDate) values (2, 8, '2022-08-30', '2022-09-30')
insert into IssueDetails(BCode, MCode, IssueDate, ReturnDate) values (2, 9, '2022-07-15', '2022-08-20')
insert into IssueDetails(BCode, MCode, IssueDate, ReturnDate) values (3, 10, '2022-09-17', '2022-11-10')

select * from Member
select * from Book
select * from IssueDetails

--ý 2
alter table IssueDetails drop constraint fk1
alter table IssueDetails drop constraint fk2

alter table Book drop constraint BookCode
