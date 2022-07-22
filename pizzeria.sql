DROP DATABASE IF EXISTS PIZZERIA;
CREATE DATABASE PIZZERIA;
USE PIZZERIA;


CREATE TABLE clients(
Client_id int not null auto_increment unique,
client_name varchar (50) not null,
client_last_name varchar (50) not null,
address varchar(50) null,
pc int null,
location varchar(50) null,
province varchar(50) null,
phone varchar(50) null,
  primary key (client_id))
   ENGINE=InnoDB;
   
insert into clients values (1,'Juan','Pérez','Quesada, 3150, planta 0, puerta 3', 08040,'Barcelona', 'Barcelona', '934568798');
insert into clients values (2,'Laura','López','Valencia, 34, planta 3,  puerta 4', 08400,'Granollers', 'Barcelona', '938889756');
insert into clients values (3,'Mónica',' García','Granada, 50, planta 1, puerta 1',08040, 'Barcelona','Barcelona', '931228833');  
insert into clients values (4,'Xavi','González','Cargol, 20, planta 5, puerta 9', 08400, 'Granollers', 'Barcelona','934547898');
insert into clients values (5,'Ana','Palau','Numancia, 80, planta 2, puerta 2',08040, 'Barcelona',  'Barcelona','932124478');
insert into clients values (6,'Pablo','Gutiérrez','Remolar, 17, planta 0, puerta 3',080300, 'Mollet',  'Barcelona', 938859833);
insert into clients values (7,'Natalia','Costa','Bosc, 20, planta 2, puerta 6', 08300, 'Mollet', 'Barcelona', '930082238');
insert into clients values (8,'Estefanía','Nuñez','Glories, 60,planta 8, puerta 7', 08450, 'Montmelo', 'Barcelona','932887654');
insert into clients values (9,'Antonio','Muñoz','Valencia, 50, plnata 1, puerta 1', 08450,'Les Franqueses',  'Barcelona', '934560980' );
insert into clients values (10,'Pedro','García','Lluc, planta 1, puerta1, 8', 08500, 'Mataro',  'Barcelona','932387599');

  CREATE TABLE stores (
  store_id int not null auto_increment unique,
  address_store varchar(50) null,
  pc int,
  location_store varchar(50) not null,
  province_store varchar (50) not null,
  primary key (store_id)
  ) ENGINE = InnoDB;
  
  insert into stores values (1,'Valencia, 59', 08030,'Barcelona', 'Barcelona');
  insert into stores values (2,'Diagonal, 567', 08012,'Barcelona', 'Barcelona');
  insert into stores values (3,'Josep Tarradellas, 56', 08008, 'Barcelon','Barcelona');
  
  
  CREATE TABLE employees(
  employee_id int not null auto_increment unique,
  store_id int not null,
  employee_name varchar(50) not null,
  employee_last_name varchar(50) not null,
  dni varchar (50) not null,
  phone varchar(50) not null,
  type_employee varchar (50) not null,
  primary key(employee_id),
  index (store_id),
  constraint fk_store_id foreign key (store_id) references stores (store_id)
  on delete cascade on update cascade
  )ENGINE = InnoDB;
  
  insert into employees values (1,1,'Laura', 'Distefano', '37890654U','935674490','cocinera');
  insert into employees values (2,1,'María', 'Muñoz', '59807654S','9345611098','repartidora');  
  insert into employees values (3,2,'Ximena', 'Linares', '82904826M', '937711987', 'cocinera');  
  insert into employees values (4,2,'Carmen','García', '23876490P', '932228756', 'repartidora');
  insert into employees values (5,3,'Juan', 'López', '34567653y', '934098877', 'cocinero');
  insert into employees values (6,3,'Pablo','Vázquez', '459983456N','932458790', 'repartidor');

  CREATE TABLE products(
  product_id int not null auto_increment unique,
  product_name varchar(50) not null,
  description_product varchar (50),
  product_image tinyblob,
  price double not null,
  category varchar(50) not null,
  primary key (product_id)
  )ENGINE = InnoDB;
  
  insert into products values(1, 'Agua',null,'/Users/Rosario/agua.png', 2.50, 'bebidas');
  insert into products values(2, 'Coca-cola', null,'/Users/Rosario/Coca-cola.png',2.50,'bebidas');
  insert into products values(3, 'Cerveza', null, '/Users/Rosario/Cerveza.png',2.50, 'bebidas');
  insert into products values(4, 'Hamburguesa clásica', 'hamburguesa completa, con queso, tomate y lechuga', '/Users/Rosario/Hamburguesa_clasica.png', 8.95, 'hamburguesas');
  insert into products values(5, 'Hamburguesa americana', 'hamburquesa con bacon, cebolla  y salsa barcbacoa', '/Users/Rosario/Hamburguesa_americana.png', 9.95, 'hamburguesas');
  insert into products values(6, 'Pizza margarita','pizza con queso, tomate y orégano','/Users/Rosario/pizza_margarita.png', 12.95, 'pizzas clásicas');
  insert into products values(7, 'Pizza méxicana', 'pizza con chili y salsa picante', '/Users/Rosario/pizza_mexicana.png', 12.95 , 'pizzas del mundo');
  insert into products values(8, 'Pizza americana', 'pizza con ternera, bacon y salsa barbacoa', '/Users/Rosario/pizza_americana.png', 12.95, 'pizzas del mundo');
  insert into products values(9, 'Pizza mozzarella', 'pizza con queso y tomate', '/Users/Rosario/pizza_mozzarella.png', 12.95, 'pizzas clásicas');
  insert into products values(10, 'Pizza hawaiana', 'pizza con piña y jamón dulce', '/Users/Rosario/pizza_hawaiana.png', 12.95, 'pizzas del mundo');
          
  
CREATE TABLE type_delivery(
type_delivery_id int not null auto_increment unique,
type_delivery varchar (50) not null,
employee_id int,
date_time_arrival datetime,
primary key(type_delivery_id),
index (employee_id),
constraint fk_employee_id foreign key (employee_id) references employees (employee_id)
on delete cascade on update cascade
 )ENGINE=InnoDB;

insert into type_delivery values(1,'entrega a domicilio',2,'2022-07-22 22:00');
insert into type_delivery values(2,'recogida en tienda',null, null);
insert into type_delivery values(3,'entrega a domicilio', 4,'2022-07-22 23:00');
insert into type_delivery values(4, 'recogida en tienda', null, null);
insert into type_delivery values(5, 'entrega a domicilio', 6,'2022-07-22 22:30');
  
CREATE TABLE tickets (
ticket_id int not null auto_increment unique,
date_ticket datetime not null,
client_id int not null,
employee_id int not null,
type_delivery_id int not null,
store_id int not null,
total double not null default (0),
index (client_id),
index (employee_id),
index (type_delivery_id),
index(store_id),
primary key (ticket_id),
constraint fk_client_id foreign key (client_id) references clients (client_id)
on delete cascade on update cascade,
constraint fk_employee_ticket_id foreign key (employee_id) references employees(employee_id)
on delete cascade on update cascade,
constraint fk_type_delivery_id foreign key (type_delivery_id)references type_delivery (type_delivery_id)
on delete cascade on update cascade,
constraint fk_store_ticket_id foreign key (store_id) references stores (store_id)
on delete cascade on update cascade
 )ENGINE=InnoDB;
 
 insert into tickets values(1,'2022-07-22 21:00',1,1,1,1,35.90);
 insert into tickets values(2,'2022-07-22 21:10',2,3,2,2,26.40); 
 insert into tickets values(3,'2022-07-22 21:15', 3,4,3,2,17.95); 
 insert into tickets values(4,'2022-07-22 21:20', 4,5,4,3,17.95);
 insert into tickets values(5,'2022-07-22 21:25', 5,6,5,3,17.95);


  CREATE TABLE products_details(
  product_detail_id  int not null auto_increment unique,
  ticket_id int not null,
  product_id int not null,
  amount int not null,
  primary key (product_detail_id),
  index(ticket_id),
  index (product_id),
  constraint fk_ticket_id foreign key (ticket_id) references tickets (ticket_id),
  constraint fk_product_id foreign key (product_id) references products (product_id)
  on delete cascade on update cascade
  )ENGINE=InnoDB;
  
insert into products_details values(1,1,1,4);
insert into products_details values(2,1,9,1);
insert into products_details values(3,1,8,1);
insert into products_details values(4,2,2,3);
insert into products_details values(5,2,4,1);
insert into products_details values(6,2,5,1);
insert into products_details values(7,3,3,2);
insert into products_details values(8,3,10,1);
insert into products_details values(9,4,2,2);
insert into products_details values(10,4,9,1);
insert into products_details values(11,5,1,2);
insert into products_details values(12,5,6,1);

  
/*Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.*/
select C.location, P.category, P.product_name, PD.amount from tickets as T
inner join clients as C on T.client_id = C.client_id
inner join products_details as PD on T.ticket_id = PD.ticket_id
inner join products as P on PD.product_id = P.product_id
where P. category = 'bebidas'
and C.location = 'Barcelona';



/*Llista quantes comandes ha efectuat un determinat empleat/da.*/
select E.employee_id, T.ticket_id from tickets as T
inner join employees as E on T.employee_id = E.employee_id
where E.employee_id = 3;
  
  
  
  
  
  
  