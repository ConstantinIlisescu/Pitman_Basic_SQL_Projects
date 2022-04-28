USE [db_zooTest2]
GO

--CONVERT(VARCHAR(50), @totalHab) -- This is converting the data type from Money to VARCHAR
--CHAR(13) -- Line Break
--CHAR(9) -- Tab Key 

DECLARE @totalHub MONEY;
DECLARE @totalNut MONEY;
DECLARE @results MONEY;

SET @totalHub = (SELECT SUM(habitat_cost) FROM tbl_habitat);
SET @totalNut  = (SELECT SUM(nutrition_cost) FROM tbl_nutrition);
SET @results  = (@totalHub + @totalNut);

PRINT (
	CONVERT(VARCHAR(50), @totalHub)+ ' +' + Char(9) + ' - The Total Habitat Cost' + CHAR(13) +
	CONVERT(VARCHAR(50), @totalNut) + Char(9) + Char(9) + ' - The Total Nutrition Cost ' + CHAR(13) + '---------' + CHAR(13) +
	CONVERT(VARCHAR(50), @results)
);
