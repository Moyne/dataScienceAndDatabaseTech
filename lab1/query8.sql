SELECT DISTINCT T.DateMonth,F.ID_phoneRate,L1.Region AS callerRegion,L2.Region AS receiverRegion, SUM(SUM(F.Price)) OVER(PARTITION BY T.DateMonth) AS totalIncomeMonth,
        SUM(SUM(F.Price)) OVER(PARTITION BY T.DateMonth,F.ID_phoneRate,L1.Region) AS totalIncomeMonthCallerRegionPhoneRate,
        SUM(SUM(F.Price)) OVER(PARTITION BY T.DateMonth,F.ID_phoneRate,L2.Region) AS totalIncomeMonthReceiverRegionPhoneRate
FROM FACTS F,TIMEDIM T, LOCATION L1,LOCATION L2
WHERE T.ID_time=F.ID_time AND F.ID_location_Caller=L1.ID_location AND F.ID_location_Receiver=L2.ID_location AND T.DateYear=2003
GROUP BY T.DateMonth,F.ID_phoneRate,L1.Region,L2.Region