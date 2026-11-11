SELECT
    OrderID,
    Product,
    Quantity,
    UnitPrice,
    UnitCost,
    DiscountPct,

    ROUND(Quantity * UnitPrice * (1 - DiscountPct), 2) AS Revenue,

    ROUND(Quantity * UnitCost, 2) AS Cost,

    ROUND(
        (Quantity * UnitPrice * (1 - DiscountPct))
        - (Quantity * UnitCost),
        2
    ) AS GrossProfit

FROM sales
LIMIT 10;