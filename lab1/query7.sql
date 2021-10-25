SELECT T.DateMonth,T.DateYear,   SUM(F.NumberOfCalls) AS MonthlyRegionCalls,
                    SUM(SUM(F.NumberOfCalls)) OVER(PARTITION BY T.DateYear,L.Region
                                            ORDER BY T.DateMonth
                                            ROWS UNBOUNDED PRECEDING) AS cumulativeMonthlyRegionCalls
FROM FACTS F,TIMEDIM T, LOCATION L
WHERE T.ID_time=F.ID_time AND F.ID_location_Caller=L.ID_location
GROUP BY T.DateMonth,T.DateYear,L.Region