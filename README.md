# HotelReservationAnalysis_SQLProject

# Overview of Project
The hotel industry relies on data to make informed decisions and provide a better guest experience. In this internship, worked on a hotel reservation dataset to gain insights into guest preferences, booking trends, and other key factors that impact the hotel's operations. By using SQL to query and analyze the data, as well as answered specific questions about the dataset. 

# Dataset Details 
 Booking_ID: A unique identifier for each hotel reservation. 

 no_of_adults: The number of adults in the reservation. 

 no_of_children: The number of children in the reservation. 

 no_of_weekend_nights: The number of nights in the reservation that fall on weekends. 

 no_of_week_nights: The number of nights in the reservation that fall on weekdays. 

 type_of_meal_plan: The meal plan chosen by the guests. 

 room_type_reserved: The type of room reserved by the guests. 

 lead_time: The number of days between booking and arrival. 

 arrival_date: The date of arrival. 

 market_segment_type: The market segment to which the reservation belongs.  avg_price_per_room: The average price per room in the reservation. 

 booking_status: The status of the booking. 

# SQL Queries
select * from hotel;

-- 1. What is the total number of reservations in the dataset?

select count(*) as Total_Reservations
from hotel;

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/d3cc3bbc-db45-4ef8-813f-84ccce9fc3b0)


-- 2. Which meal plan is the most popular among guests? 

select type_of_meal_plan, count(*) as Mealtype_Count
from hotel
group by type_of_meal_plan
order by Mealtype_Count desc;

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/7dcfa804-3164-4aea-b943-665e1f0db11e)


-- 3. What is the average price per room for reservations involving children?

select AVG(avg_price_per_room) as AVG_PRICE_PER_ROOM
from hotel 
where no_of_children > 0;

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/1fa43cc4-d97b-4f4d-bd25-90b7637241ea)

-- 4. How many reservations were made for the year 2016? 

select count(Booking_ID) as Total_Reservation
from hotel
where year(str_to_date(arrival_date, '%d-%m-%Y')) = 2018;

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/a012ffce-71cf-4e29-a234-1fc091c7487c)

-- 5. What is the most commonly booked room type?

select room_type_reserved, count(booking_id) as Common_Room_Booktype
from hotel
group by room_type_reserved
order by Common_Room_Booktype desc limit 1;

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/b276d9ee-7c9d-4048-8c64-995b673dfd44)

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? 

select count(booking_id) 
from hotel
where no_of_weekend_nights > 0;

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/0c8a8aca-192b-42d6-a933-4732a144f931)

-- 7. What is the highest and lowest lead time for reservations? 

select min(lead_time) as Lowest_Leadtime, 
max(lead_time) as Highest_Leadtime
from hotel;

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/a9da3ed2-657f-4e6a-8854-424aa3fcc998)

-- 8. What is the most common market segment type for reservations? 

select market_segment_type, 
count(booking_id) as common_marget_type
from hotel
group by market_segment_type
order by common_marget_type desc limit 1;

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/af2a6c17-455f-40cc-a73e-cd902477e529)

-- 9. How many reservations have a booking status of "Confirmed"? 

select count(*) as Total_Number_of_Reservations
from hotel
where booking_status = 'Not_Canceled';

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/3f582c5a-9915-48ae-91c0-f77460ad379c)

-- 10. What is the total number of adults and children across all reservations? 

select sum(no_of_adults) as Total_Adults, 
sum(no_of_children) as Total_Childern, 
sum(no_of_adults) + sum(no_of_children) as Total_Adults_and_Childerns
from hotel;

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/063762cb-d83a-446c-9bd7-b57c2b216ca3)

-- 11. What is the average number of weekend nights for reservations involving children?

select AVG(no_of_weekend_nights) as Total_Weekend_Nights_Reservations
from hotel
where no_of_children > 0;

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/d4313cc4-444d-4cb3-85d6-457f1057f56c)

-- 12. How many reservations were made in each month of the year?

select month(str_to_date(arrival_date, '%d-%m-%Y')) as Reservation_Month, 
count(Booking_ID) as Number_Reservations
from hotel
where year(str_to_date(arrival_date, '%d-%m-%Y')) = 2017 or 2018
group by month(str_to_date(arrival_date, '%d-%m-%Y'))
order by Reservation_Month;

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/5898d2cc-259b-4577-beff-08a26c98fd2c)

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type? 

select room_type_reserved as Room_Type, 
Avg(no_of_weekend_nights) as Weekends,
AVG(no_of_week_nights) as WeekDays
from hotel
group by room_type_reserved
order by Weekends, WeekDays;

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/ad8ad7ce-2e0a-43b6-8bba-aebfd1e78e6d)

-- 14. For reservations involving children, what is the most common room type, and what is the average
-- price for that room type? 

select room_type_reserved, 
count(*) as Total_Count, 
avg(avg_price_per_room) as Avg_Price
from hotel
where no_of_children > 0
group by room_type_reserved
order by Total_Count desc limit 1;

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/abe23aa4-215e-4019-8d0a-7b94ea7ddd7c)

-- 15. Find the market segment type that generates the highest average price per room. 

select market_segment_type, 
avg(avg_price_per_room) as AVG_Price
from hotel
group by market_segment_type
order by AVG_Price desc limit 1;

![image](https://github.com/Ushashree441997/HotelReservationAnalysis_SQLProject/assets/69711495/c27e7b3f-ce83-4d80-9394-8c836c64390d)

# Conclusion 
Popular Meal Plans and Room Types: Meal Plan 1 and Room Type 1 were the most preferred choices among guests.

Family Reservations: Families tend to book rooms at a slightly higher average price, with Room Type 4 being the most common choice.

Lead Time Variability: The lead time for reservations varied significantly, from last-minute bookings to those planned nearly a year in advance.

Market Segment Analysis: The Online market segment not only had the highest number of reservations but also generated the highest average room prices.


