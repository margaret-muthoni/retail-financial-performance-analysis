SELECT
    Category,

    COUNT(DISTINCT OrderID) AS TotalOrders,

    SUM(Quantity) AS UnitsSold,

    ROUND(
        SUM(Quantity * UnitPrice * (1 - DiscountPct)), 2
    ) AS TotalRevenue,

    ROUND(
        SUM(Quantity * UnitCost), 2
    ) AS TotalCost,

    ROUND(
        SUM(
            (Quantity * UnitPrice * (1 - DiscountPct))
            - (Quantity * UnitCost)
        ), 2
    ) AS GrossProfit,

    ROUND(
        SUM(
            (Quantity * UnitPrice * (1 - DiscountPct))
            - (Quantity * UnitCost)
        )
        / SUM(Quantity * UnitPrice * (1 - DiscountPct)) * 100,
        2
    ) AS GrossMarginPct

FROM sales

GROUP BY Category

ORDER BY GrossProfit DESC;