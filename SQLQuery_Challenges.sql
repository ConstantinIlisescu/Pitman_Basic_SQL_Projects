---Sellect distinct(different) value - no dublicate 
SELECT DISTINCT FirstName
FROM Person.Person;

--- The SELECT TOP clause is used to specify the number of records to return. Returning a large number of records can impact performance.
SELECT TOP 100 *
FROM Person.Person
WHERE MiddleName = 'B'

---The MIN() function returns the smallest value of the selected column.
SELECT MIN(AverageRate) AS SmallestAverageRate
FROM  Sales.CurrencyRate

---The MAX() function returns the largest value of the selected column.
SELECT MAX(AverageRate) AS LargestAverageRate
FROM  Sales.CurrencyRate

/*The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
	There are two wildcards often used in conjunction with the LIKE operator:
		The percent sign (%) represents zero, one, or multiple characters
		The underscore sign (_) represents one, single character
*/
SELECT *
FROM Sales.CurrencyRate
WHERE ToCurrencyCode LIKE 'A%'

/*   []	Represents any single character within the brackets 
		h[oa]t finds hot and hat, but not hit
		h[!oa]t finds hit, but not hot and hat*/

SELECT *
FROM Person.Person
WHERE LastName LIKE 'M[oc]%'


/*	The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
	The BETWEEN operator is inclusive: begin and end values are included. */
SELECT *
FROM Person.Person
WHERE FirstName BETWEEN 'A' AND 'C'
