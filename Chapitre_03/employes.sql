USE AdventureWorks2014;
GO

SELECT 
	e1.BusinessEntityID,
	COALESCE(e2.BusinessEntityID, 0) as BossBusinessEntityID,
	COALESCE(p1.Title + ' ', '') + p1.FirstName + ' ' + p1.LastName as Nom,
	e1.[JobTitle] as Job,
	COALESCE(e2.OrganizationNode.GetLevel(), 0) as Niveau
FROM Person.Person p1
JOIN HumanResources.Employee e1 ON p1.BusinessEntityID = e1.BusinessEntityID
LEFT JOIN HumanResources.Employee e2 ON e1.OrganizationNode.GetAncestor(1) = e2.OrganizationNode
ORDER BY Niveau;