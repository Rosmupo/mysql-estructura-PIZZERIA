DROP DATABASE IF EXISTS PIZZERIA;
CREATE DATABASE PIZZERIA;
USE PIZZERIA;

CREATE TABLE provinces(
province_id int not null auto_increment unique,
province_name varchar (50)
) ENGINE=InnoDB;

insert into provinces values(1,'Barcelona');
insert into provinces values(2, 'Tarragona');
insert into provinces values(3, 'LLeida');
insert into provinces values(4, 'Girona');

CREATE TABLE locations(
location_id int not null auto_increment unique,
location_name varchar(50),
province_id int not null,
index(province_id),
constraint fk_province_id foreign key (province_id) references provinces (province_id)
on delete cascade on update cascade)
ENGINE= InnoDB;

insert into locations values (1, 'Barcelona', 1);
insert into locations values (2, 'Montmelo', 1);
insert into locations values (3,'Mollet',1);
insert into locations values (4, 'Granollers', 1);
insert into locations values (5, 'Les Franqueses', 1);

CREATE TABLE clients(
Client_id int not null auto_increment unique,
client_name varchar (50) not null,
client_last_name varchar (50) not null,
address varchar(50) null,
pc int null,
location_id int, 
phone varchar(50) null,
  primary key (client_id),
  index (location_id),
  constraint fk_location_id foreign key (location_id) references locations (location_id)
  on delete cascade on update cascade)
   ENGINE=InnoDB;
   
insert into clients values (1,'Juan','Pérez','Quesada, 3150, planta 0, puerta 3', 08040,1, '934568798');
insert into clients values (2,'Laura','López','Valencia, 34, planta 3,  puerta 4', 08400,4, '938889756');
insert into clients values (3,'Mónica',' García','Granada, 50, planta 1, puerta 1',08040, 1, '931228833');  
insert into clients values (4,'Xavi','González','Cargol, 20, planta 5, puerta 9', 08400, 4,'934547898');
insert into clients values (5,'Ana','Palau','Numancia, 80, planta 2, puerta 2',08040, 1,'932124478');
insert into clients values (6,'Pablo','Gutiérrez','Remolar, 17, planta 0, puerta 3',080300, 3, '938859833');
insert into clients values (7,'Natalia','Costa','Bosc, 20, planta 2, puerta 6', 08300, 3, '930082238');
insert into clients values (8,'Estefanía','Nuñez','Glories, 60,planta 8, puerta 7', 08450, 2,'932887654');
insert into clients values (9,'Antonio','Muñoz','Valencia, 50, plnata 1, puerta 1', 08450,5, '934560980' );
insert into clients values (10,'Pedro','García','Lluc, planta 1, puerta1, 8', 08500, 5,'932387599');

  CREATE TABLE stores (
  store_id int not null auto_increment unique,
  address_store varchar(50) null,
  pc int,
  location_id int not null,
  primary key (store_id),
  index(location_id),
  constraint fk_location_stores_id foreign key (location_id) references locations (location_id)
  on update cascade on delete cascade
  ) ENGINE = InnoDB;
  
  insert into stores values (1,'Valencia, 59', 08030,1);
  insert into stores values (2,'Diagonal, 567', 08012,1);
  insert into stores values (3,'Josep Tarradellas, 56', 08008,1);
  
  
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

  CREATE TABLE categories(
  category_id int not null auto_increment unique,
  category_name varchar(50) not null
  )ENGINE = InnoDB;
  
  insert into categories values (1,'bebidas');
  insert into categories values(2, 'hamburguesas');
  insert into categories values(3, 'pizzas clásicas');
  insert into categories values(4, 'pizzas del mundo');

  
  
  CREATE TABLE products(
  product_id int not null auto_increment unique,
  product_name varchar(50) not null,
  description_product varchar (50),
  product_image tinyblob,
  price double not null,
  category_id int not null,
  primary key (product_id),
  index(category_id),
  constraint fk_category_id foreign key (category_id) references categories (category_id)
  on update cascade on delete cascade
  )ENGINE = InnoDB;
  
  insert into products values(1, 'Agua',null,'/Users/Rosario/agua.png', 2.50, 1);
  insert into products values(2, 'Coca-cola', null,'/Users/Rosario/Coca-cola.png',2.50,1);
  insert into products values(3, 'Cerveza', null, '/Users/Rosario/Cerveza.png',2.50, 1);
  insert into products values(4, 'Hamburguesa clásica', 'hamburguesa completa, con queso, tomate y lechuga', '/Users/Rosario/Hamburguesa_clasica.png', 8.95, 2);
  insert into products values(5, 'Hamburguesa americana', 'hamburquesa con bacon, cebolla  y salsa barcbacoa', '/Users/Rosario/Hamburguesa_americana.png', 9.95, 2);
  insert into products values(6, 'Pizza margarita','pizza con queso, tomate y orégano','/Users/Rosario/pizza_margarita.png', 12.95, 3);
  insert into products values(7, 'Pizza méxicana', 'pizza con chili y salsa picante', '/Users/Rosario/pizza_mexicana.png', 12.95 , 4);
  insert into products values(8, 'Pizza americana', 'pizza con ternera, bacon y salsa barbacoa', '/Users/Rosario/pizza_americana.png', 12.95, 4);
  insert into products values(9, 'Pizza mozzarella', 'pizza con queso y tomate', '/Users/Rosario/pizza_mozzarella.png', 12.95, 3);
  insert into products values(10, 'Pizza hawaiana', 'pizza con piña y jamón dulce', '/Users/Rosario/pizza_hawaiana.png', 12.95, 4);
          
  
CREATE TABLE tickets (
ticket_id int not null auto_increment unique,
date_ticket datetime not null,
client_id int not null,
employee_id int not null,
store_id int not null,
total double not null default (0),
index (client_id),
index (employee_id),
index(store_id),
primary key (ticket_id),
constraint fk_client_id foreign key (client_id) references clients (client_id)
on delete cascade on update cascade,
constraint fk_employee_ticket_id foreign key (employee_id) references employees(employee_id)
on delete cascade on update cascade,
constraint fk_store_ticket_id foreign key (store_id) references stores (store_id)
on delete cascade on update cascade
 )ENGINE=InnoDB;
 
 insert into tickets values(1,'2022-07-22 21:00',1,1,1,35.90);
 insert into tickets values(2,'2022-07-22 21:10',2,3,2,26.40); 
 insert into tickets values(3,'2022-07-22 21:15', 3,4,3,17.95); 
 insert into tickets values(4,'2022-07-22 21:20', 4,5,1,17.95);
 insert into tickets values(5,'2022-07-22 21:25', 5,6,2,17.95);


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
select Cl.location_id , P.category_id from categories as C
inner join products as P on C.category_id= P.category_id
inner join products_details as PD on P.product_id= PD.product_id
inner join tickets as T on PD.ticket_id= T.ticket_id
inner join clients as Cl on T.client_id= Cl.client_id
where P.category_id = 1
and Cl.location_id= 1;


/*Llista quantes comandes ha efectuat un determinat empleat/da.*/
select E.employee_id, T.ticket_id from tickets as T
inner join employees as E on T.employee_id = E.employee_id
where E.employee_id = 3;
  
  
  
  
  
  
  