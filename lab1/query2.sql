SELECT T.DateMonth,        SUM(F.NumberOfCalls) AS monthlyCalls,
                                    SUM(F.Price) AS monthlyIncome,
                                    RANK() OVER(ORDER BY SUM(F.Price) DESC) AS rankIncomeMonth
FROM FACTS F,TIMEDIM T
WHERE T.ID_time=F.ID_time
GROUP BY T.DateMonth