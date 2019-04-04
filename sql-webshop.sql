drop table if exists order_detail;
drop table if exists product;
drop table if exists orders;
drop table if exists customer;


create table customer (
	customerid INT primary key,
	companyname VARCHAR(30),
	contactname VARCHAR(30),
	contacttitle VARCHAR(30),
	address VARCHAR(30),
	city VARCHAR(30),
	region VARCHAR(30),
	postalcode VARCHAR(30),
	country VARCHAR(30),
	phone VARCHAR(30),
	fax VARCHAR(30)
);

create table orders (
	customerid INT references customer(customerid),
	orderid INT unique,
	employeeid INT,
	orderdate DATE,
	requireddate DATE,
	shipvia VARCHAR(30),
	freight VARCHAR(30),
	shipname VARCHAR(30),
	shipaddress VARCHAR(30),
	shipcity VARCHAR(30),
	shipregion VARCHAR(30),
	shippostalcode VARCHAR(30),
	shipcountry VARCHAR(30),
	primary key(orderid)
);

create table product (
	productid INT,
	productname VARCHAR(50),
	supplierid INT,
	categoryid INT,
	quantityperunit INT,
	unitprice INT,
	unitsinstock INT,
	unitsonorder INT,
	reorderlevel INT,
	discontinued INT,
	primary key (productid)
);

create table order_detail (
	orderid INT references orders(orderid),
	productid INT references product(productid),
	unitprice INT,
	quantity INT,
	discount INT,
	primary key(orderid, productid)
);


insert into customer values 
(0, 'Padlizsán Inc.', 'Jenő', 'a torkos', 'Hehe u. 12', 'Mátraszentlárva', 'Texas', 1234, 'Czech Republic', 123456, 654321),
(1, 'Padlizsán Inc.', 'András', 'a kemény','Jkjh u. 12', 'Kecskevár', 'Ulster', 1234, 'Japan', 234234, 1312),
(2, 'Akármi Kft.', 'Piroska', 'a félszemű', 'Nyenye u. 12', 'Berlin', 'BAZ megye', 1234, 'Australia', 234234, 1312);

insert into orders values 
(0, 0, 0, '2019-01-01', '2019-01-15', 'air', 'dunno', 'My ship name', 'Gödönye u. 123', 'Miskolc', 'Olympus Mons', 121232, 'Cambodia'),
(1, 1, 0, '2019-01-02', '2019-01-28', 'rail', 'dunno', 'My other ship name', 'Kulcslyuk u. 41', 'Budapest', 'Pest Megye', 121232, 'Canada'),
(1, 2, 0, '2019-01-015', '2019-02-15', 'road', 'dunno', 'My original ship name', 'Gödönye u. 123', 'Kecskemét', 'Kecskefölde', 121232, 'Cyprus');

insert into product values 
(0, 'Car', 0, 1, 1233, 1312, 23, 11, 777, 8),
(1, 'Goat-O-Meter', 0, 1, 612, 11, 32, 134, 78, 5),
(2, 'Knitting Lessony by Aunt Dementia', 0, 1, 15654, 121, 354654, 56, 4123, 89),
(3, 'High yield nuclear warhead (Unknown origin)', 0, 1, 12133, 13212, 283, 191, 771, 18);

