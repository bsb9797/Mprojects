create database powerconsumptiontracker;
use powerconsumptiontracker;
create table Customer(CustomerId int primary key,
					name varchar(20) Not null,
                    Address varchar(50) Not null,
                    PhoneNumber bigint Not Null,
                    Email varchar(30) unique);
show tables;
insert into Customer values(1,'Bhargav','Bengaluru',908765480,'bhargav@gmail.com');
insert into Customer values(2,'Hema','Chennai',908755480,'hema1@gmail.com');
insert into Customer values(3,'sri','Erode',908765489,'sri9@gmail.com');
insert into Customer values(4,'rani','Hyderabad',908765280,'rani101@gmail.com');
insert into Customer values(5,'susheela','Kolar',908765400,'sus192@gmail.com');
select*from Customer;


create table Meter( MeterId int Primary Key, 
				 CustomerId int,
                 InstallationDate Date Not Null,
                 LastReadingDate Date Not Null, 
                 CONSTRAINT fk_customer FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId) ON DELETE CASCADE);

insert into Meter values(110,1,'2025-11-02','2025-11-23');
insert into Meter values(232,2,'2022-01-01','2025-09-01');
insert into Meter values(324,3,'2019-03-01','2025-07-04');
insert into Meter values(411,4,'2017-06-21','2025-06-17');
insert into Meter values(501,5,'2015-05-01','2025-11-25');
select*from Meter;
drop table Meter ;

 create table ElectricityUsage (UsageId int Primary Key,
								MeterId int, 
								ReadingDate Date Not Null,
								UsageUnits Numeric check (UsageUnits>=0), 
                                CONSTRAINT fk_meter
								FOREIGN KEY (MeterId)
								REFERENCES Meter(MeterId)
								ON DELETE CASCADE);
                                
insert into ElectricityUsage (UsageId, MeterId, ReadingDate, UsageUnits) values (1001, 110, '2025-12-01', 250);
insert into ElectricityUsage (UsageId, MeterId, ReadingDate, UsageUnits) values (1022, 232, '2025-10-11', 120);
insert into ElectricityUsage (UsageId, MeterId, ReadingDate, UsageUnits) values (1013, 324, '2025-08-15', 100);
insert into ElectricityUsage (UsageId, MeterId, ReadingDate, UsageUnits) values (1084, 411, '2025-09-17', 135);
insert into ElectricityUsage (UsageId, MeterId, ReadingDate, UsageUnits) values (1105, 501, '2025-11-25', 180);

select*from ElectricityUsage;
drop table ElectricityUsage ;

create table Bill (
    BillId int primary key,
    MeterId int,
    BillDate date not null,
    AmountDue numeric check (AmountDue >= 0),
    DueDate date not null,
    Paid tinyint not null default 0,
    constraint fk_billmeter foreign key (MeterId) 
        references Meter(MeterId) 
        on delete cascade);

insert into Bill (BillId, MeterId, BillDate, AmountDue, DueDate, Paid) values (1, 110, '2025-11-10', 500, '2025-12-01', 0);
insert into Bill (BillId, MeterId, BillDate, AmountDue, DueDate, Paid) values (2, 232, '2025-10-15', 300, '2025-11-05', 1);
insert into Bill (BillId, MeterId, BillDate, AmountDue, DueDate, Paid) values (3, 324, '2025-09-20', 450, '2025-10-10', 0);
insert into Bill (BillId, MeterId, BillDate, AmountDue, DueDate, Paid) values (4, 411, '2025-08-25', 600, '2025-09-15', 1);
insert into Bill (BillId, MeterId, BillDate, AmountDue, DueDate, Paid) values (5, 501, '2025-11-01', 700, '2025-11-20', 0);
select*from Bill;

create table Payment (
    PaymentId int primary key,
    BillId int,
    PaymentDate date not null,
    AmountPaid numeric check (AmountPaid >= 0),
    constraint fk_payment_bill foreign key (BillId) 
        references Bill(BillId) 
        on delete cascade);
        
insert into Payment (PaymentId, BillId, PaymentDate, AmountPaid) values (101, 1, '2025-11-15', 500);
insert into Payment (PaymentId, BillId, PaymentDate, AmountPaid) values (102, 2, '2025-10-20', 300);
insert into Payment (PaymentId, BillId, PaymentDate, AmountPaid) values (103, 3, '2025-09-25', 450);
insert into Payment (PaymentId, BillId, PaymentDate, AmountPaid) values (104, 4, '2025-08-30', 600);
insert into Payment (PaymentId, BillId, PaymentDate, AmountPaid) values (105, 5, '2025-11-10', 700);
select*from Payment;


select MeterId, 
    SUM(UsageUnits) AS TotalUsage
from ElectricityUsage
group by MeterId
having SUM(UsageUnits) > 200;

select c.CustomerId,c.Name,SUM(b.AmountDue) AS TotalUnpaidAmount
from Customer c
join Meter m on c.CustomerId = m.CustomerId
join Bill b on m.MeterId = b.MeterId
where b.Paid = 0
group by c.CustomerId, c.name
order by TotalUnpaidAmount desc;

select b.BillId,b.MeterId,b.BillDate,b.AmountDue,b.DueDate, 
case when b.Paid = 1 
then 'Paid'
else 'Unpaid'
    end as PaymentStatus
from Bill b
order by b.BillDate asc;

select distinct c.CustomerId,c.name,c.Address,c.PhoneNumber,c.Email from Customer c
join Meter m on c.CustomerId = m.CustomerId
where m.InstallationDate > '2023-12-31';

select m.MeterId,m.LastReadingDate,SUM(e.UsageUnits) as TotalUsage
from Meter m
join ElectricityUsage e on m.MeterId = e.MeterId
group by m.MeterId, m.LastReadingDate
order by TotalUsage desc;




