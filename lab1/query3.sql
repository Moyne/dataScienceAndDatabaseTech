SELECT T.DateMonth, SUM(F.NumberOfCalls) AS monthlyCalls,
                    RANK() OVER(ORDER BY SUM(F.NumberOfCalls) DESC) AS rankCallsMonth
FROM FACTS F,TIMEDIM T
WHERE T.ID_time=F.ID_time AND T.DateYear=2003
GROUP BY T.DateMonth