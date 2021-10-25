SELECT T.DateMonth,T.DateYear,   SUM(F.Price) AS MonthlyIncome,
                    SUM(SUM(F.Price)) OVER(PARTITION BY T.DateYear
                                            ORDER BY T.DateMonth
                                            ROWS UNBOUNDED PRECEDING) AS cumulativeMonthlyIncome
FROM FACTS F,TIMEDIM T
WHERE T.ID_time=F.ID_time 
GROUP BY T.DateMonth,T.DateYear