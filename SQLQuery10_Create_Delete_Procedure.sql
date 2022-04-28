USE AdventureWorks
GO

CREATE PROCEDURE dbo.uspGetAddress
AS
SELECT * FROM Person.Address
GO
EXEC DBO.uspGetAddress

DROP PROCEDURE IF EXISTS dbo.uspGetAddress --- To drop multiple procedures, separate them with comma - dbo.procedure 1, dbo.procedure2
GO