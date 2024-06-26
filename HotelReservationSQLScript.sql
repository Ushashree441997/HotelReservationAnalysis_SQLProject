use project;

select * from hotel;

-- 1. What is the total number of reservations in the dataset?
select count(*) as Total_Reservations
from hotel;

-- 2. Which meal plan is the most popular among guests? 
select type_of_meal_plan, count(*) as Mealtype_Count
from hotel
group by type_of_meal_plan
order by Mealtype_Count desc;

-- 3. What is the average price per room for reservations involving children?
select AVG(avg_price_per_room) as AVG_PRICE_PER_ROOM
from hotel 
where no_of_children > 0;

-- 4. How many reservations were made for the year 2016? 
select count(Booking_ID) as Total_Reservation
from hotel
where year(str_to_date(arrival_date, '%d-%m-%Y')) = 2018;

-- 5. What is the most commonly booked room type?
select room_type_reserved, count(booking_id) as Common_Room_Booktype
from hotel
group by room_type_reserved
order by Common_Room_Booktype desc limit 1;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? 
select count(booking_id) 
from hotel
where no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations? 
select min(lead_time) as Lowest_Leadtime, 
max(lead_time) as Highest_Leadtime
from hotel;

-- 8. What is the most common market segment type for reservations? 
select market_segment_type, 
count(booking_id) as common_marget_type
from hotel
group by market_segment_type
order by common_marget_type desc limit 1;

-- 9. How many reservations have a booking status of "Confirmed"? 
select count(*) as Total_Number_of_Reservations
from hotel
where booking_status = 'Not_Canceled';

-- 10. What is the total number of adults and children across all reservations? 
select sum(no_of_adults) as Total_Adults, 
sum(no_of_children) as Total_Childern, 
sum(no_of_adults) + sum(no_of_children) as Total_Adults_and_Childerns
from hotel;

-- 11. What is the average number of weekend nights for reservations involving children?
select AVG(no_of_weekend_nights) as Total_Weekend_Nights_Reservations
from hotel
where no_of_children > 0;

-- 12. How many reservations were made in each month of the year?
select month(str_to_date(arrival_date, '%d-%m-%Y')) as Reservation_Month, 
count(Booking_ID) as Number_Reservations
from hotel
where year(str_to_date(arrival_date, '%d-%m-%Y')) = 2017 or 2018
group by month(str_to_date(arrival_date, '%d-%m-%Y'))
order by Reservation_Month;

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type? 
select room_type_reserved as Room_Type, 
Avg(no_of_weekend_nights) as Weekends,
AVG(no_of_week_nights) as WeekDays
from hotel
group by room_type_reserved
order by Weekends, WeekDays;

-- 14. For reservations involving children, what is the most common room type, and what is the average
-- price for that room type? 
select room_type_reserved, 
count(*) as Total_Count, 
avg(avg_price_per_room) as Avg_Price
from hotel
where no_of_children > 0
group by room_type_reserved
order by Total_Count desc limit 1;

-- 15. Find the market segment type that generates the highest average price per room. 
select market_segment_type, 
avg(avg_price_per_room) as AVG_Price
from hotel
group by market_segment_type
order by AVG_Price desc limit 1;