-- SQL project cleaning data

select * from customers_details;

-- creating new table and adding details of existing table into that.

create table customers_details
like customers;

insert customers_details
select*
from customers;


-- Four steps of cleaning data
-- 1)Remove Duplicate
-- 2)Standardize the Data
-- 3)Null Values or Blank Values
-- 4)Remove Any Columns


-- 1)Remove Duplicates

select * ,row_number() over(
partition by customerNumber,customerName,contactfirstname,contactlastname,phone,addressline1,city,state,postalcode,country,salesrepemployeenumber,creditlimit) as row_num
from customers_details;

with duplicate_cte as 
(select * ,row_number() over(
partition by customerNumber,customerName,contactfirstname,contactlastname,phone,addressline1,city,state,postalcode,country,salesrepemployeenumber,creditlimit) as row_num
from customers_details)
select * 
from duplicate_cte
where row_num =1;

-- 2)Standardize the Data

select *
from customers_details;

update customers_details
set contactfirstname= trim(contactfirstname);

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;

update customers_details
set customername= trim(customername);

update customers_details
set addressline1 = trim(addressline1);

update customers_details
set city = trim(city);

update customers_details
set phone = trim(replace(phone,' ',''));

update customers_details
set phone = trim(replace(phone,'.',''));

-- 3) Remove Null value and Blank values
-- In This dataset important columns are not null and blank.So we are not updating anything.

-- 4)Remove unnecessary columns

ALTER TABLE customers_details
DROP COLUMN addressLine2;

select *
from customers_details;