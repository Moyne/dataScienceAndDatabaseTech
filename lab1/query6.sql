SELECT DISTINCT T.DateMonth,F.ID_phoneRate,  SUM(F.Price) OVER() AS totalIncome,
                                    SUM(F.Price) OVER(PARTITION BY T.DateMonth)/SUM(F.Price) OVER() AS percentageMonth,
                                    SUM(F.Price) OVER(PARTITION BY F.ID_phoneRate)/SUM(F.Price) OVER () AS percentagePhoneRate
FROM FACTS F,TIMEDIM T
WHERE T.ID_time=F.ID_time AND T.DateYear=2003