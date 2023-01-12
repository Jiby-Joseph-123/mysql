create database flight;
create table login (
id int primary key auto_increment,
user_name varchar(50) not null  unique,
password varchar(50) not null check(password>=8)
 );
 create table passenger(
 id int primary key auto_increment,
 name varchar(50) not null,
 user_name varchar(50) not null unique,
 email varchar(50) not null unique ,
 phone bigint not null unique,
password varchar(50) not null,
address varchar(250) not null ,
dob date not null
);

create table flight(
flight_no int  primary key auto_increment,
flight_name varchar(20) not null ,
flight_description text not null ,
total_capacity int not null 
);





create table fight_schedule(
id int primary key  auto_increment,
flight_from varchar(20) not null,
flight_to varchar(20) not null,
journey_date date not null,
journey_time time  not null,
cost int not null,
flight_no int,
constraint FK_Fight_Flight_no foreign key(flight_no)references flight(flight_no) on delete cascade );


create table flight_booking(
ticket_no int primary key auto_increment,
date_of_booking date not null,
date_of_travel date not null,
flight_from varchar(20) not null,
flight_to varchar(20)not null,
flight_time time not null,
boarding_time time not null,
flight_seat int not null,
passenger_id int,
flight_id int,
constraint FK_Flight_id foreign key(flight_id) references fight_schedule(id),
constraint FK_Passenger_id foreign key(passenger_id) references passenger(id));


-- select id,flight_from,flight_to,journey_date,journey_time from fight_schedule  id of fight_schedule and flight_id of flight_booking are same


select fs.id, fs.flight_from , fs.flight_to , fs.journey_date, fs.journey_time from  fight_schedule fs
inner join flight_booking as fb on fs.id = fb.flight_id;