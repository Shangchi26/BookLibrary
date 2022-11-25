IF EXISTS (SELECT * FROM sys.databases WHERE Name='BookLibrary')
DROP DATABASE BookLibrary
GO
CREATE DATABASE BookLibrary
GO
USE BookLibrary
GO

create table Book(
	BookCode int identity not null,
	constraint Bpk primary key (BookCode),
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
	MemberCode int identity,
	constraint Mpk primary key (MemberCode),
	Name Varchar(50) not null,
	Address varchar(100) not null,
	PhoneNumber int
)

insert into Member(Name, Address, PhoneNumber) values ('member1', 'address1', 84123123)
insert into Member(Name, Address, PhoneNumber) values ('member2', 'address2', 84456456)
insert into Member(Name, Address, PhoneNumber) values ('member3', 'address3', 84789789)

create table IssueDetails(
	BCode int,
	constraint Bfk foreign key (BCode) references Book(BookCode),
	MCode int,
	constraint Mfk foreign key (MCode) references Member(MemberCode),
	IssueDate datetime,
	ReturnDate datetime
)
insert into IssueDetails(BCode, MCode, IssueDate, ReturnDate) values (1, 2, '2022-08-30', '2022-09-30')
insert into IssueDetails(BCode, MCode, IssueDate, ReturnDate) values (3, 1, '2022-08-30', '2022-09-30')
insert into IssueDetails(BCode, MCode, IssueDate, ReturnDate) values (2, 1, '2022-07-15', '2022-08-20')
insert into IssueDetails(BCode, MCode, IssueDate, ReturnDate) values (5, 3, '2022-09-17', '2022-11-10')
insert into IssueDetails(BCode, MCode, IssueDate, ReturnDate) values (4, 2, '2022-08-30', '2022-10-10')

select * from Book
select * from Member
select * from IssueDetails

-- ý 2
alter table IssueDetails drop constraint Bfk
alter table IssueDetails drop constraint Mfk

alter table Book drop constraint Bpk
alter table Member drop constraint Mpk

alter table Book add constraint pk1 primary key (BookCode)
alter table Member add constraint pk2 primary key (MemberCode)

alter table IssueDetails add constraint fk1 foreign key(BCode) references Book(BookCode)
alter table IssueDetails add constraint fk2 foreign key(MCode) references Member(MemberCode)

alter table Book add constraint check_Price check (BookPrice > 0 and BookPrice < 200000)

alter table Member add constraint Phone_Unique unique (PhoneNumber)

alter table IssueDetails alter column BCode int not null
alter table IssueDetails alter column MCode int not null

alter table IssueDetails add constraint ID primary key (BCode, MCode)
--Create by ShangDz
