# Customers_DataCleaning
## MySql project  

 ### Project Overview  
 
This project demonstrates a structured approach to cleaning a customer data table using SQL. The key steps include removing duplicates, standardizing data fields, handling null or blank values, and removing unnecessary columns. This process ensures that the dataset is consistent, reliable, and ready for further analysis.  


### Dataset  

The project works with a dataset called customers_details that contains various attributes related to customer information such as customer number, name, contact details, address, and credit limits.  


### Key Objectives  

Clean and preprocess customer data using SQL.
Ensure the data is consistent and ready for use in analysis or reporting.
Steps Involved in Data Cleaning  

### Remove Duplicates:  

Duplicates are removed based on multiple columns including customerNumber, customerName, and other relevant fields.
A ROW_NUMBER() function is used to identify and remove duplicate rows.  

#### with duplicate_cte as (
    select *, row_number() over (
        partition by customerNumber, customerName, contactfirstname, contactlastname, phone, addressline1, city, state, postalcode, country, salesrepemployeenumber, creditlimit
    ) as row_num
    from customers_details
)  select * 
from duplicate_cte
where row_num = 1;

### Standardize the Data:  

Trim any unnecessary whitespace from fields like contactfirstname, customername, addressline1, city, and phone.
Remove dots and spaces from phone numbers.  

**update customers_details
set contactfirstname = trim(contactfirstname);**  

**update customers_details
set phone = trim(replace(phone, ' ', ''));**  

**update customers_details
set phone = trim(replace(phone, '.', ''));**  

### Handle Null or Blank Values:  

Since the dataset's important columns don't have null or blank values, no specific updates were necessary for this step.  

### Remove Unnecessary Columns:  

Dropped addressLine2 as it was deemed unnecessary for the analysis.  

**ALTER TABLE customers_details
DROP COLUMN addressLine2;**  

### How to Use the Project  

**Prerequisites**  

You need a SQL database (e.g., MySQL or any other RDBMS) to run the scripts provided in this project.  

**Instructions**  

1)Clone the repository and open the SQL script file Data_Cleaning.sql.  

2)Execute the SQL queries step by step in your SQL environment.  

3)The cleaned dataset will be saved back into the customers_details table for further use.
