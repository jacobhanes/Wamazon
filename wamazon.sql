create database wamazon_db;
use wamazon_db;

SET @@SESSION.sql_mode = 'STRICT_TRANS_TABLES';
create table products (
	id integer(20) auto_increment not null,
    product_name varchar(50),
    department varchar(50),
    price decimal(8, 2) NOT NULL,
    quantity integer(20) unsigned check (quantity > 0),
    primary key(id)
    );

insert into products (product_name, department, price, quantity) values ("wasteland", "magic cards", 30.00, 3);
insert into products (product_name, department, price, quantity) values ("collective brutality", "magic cards", 8.00, 5);
insert into products (product_name, department, price, quantity) values ("gobin guide", "magic cards", 14.00, 4);
insert into products (product_name, department, price, quantity) values ("octopatch traveler", "games", 40.00, 1);
insert into products (product_name, department, price, quantity) values ("old sock", "fine clothing", 15.00, 3);
insert into products (product_name, department, price, quantity) values ("jj's water container", "momorabilia", 150.00, 1);
insert into products (product_name, department, price, quantity) values ("TA's trade secrets", "black market goods", 13.00, 1);
insert into products (product_name, department, price, quantity) values ("Steve Nash jearsey", "memorabilia", 120.00, 1);
insert into products (product_name, department, price, quantity) values ("blue shirt", "fine clothing", 10.00, 10);
insert into products (product_name, department, price, quantity) values ("Jake's glasses", "black market goods", 1000.00, 1);

select * from products;

UPDATE products SET quantity = quantity - 1 where id = 9;
