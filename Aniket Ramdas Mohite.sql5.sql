#SIMPLE QUERIES

#1.List full details of all hotels. 
select * from hotel;

#2.List full details of all hotels in London. 
select * from hotel
where address = 'London';

#3.List the names and addresses of all guests in London, alphabetically ordered by name. 
select guest.name,guest.address from guest
where address = 'London'
order by name;

#4.List all double or family rooms with a price below £40.00 per night, in ascending order of price. 
select room.room_no from room
where price < 40.00
order by price;

#5.List the bookings for which no date_to has been specified.
select * from booking
where date_to = null;

#AGGREGATE FUNCTIONS 

#1.How many hotels are there? 
select count(name) from hotel;

#2.What is the average price of a room? 
select round(avg(price),2) as average_price_of_a_room from room;

#3.What is the total revenue per night from all double rooms? 
select sum(room.price) from room;

#4.How many different guests have made bookings for August?
select count(distinct name) from guest
inner join booking
on booking.guest_no = guest.guest_no
where date_from = '1997-06-03';

#SUBQUERIES AND JOINS

#1.List the price and type of all rooms at the Grosvenor Hotel.
Select room.price,room.type from room
inner join hotel
on hotel.hotel_no = room.hotel_no
where name = 'Grosvenor Hotel';

#2.List all guests currently staying at the Grosvenor Hotel. 
select guest.name from guest
inner join booking
on booking.guest_no = guest.guest_no
inner join hotel
on hotel.hotel_no = booking.hotel_no
where hotel.name = 'Grosvenor Hotel';

#3.List the details of all rooms at the Grosvenor Hotel, including the name of the guest staying in the room, if the room is occupied.
select room.room_no,room.hotel_no,room.type,room.price,guest.name from room
inner join hotel
on hotel.hotel_no = room.hotel_no
inner join guest
on guest.address = hotel.address
where hotel.name = 'Grosvenor Hotel';

#4.What is the total income from bookings for the Grosvenor Hotel today? 
select sum(room.price) from room
inner join hotel
on hotel.hotel_no = room.hotel_no
where hotel.name = 'Grosvenor Hotel';

#5.List the rooms that are currently unoccupied at the Grosvenor Hotel. 
select room.room_no from room
inner join hotel
on hotel.hotel_no = room.hotel_no
where hotel.name = 'Grosvenor Hotel';

#GROUPING

#1.List the number of rooms in each hotel. 
select count(room.room_no) as number_of_rooms,hotel.name as hotel_name from room
inner join hotel
on hotel.hotel_no = room.hotel_no
group by hotel.name;

#2.List the number of rooms in each hotel in London. 
select count(room.room_no) as number_of_rooms,hotel.name as hotel_name from room
inner join hotel
on hotel.hotel_no = room.hotel_no
where hotel.address = 'London'
group by hotel.name;

#3.What is the average number of bookings for each hotel in August?
select avg(booking.guest_no),hotel.name as hotel_name from booking
inner join hotel
on hotel.hotel_no = booking.hotel_no
group by hotel.name;

#4.What is the most commonly booked room type for each hotel in London?  
select avg(room.type) as most_commonly_booked_room,hotel.name as hotel_name from room
inner join hotel
on hotel.hotel_no = room.hotel_no
where hotel.address = 'London'
group by hotel.name;


