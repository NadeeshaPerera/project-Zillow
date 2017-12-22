### BUAN 6320.003 
### Final Project
### GROUP 35

#sql connector
import mysql.connector #Here we import the MySQL Connector in order to connect to MySQL Database

# Read data to variable
cnx = mysql.connector.connect(user = 'scott', password = 'pwd123', database = 'db_project') #gives privileges to the user. necessary authentication is done. 

v_cursor = cnx.cursor()

# sql queries

# 1. Provide a summary of the data that includes the number of cities and number of states
# State wise summary : In this query we are obtaining the number of cities, counties and metros in every state by using COUNT DISTINCT
# Since there are counties, cities and metros with the same name in different states, we have used GROUP BY on state to get correct output.
# We are also trying to find the average price, minimum price and maximum price, average pricepersqft, minimum pricepersqft and maximum
# pricepersqft of each state

v_query_1   = ("SELECT s.state_code AS state, COUNT(DISTINCT cs.city_ID) AS number_cities, "
               "COUNT(DISTINCT cs.county_ID) AS number_counties, "
               "COUNT(DISTINCT cs.metro_ID) AS number_metros, "
               "ROUND(AVG(price),2) as average_price, "
               "ROUND(MIN(price),2) AS minimum_price, "
               "ROUND(MAX(price),2) AS maximum_price, "
               "ROUND(AVG(pricepersqft),2) AS average_price_per_sqft, "
               "ROUND(MIN(pricepersqft),2) AS min_price_per_sqft, "
               "ROUND(MAX(pricepersqft),2) AS max_price_per_sqft "
               "FROM price_summary ps "
               "INNER JOIN city_summary cs ON ps.city_code = cs.city_code "
               "INNER JOIN state AS s ON cs.state_ID = s.ID "
               "INNER JOIN metro AS m ON cs.metro_ID = m.ID "
               "INNER JOIN county AS ct ON cs.county_ID = ct.ID "
               "INNER JOIN city AS c ON cs.city_ID = c.ID "
               "GROUP BY cs.state_ID "
               "ORDER BY s.state_code;")
               

# 2. Determine the average, minimum and maximum rent across the entire dataset
# In this query we are selecting the average of price, minimum of price and maximum of price (all 3 rounded off to 2 decimals)
# by using 'price' which is stored in the 'price_summary' table

v_query_2 = ("SELECT ROUND(AVG(price),2) as average_price, "
             "ROUND(MIN(price),2) AS minimum_price, "
             "ROUND(MAX(price),2) AS maximum_price "
             "FROM price_summary;")


# 3. Determine the average, minimum and maximum price per sq ft across the entire dataset
# In this query we are selecting the average of pricepersqft, minimum of pricepersqft and maximum of pricepersqft (all 3 rounded off to 2 decimals)
# by using 'pricepersqft' which is stored in the 'price_summary' table

v_query_3 = ("SELECT ROUND(AVG(pricepersqft),2) AS average_price_per_sqft, "
             "ROUND(MIN(pricepersqft),2) AS min_price_per_sqft, "
             "ROUND(MAX(pricepersqft),2) AS max_price_per_sqft "
             "FROM price_summary;")

# 4. What is the average rent in the CA state
# Assume the overall average of all city codes belonging to CA across all 75 months is being asked.
# In this query we are using "AVG" to obtain the average of 'price' (which gives the average rent), from the 'price_summary' table.
# In order to obtain the value of only 'CA', we have included the condition in the WHERE clause.

v_query_4 = ("SELECT ROUND(AVG(price),2) AS average_rent "
             "FROM price_summary AS ps "
             "INNER JOIN city_summary AS cs ON ps.city_code = cs.city_code "
             "INNER JOIN state AS s ON cs.state_ID = s.ID "
             "WHERE s.state_code = 'CA';")


# 5. How many metros have rent higher than the above average
# Assume "the above average" refers to the average rent in 'CA' state calculated in Question 4.
# Here we find the metros in the entire data that have an average rent higher than the average of "California" state.
# COUNT (*) counts all the metros that fulfill the subquery; which is Average price of each metro in California to be higher than average price of "California" as a state
# The data is grouped as per both state and metro in the "GROUP BY" clause to avoid the grouping of different metros with same name in different states

v_query_5 = ("SELECT COUNT(*) AS number_of_metros "
             "FROM ("
             "SELECT s.state_code AS State, m.metro_name AS Metro, AVG(ps.price) AS Avg_price "
             "FROM price_summary AS ps "
             "INNER JOIN city_summary AS cs ON ps.city_code = cs.city_code "
             "INNER JOIN state AS s ON cs.state_ID = s.ID "
             "INNER JOIN metro AS m ON cs.metro_ID = m.ID "
             "GROUP BY cs.state_ID, cs.metro_ID "
             "HAVING Avg_price > (SELECT AVG(price) AS avg_rent_CA "
             "FROM price_summary AS ps "
             "INNER JOIN city_summary AS cs ON ps.city_code = cs.city_code "
             "INNER JOIN state AS s ON cs.state_ID = s.ID "
             "WHERE s.state_code = 'CA')) mySubQuery;")


# 6. What are the names of the metros and the cities they are in
# Assume this refers to the names of number of metros calculated in Question 5.
# Returns the name of the metros and the cities that they belong to if the above condition is fulfilled
# HAVING clause checks whether the condition average price > average price in "California" is satisfied
# The data is grouped as per both state and metro in the "GROUP BY" clause to avoid the grouping of different metros with same name in different states

v_query_6 = ("SELECT m.metro_name AS Metro, c.city_name AS City, "
             "ROUND(AVG(ps.price),2) AS Avg_price "
             "FROM price_summary AS ps "
             "INNER JOIN city_summary AS cs ON ps.city_code = cs.city_code "
             "INNER JOIN state AS s ON cs.state_ID = s.ID "
             "INNER JOIN metro AS m ON cs.metro_ID = m.ID "
             "INNER JOIN city AS c ON cs.city_ID = c.ID "
             "GROUP BY cs.state_ID, cs.metro_ID "
             "HAVING Avg_price > (SELECT AVG(price) AS avg_rent_CA "
             "FROM price_summary AS ps "
             "INNER JOIN city_summary AS cs ON ps.city_code = cs.city_code "
             "INNER JOIN state AS s ON cs.state_ID = s.ID "
             "WHERE s.state_code = 'CA');")

# 7. Which metros in the state had the highest increase in rent between September 2015 and September 2016
# In this query we have considered percentage increase in price for the metros in California. 
# We are creating a temporary table called 'max_table' that returns the metro name with the percentage 
# increase in rent between the month of September 2015 and September 2016 for the state of California. 
# The column 'incprice' stores the percentage increase in price in the 'max_table'.
# The MAX of incprice is selected and rounded off to 2 and displayed alongwith its corresponding metro name. 

v_query_7 = ("SELECT max_table.metro_name, "
             "CONCAT(ROUND(MAX(incprice)*100, 2), '%') AS max_increase "
             "FROM ( "
             "SELECT m1.metro_name, "
             "(SUM(IF(ps1.month_ID = 9 AND ps1.year_1 = 2016, ps1.price, 0)) - SUM(IF(ps1.month_ID = 9 AND ps1.year_1 = 2015, ps1.price, 0)))/SUM(IF(ps1.month_ID = 9 AND ps1.year_1 = 2015, ps1.price, 0)) AS incprice "
             "FROM price_summary ps1 "
             "INNER JOIN city_summary cs1 ON ps1.city_code = cs1.city_code "
             "INNER JOIN state s1 ON cs1.state_ID = s1.ID "
             "INNER JOIN metro m1 ON cs1.metro_ID = m1.ID "
             "WHERE s1.state_code = 'CA' "
             "GROUP BY cs1.state_ID, cs1.metro_ID "
             "ORDER BY incprice DESC "
             ") AS max_table;")
             


# Execute v_query_1

print("\n\nQuestion 1: Provide a summary of the data that includes the number of cities and number of states\n")

print("State level summary: \n\nData in the following order\n")
 
print("State, cities, counties, metros, city codes, Overall average price, Overall minimum price, Overall maximum price, Overall average of price per sqft, Overall minimum price per sqft, Overall maximum price per sqft")

v_cursor.execute(v_query_1)

row = v_cursor.fetchall()

for i in row:
    print (i[0:11])


# Execute v_query_2

v_cursor.execute(v_query_2)


for(average_price, minimum_price, maximum_price) in v_cursor:
    print("\n\nQuestion 2: Determine the average, minimum and maximum rent across the entire dataset\n\nOverall average price: {}\nOverall minimum price {}\nOverall maximum price {}\n\n".format
          (average_price, minimum_price, maximum_price))


# Execute v_query_3

v_cursor.execute(v_query_3)


for(average_price_per_sqft, min_price_per_sqft, max_price_per_sqft) in v_cursor:
    print("\n\nQuestion 3: Determine the average, minimum and maximum price per sq ft across the entire dataset\n\nOverall average price per sqft {}\nOverall minimum price per sqft {}\nOverall maximum price per sqft {}\n\n".format
          (average_price_per_sqft, min_price_per_sqft, max_price_per_sqft))


# Execute v_query_4

print("\n\nQuestion 4: What is the average rent in the CA state\n")

v_cursor.execute(v_query_4)

row2 = v_cursor.fetchall()
print (row2[0])

# Execute v_query_5

print("\n\nQuestion 5: How many metros have rent higher than the above average\n")

v_cursor.execute(v_query_5)

row3 = v_cursor.fetchall()

print(row3[0])


# Execute v_query_6

v_cursor.execute(v_query_6)

print("\n\nQuestion 6: What are the names of the metros and the cities they are in\n\nData is in the folowing order\nMetro: , City: , Average price: \n\n")

row4 = v_cursor.fetchall()

for i in row4:
    print (i[0:3])


# Execute v_query_7

v_cursor.execute(v_query_7)

print("\n\nQuestion 7: Which metro(s) in the state had the highest increase in rent between September 2015 and September 2016\n\nData is in the folowing order:\nMetro: , Highest % increase in rent: \n")

row5 = v_cursor.fetchall()

for i in row5:
    print (i[0:3])


v_cursor.close()
cnx.close()

