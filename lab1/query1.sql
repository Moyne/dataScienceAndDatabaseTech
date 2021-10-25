SELECT DISTINCT F.ID_phoneRate,T.DateYear,   SUM(F.Price) OVER(PARTITION BY F.ID_phoneRate,T.DateYear) AS yearly_Income_phoneRate,
                                    SUM(F.Price) OVER(PARTITION BY F.ID_phoneRate) AS total_Income_phoneRate,
                                    SUM(F.Price) OVER() AS total_income,
                                    SUM(F.Price) OVER(PARTITION BY T.DateYear) AS yearly_income
FROM FACTS F,TIMEDIM T
WHERE T.ID_time=F.ID_time
ORDER BY F.ID_phoneRate
