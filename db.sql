------------- Create Tables -------------------
Create table News(NewsId int not null, Title longtext not null, Content longtext not null, PublishedAt datetime not null, 
CreatedBy varchar(50) not null, url longtext, UrlToImage longtext, primary key(NewsId), foreign key(CreatedBy) references UserProfile(UserId));

Create table UserProfile(UserId varchar(50) not null, FirstName longtext not null, LastName longtext not null, Contact longtext, Email longtext, CreatedAt datetime not null, primary key(UserId));

Create table Reminders(ReminderId int not null, Schedule datetime not null, NewsId int not null, foreign key(NewsId) references News(NewsId));

Create table User(UserId varchar(50) not null, Password varchar(50) not null, primary key(UserId));

------------- Insert Tables -------------------
insert into User values ("Jack", "pass@123");
insert into User values ("John", "something#121");
insert into User values ("Kevin", "test@123");

insert into News values (101, "IT Industry in 2020", "IT industry was facing disruptive changes in 2019. It is expected to have positive growth in 2020", "2019-12-01 00:00:00", "Jack", NULL, NULL);
insert into News values (102, "2020 FIFA U-17 Women World Cup", "The tournament will be held in India between 2 and 21 November 2020. It will mark the first time that India has hosted a FIFA women football tournament.", "2019-12-05 00:00:00", "Jack", NULL, NULL);
insert into News values (103, "chandrayyan2-spacecraft", "The lander of chandrayaan2 was named Vikram after Dr Vikram A Sarabhai, the father of the Indian SpaceProgramme, It was designed to function for one lunar day.", "2019-12-05 00:00:00", "John", NULL, NULL);
insert into News values (104, "NEFT transactions to be available 24x7", "Bank customers will be able to transfer funds through NEFT around the clock on all days including weekends and holidays from December 16.", "2019-12-07 00:00:00", "John", NULL, NULL);

insert into Reminders values (1, "2019-12-04 00:00:00", 101);
insert into Reminders values (2, "2019-12-10 00:00:00", 102);
insert into Reminders values (3, "2019-12-10 00:00:00", 104);

insert into UserProfile values ("Jack", "Jackson", "James", "8899776655", "jack@ymail.com", "2019-12-07 00:00:00");
insert into UserProfile values ("John", "Johnson", "Dsouza", "7869543210", "john@gmail.com", "2019-12-25 00:00:00");
insert into UserProfile values ("Kevin", "Kevin", "Lloyd", "9878685748", "kevin@ymail.com", "2019-12-01 00:00:00");

------------- Queries -------------------
select * from UserProfile where CreatedAt >= "2019-12-10 00:00:00";
select * from UserProfile u join News n on u.UserID = n.CreatedBy where u.UserID = "Jack";
select * from UserProfile where UserID = (select CreatedBy from News where NewsId = 103);
select * from UserProfile where UserID not in (select CreatedBy from News);
select NewsId, Title from News where NewsId in (select NewsId from Reminders);
select count(NewsId) as total_news, CreatedBy as User from News Group by CreatedBy;
Update UserProfile set Contact = "9192939495" where UserId = "John";
Update News set Title = "IT industry growth can be seen in 2020." where NewsId = 101;
Delete from Reminders where NewsId in (select NewsId from News where CreatedBy = "Jack");
insert into Reminders values (1, "2019-12-10 00:00:00", 103);
