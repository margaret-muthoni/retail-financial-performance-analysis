SELECT
    strftime('%Y-%m', OrderDate) AS Month,

    COUNT(*) AS TransactionCount,

    COUNT(DISTINCT OrderID) AS OrderCount,

    SUM(Quantity) AS UnitsSold,

    ROUND(
        SUM(Quantity * UnitPrice * (1 - DiscountPct)), 2
    ) AS TotalRevenue,

    ROUND(
        SUM(Quantity * UnitPrice * (1 - DiscountPct))
        / COUNT(DISTINCT OrderID), 2
    ) AS AverageRevenuePerOrder

FROM sales

GROUP BY strftime('%Y-%m', OrderDate)

ORDER BY Month ASC;