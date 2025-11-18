# Month-over-Month (MoM) Sales Analysis Using SQL

## Project Overview

This project demonstrates how to calculate **Month-over-Month sales performance** using SQL. The analysis includes calculating absolute changes and percentage changes between consecutive months, and visualizing the results in Excel.

## Steps Taken

1. **Inspect Raw Data**  
   - Pulled `OrderDate` and `Sales` to understand data structure.

2. **Aggregate Sales by Month**  
   - Used `YEAR(OrderDate)` and `MONTH(OrderDate)` to group sales per month.  
   - Ensured future-proofing for multi-year data.

3. **Use LAG() for Previous Month Sales**  
   - Applied a **window function** to retrieve the previous month’s total for comparison.

4. **Calculate MoM Change and MoM Percentage**  
   - `MoM_Change` = CurrentMonthSales - PreviousMonthSales  
   - `MoM_Perc` = ((CurrentMonthSales - PreviousMonthSales) / PreviousMonthSales) * 100  
   - Negative percentages indicate a decline, which is expected in real-world data.

5. **Visualize in Excel**  
   - Exported SQL output to Excel  
   - Created a proper date column  
   - Plotted a line chart showing MoM trends, including growth and decline

## Files Included

- `MoM_Analysis.sql` — Final SQL script with comments  
- `screenshots/` — Step-by-step screenshots  
- `MoM_Chart.xlsx` (optional) — Excel chart of MoM trends

## Key Learnings

- Window functions (`LAG`) are powerful for comparing sequential data  
- MoM percentage can be positive or negative — both are meaningful  
- Aggregating with year + month avoids mixing months from different years  
- Visualizing results helps interpret and communicate insights

## Author

Daniel Sampson
