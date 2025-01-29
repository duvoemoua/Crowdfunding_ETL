# Crowdfunding_ETL
Project 2


Create the Category and Subcategory DataFrames

Get Column info:
After running the initial provided code to import pandas, numpy and to read the crowdfunding excel file, I used the .info() function to get a brief summary of the crowdfunding_info dataframe created. In the following cell I used the columns function to get the columns from the dataframe as well. 

Creating Category and Subcategory columns:
After creating the initial dataframe and getting the column information you can see that there is 1 column called 'category & sub-category' that should be split into 2 seperate columns within the dataframe. Each value in that column has a category and subcategory split between a '/'. With that in mind I decided to split each string value in the column using the split function on each '/'. So I used my current dataframe (crowdfunding_info_df) and created 2 new columns 'category' and 'subcategory'.

After creating the 2 seperate columns I created a categories and subcategories varible and used the .unique() function to get the unique values in each column. 

Then after running the provided code we should be able to see that there are 9 distinct values in 'categories' and 24 in 'subcategories' and have 2 arrays created with the variables category_ids with 1-9 and subcategory_ids with 1-24. 

To add 'cat' and 'subcat' to the corresponding array created in the previous cell I defined my variables as cat_ids and subcat_ids and used an f string to format each category_id in category_ids and subcategory_id in subcategory_ids using a list comprehension. 

I then was able to create my cateogry_df and subcategory_df with the ids created with the corresponding category or subcategory which I then exported to CSV files.


Campaign DataFrame

Using the provided code I created a copy of the crowdfunding_info dataframe and named it campaign_df. I renamed the 'blurb', 'launched_at', and 'deadline' columns to 'description', 'launched_date' and 'end_date' respectively in the campaign_df using the rename function. 

To covert the 'goal' and 'pledged' columns to 'float' I used the astype function ('float')and then verified the conversion with campaign_df.dtypes.

To convert 'launch_date' and 'end_date' to datetime format I actually worked on it in class in my breakout room. We used seconds ('s') as the unit and converted the rest to year, month, day.


I then merged my campaign_df and category_df on 'category' since they both had that column. After I then merged my new dataframe (category_merge) with my subcategory_df on subcategory to create a new dataframe called campaign_merge_df.

To drop unwanted columns I created a new dateframe called campaign_cleaned and used the drop funtion to drop the 'staff_pick', 'spotlight', 'category & sub-category' columns. I then exported the dateframe into a CSV file.


Extract the contacts.xlsx Data.

For this section I had quite a bit of issues loading in my data. After working on it in my breakout room with my group it turned out that the header needed to be 3 in order to display the json data correctly in the next cell. So I adjusted the provided code to:

contact_info_df = pd.read_excel('Resources/contacts.xlsx', header=3)

Create the Contacts DataFrame


Option 1: Use Pandas to create the contacts DataFrame

Again this portion I worked on with my group and it was super helpful to see the methods of getting the json data. To iterate I used the iterrows() function to iterate through my index of x through each row in contact_info_df. I stored that data into a data_rows variable and used the json.loads function to parse through the data starting with the first row using row.iloc[0]. I then appended the provided dictionary with my variable data_rows and used the list and value functions to convert the extracted data into a list. 

I then created a columns variable to hold the columns 'contact_id', 'name', and 'email'. After that I created a new dataframe contact_info and checked the datatypes with dtypes. 

To create a "first"name" and "last_name" column from the 'name' column i used the split function to split on the space between the first and last name. I then used the drop function to drop the 'name' column and created a new dataframe called contacts_df_clean and reordered the columns. 


Option 2: Use regex to create the contacts DataFrame.

Referencing the Regex_groups_solution from class, to extract the four-digit contact ID number I created a regex pattern varible 'p'. In my variable I extracted the 4 digits after contact_id with p = r'"contact_id": (\d{4})'.
I then used the extract function and used my variable to extract the contact_id number and put it into its own 'contact_id' column.

Following the same pattern I created a 'p' variable and extracted 'name' with p = r'"name": "([^"]*)"' and extracted 'email' with p = r'"email": "([^"]*)"'. 

Following the same process above I split name into first_name and last _name and dropped columns that werent needed as well as reordered the columns in my new dataframe.

Once that was all finished I exported my dataframe into a new CSV file. 



Creating Crowdfunding_DB

To create the crowd funding DB I first created database diagram using the each csv file exported from my code. I created a contacts table with contact_id as a primary key, a category table with category_id as a primary key, a subcategory table with subcategory_id as a primary key, and finally a campaign table with cf_id as a primary key and contact_id, category_id, and subcategory_id as foreign keys. 

To create my database I started by dropping my tables if they already existed:

--Drop table if exists
DROP TABLE IF EXISTS campaign;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS subcategory;
DROP TABLE IF EXISTS contacts;


Then using my database diagram created I created each table starting with contacts and ending with campaign. I ran all of my code besides the SELECT statements to create my tables.

Finally I imported each csv to its corresponding table starting with contacts and ending with campaign to ensure that each primary key was in place for the campaign table to reference to. From there I could run each select statement to see each table





