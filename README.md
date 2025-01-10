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

I then created the columns 'contact_id', 'name', and 'email' to store the data and created a new dataframe contact_info. I checked the datatypes with dtypes. 





