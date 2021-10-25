1)
SELECT CategoryName,SUM(TotAmount) AS totalSaleAmount, 
		SUM(NumSoldItems) AS soldItems, RANK() OVER(ORDER BY SUM(saleAmount) DESC) AS rankSaleAmount,
		RANK() OVER(ORDER BY SUM(soldItems) DESC) AS rankSoldItems

FROM Category C, Sales S

WHERE C.CategoryID=S.ItemCategoryID

GROUP BY CategoryName,CategoryID

ORDER BY totSalesAmount;
2)
SELECT Province,Region,SUM(TotAmount) AS totSalesAmountProvince,
		RANK() OVER(PARTITION BY Region
					ORDER BY SUM(TotAmount) DESC) AS rankProvinceRegionTotSaleAmount

FROM Customer CU,Sales S

WHERE CU.CustomerID=S.CustomerID

GROUP BY Province,Region;
3)
SELECT Province,Region,Month,SUM(TotAmount) AS totSaleAmountProvinceMonth,
		RANK() OVER(PARTITION BY Month
					ORDER BY SUM(TotAmount) DESC) AS rankSaleAmountProvinceMonth

FROM Customer CU,Time T,Sales S

WHERE CU.CustomerID=S.CustomerID AND S.TimeID=T.TimeID

GROUP BY Province,Region,Month
4)
SELECT Region,Month,SUM(TotAmount) AS totSaleAmountRegionMonth,
		SUM(SUM(TotAmount)) OVER(PARTITION BY Region
					ORDER BY Month
					ROWS UNBOUNDED PRECEDING) AS increasingSaleAmountRegionMonth

FROM Customer CU,Time T,Sales S

WHERE CU.CustomerID=S.CustomerID AND S.TimeID=T.TimeID

GROUP BY Region,Month
