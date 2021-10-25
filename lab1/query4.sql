SELECT T.DayDate,   SUM(F.Price) AS DailyIncome,
                    AVG(SUM(F.Price)) OVER(ORDER BY T.DayDate
                                            ROWS 2 PRECEDING) AS average3daysIncome
FROM FACTS F,TIMEDIM T
WHERE T.ID_time=F.ID_time AND T.DateMonth='20-LUG-03'
GROUP BY T.DayDate