

PRINT 'Hello World!'

DECLARE @myVariable INT
SET @myVariable = 6
PRINT @myVariable

DECLARE @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5
--PRINT 'Having fun with' + ' TSQL and MS SQL SERVER!'
--PRINT 'I have ' + CONVERT(VARCHAR(50), @var1) + ' dollars...'


DECLARE @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5

PRINT CHAR(9) + 'I have ' + CONVERT(VARCHAR(50), @var1) + CHAR(13) + ' dollars...'
PRINT 'Variable 1 = ' + CONVERT(VARCHAR(5), @var1) + CHAR(13) + 'Variable 2 = ' + CONVERT(VARCHAR(5), @var2)
PRINT 'Variable 1 = ' + CONVERT(VARCHAR(5), @var1) + CHAR(13) + 'Variable 2 = ' + CONVERT(VARCHAR(5), @var2) + CHAR(13) + 'Total: ' + CONVERT(VARCHAR(50), @var1 + @var2)
/*CHAR(9) is the TAB key / CAHR(13) is the ENTER key - ASCII*/

IF @var1 <= 3
	BEGIN
		PRINT 'Variable 1 <= ' + CONVERT(VARCHAR(5), @var1) + CHAR(13)
	END
ELSE
	BEGIN
		PRINT 'Variable 1 is not < ' + CONVERT(VARCHAR(5), @var1) + CHAR(13)
	END

IF @var1 !=3
	BEGIN
		PRINT 'Variable 1 is NOT < ' + CONVERT(VARCHAR(5), @var1) + CHAR(13)
	END
ELSE
	BEGIN
		PRINT 'Variable 1 is not< ' + CONVERT(VARCHAR(5), @var1) + CHAR(13)
	END


DECLARE @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5
IF @var1 < 2
	BEGIN
		PRINT '@var1 < 2'
	END
ELSE IF @var1 > 1 AND @var1 < 3
	BEGIN
		PRINT '@var1 > 1 AND @var1 < 3'
	END
ELSE IF @var1 = 4 OR @var1 < 6
	BEGIN
		PRINT '@var1 = 4 OR @var1 < 6'
	END
ELSE
	PRINT '@var1 does not qualify!'


