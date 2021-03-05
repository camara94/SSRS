USE AdventureWorks2014;
GO

SELECT LEFT(LastName, 1) as PremiereLettre
FROM Person.Person
GROUP BY LEFT(LastName, 1)
ORDER BY PremiereLettre;