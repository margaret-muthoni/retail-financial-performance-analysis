WITH CustomerRevenue AS (
    SELECT
        Customer,
        SUM(Quantity * UnitPrice * (1 - DiscountPct)) AS Revenue
    FROM sales
    GROUP BY Customer
),

TopCustomers AS (
    SELECT
        Customer,
        Revenue
    FROM CustomerRevenue
    ORDER BY Revenue DESC
    LIMIT 5
)

SELECT
    Customer,
    ROUND(Revenue, 2) AS CustomerRevenue,
    ROUND(
        Revenue / (SELECT SUM(Revenue) FROM sales) * 100,
        2
    ) AS RevenueContributionPct

FROM TopCustomers
ORDER BY Revenue DESC;