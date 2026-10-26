1.role
Act as an experienced MySQL data analyst.Write accurate SQL: queries and verify all results against the actual database schema.
2.context
the database contains four tables:
reps,products,customers,and orders.Use the actual column names from the database schema.The reps table contains representative information and monthly targets.The customers table links customers to representatives and regions.The orders table cotains order details,order months,amounts,and order statuses.
3.task
Write the SQL query for part A, question 13,to calculate each representatives monthly revenue and compare it with their monthly target.Assign a performancetier tieach representative for each month.
4.constraints
*Use MySQL syntax.
*Include completed orders only.
*use the actual table and column.
*calculate revenue from the order amount.
*Use the three performance tiers:
Below target,On target,above target.
*Below target means revenue is below the monthly target.
*On target means revenue is at least 110% of the monthly target.
*above target means revenue is at least110% of the monthly target.
*do not use WITH procedures.
*group the reults by representative and order month.
*sort by representative and order month in ascending order.
5.format
return raw SQL only,with brief inline comments explaining the query.do not include explanatory paragraphs outside the SQL code.
