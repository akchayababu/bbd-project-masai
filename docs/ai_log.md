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
SELECT region_name, SUM(total_sales) AS sales
FROM sales
WHERE SUM(total_sales) > 80000
GROUP BY region_name
ORDER BY sales DESC;
I inspected the query against the actual database schema and identified four defects.

No.| Defect| Classification| Correct Fix
1| The query references a "sales" table that does not exist in the provided schema.| Fake method/function| Use the actual "customers" and "orders" tables and join them using "customer_id".
2| The query uses "region_name" and "total_sales", which are not columns in the provided schema.| Logic error| Use "customers.region" and "orders.amount".
3| The query places "SUM(total_sales) > 80000" in the WHERE clause.| Logic error| Use "HAVING SUM(o.amount) > 80000" after grouping.
4| The assistant claims North's revenue grew 38% month over month without supporting evidence.| Phantom statistic| Calculate the actual percentage change using North's September and October revenue from Q11.

Conclusion
The original query should not be accepted without correction. The table and column references must match the actual schema, the aggregate filter must use HAVING, and the claimed 38% growth must be verified against the actual monthly revenue data.
Task 4: Apply the Human-in-the-Loop Protocol — Scenario D1

1. Specification

The objective was to calculate revenue by region using the actual database schema. Revenue must include completed orders only, and the query must retain the $80,000 threshold. The result must be checked against the actual data. The assistant's claim that North's revenue grew by 38% month over month must also be verified.

2. Execution

I inspected the assistant's original SQL query and identified problems with the table name, column names, aggregate function in the WHERE clause, and unsupported 38% growth claim. I wrote a corrected SQL query using the actual customers and orders tables, filtered for completed orders, grouped by region, and used HAVING for the revenue threshold. I saved the query as "sql/d1_corrected.sql" and ran it against the database.

3. Inspection

The corrected query returned exactly two rows: North with revenue of 119300 and South with revenue of 82500. These results match the expected regional revenue values. The query uses the actual schema and applies the completed-order filter and the $80,000 threshold.

4. Verification

I compared North's actual revenue change from 2026-09 to 2026-10 with the assistant's 38% growth claim. The verified month-over-month change is -22.8%, rounded to one decimal place. This indicates a decrease rather than an increase. Therefore, the assistant's claim of 38% growth is contradicted by the data.

5. Decision

Decision: Reject the assistant's original answer because it contains invalid table and column references, an aggregate function in the wrong clause, and an unsupported growth claim. Accept the corrected SQL query because it uses the actual database schema and returns the expected North and South revenue values. Accept the verified -22.8% month-over-month change and reject the unsupported 38% growth claim.

Task 5: Prompt for Scenario D2

Five-Part Prompt

Role: Act as a spreadsheet debugging expert who can diagnose lookup formula errors.

Context: The Products tab contains a table in A1:C10. Column A contains item names, column B contains categories, and column C contains unit prices. Cell G2 on the Orders tab contains the text " Smart watch", which has a leading space. The formula uses VLOOKUP with an exact match and returns an error even though Smart watch exists in the Products table.

Task: Identify the root cause of the lookup error, explain why the formula fails, and provide a corrected formula that returns the unit price for Smart watch.

Constraints: Use the actual formula and cell contents. Preserve exact-match lookup behavior. Do not invent product names or prices. Account for the leading space in the lookup value, and return an appropriate error message if the item is not found.

Format: Provide the diagnosis, the root cause, the repaired formula, and a brief explanation of how the repair works.

Root Cause

The lookup value in G2 contains a leading space before "Smart watch". An exact-match VLOOKUP cannot find a matching item if the lookup text contains an extra space that is not present in the Products table.

Repaired Formula

"=VLOOKUP(TRIM(G2),Products!$A$2:$C$10,3,FALSE)"

The TRIM function removes leading and trailing spaces from G2. VLOOKUP then searches the Products tab's item column and returns the matching unit price from the third column. FALSE preserves exact-match behavior.

If the assignment requires an error message for missing items, use:

"=IFERROR(VLOOKUP(TRIM(G2),Products!$A$2:$C$10,3,FALSE),"unknown item")"

Task 6: Skeptical-Analyst Check on Part C

Prompt

Act as a skeptical data analyst. Review my first recommendation from Part C:

Challenge this recommendation rather than simply agreeing with it. Identify the evidence supporting the recommendation, distinguish correlation from causation, identify missing information, and explain what additional analysis would be needed before making a business decision. Do not invent statistics or assume that the recommendation is correct.

Three Unstated Assumptions
