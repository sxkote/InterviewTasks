--Правильный ответ:
SELECT 
	c.Title, COALESCE(SUM(d.Amount * p.Price), 0) AS Total
FROM 
	Client AS c 
	LEFT OUTER JOIN [Order] AS o ON c.ClientID = o.ClientID AND o.Date = '2016-01-14'
	LEFT OUTER JOIN OrderDetails AS d ON d.OrderID = o.OrderID 
	LEFT OUTER JOIN Product AS p ON d.ProductID = p.ProductID
GROUP BY c.ClientID, c.Title



--Еще один возможный ответ:
SELECT 
    c.Title, SUM(COALESCE(p.Price * od.Amount,0)) AS 'Total'
FROM 
    Client AS c 
    LEFT OUTER JOIN [Order] AS o ON c.ClientID = o.ClientID
    LEFT OUTER JOIN OrderDetails AS od ON o.OrderID = od.OrderID
    LEFT OUTER JOIN Product AS p ON p.ProductID = od.ProductID
WHERE
    o.Date = '2016-01-14' OR o.Date IS NULL
GROUP BY
    c.ClientID,
    c.Title
