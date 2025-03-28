if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Paging_Asc_Desc]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Paging_Asc_Desc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Paging_Cursor]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Paging_Cursor]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Paging_RowCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Paging_RowCount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Paging_SubQuery]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Paging_SubQuery]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE Paging_Asc_Desc (
@Tables varchar(1000),
@PK varchar(100),
@Sort varchar(200) = NULL,
@PageNumber int = 1,
@PageSize int = 10,
@Fields varchar(1000) = '*',
@Filter varchar(1000) = NULL,
@Group varchar(1000) = NULL)
AS

/*Find the @PK type*/
DECLARE @PKTable varchar(100)
DECLARE @PKName varchar(100)
DECLARE @type varchar(100)
DECLARE @prec int

IF CHARINDEX('.', @PK) > 0
	BEGIN
		SET @PKTable = SUBSTRING(@PK, 0, CHARINDEX('.',@PK))
		SET @PKName = SUBSTRING(@PK, CHARINDEX('.',@PK) + 1, LEN(@PK))
	END
ELSE
	BEGIN
		SET @PKTable = @Tables
		SET @PKName = @PK
	END

SELECT @type=t.name, @prec=c.prec
FROM sysobjects o 
JOIN syscolumns c on o.id=c.id
JOIN systypes t on c.xusertype=t.xusertype
WHERE o.name = @PKTable AND c.name = @PKName

IF CHARINDEX('char', @type) > 0
   SET @type = @type + '(' + CAST(@prec AS varchar) + ')'

DECLARE @strPageSize varchar(50)
DECLARE @strRows varchar(50)
DECLARE @strFilter varchar(8000)
DECLARE @strGroup varchar(8000)
DECLARE @strSortColumn varchar(4000)
DECLARE @strSortDesc varchar(4000)

/*Default Sorting*/
IF @Sort IS NULL
	SET @Sort = @PK

/*Set sorting variables.*/	
IF CHARINDEX('DESC',@Sort)>0
	BEGIN
		SET @strSortDesc = REPLACE(@Sort, 'DESC', 'ASC')
		SET @strSortColumn = ', ' + REPLACE(@Sort, 'DESC', '')
	END
ELSE
	BEGIN
		IF CHARINDEX('ASC', @Sort) = 0
			BEGIN
				SET @strSortDesc = @Sort + ' DESC'
				SET @strSortColumn = ', ' + @Sort
			END
		ELSE
			BEGIN
				SET @strSortDesc = REPLACE(@Sort, 'ASC', 'DESC')
				SET @strSortColumn = ', ' + REPLACE(@Sort, 'ASC', '')
			END
	END
IF @Sort = @PK
	SET @strSortColumn = ''

/*Default Page Number*/
IF @PageNumber < 1
	SET @PageNumber = 1
	
/*Set paging variables.*/
SET @strPageSize = CONVERT(varchar(50), @PageSize)
SET @strRows = CONVERT(varchar(50), (@PageSize * (@PageNumber - 1) + @PageSize))

/*Set filter & group variables.*/
IF @Filter IS NOT NULL AND @Filter != ''
	BEGIN
		SET @strFilter = ' WHERE ' + @Filter + ' '
	END
ELSE
	BEGIN
		SET @strFilter = ''
	END
IF @Group IS NOT NULL AND @Group != ''
	SET @strGroup = ' GROUP BY ' + @Group + ' '
ELSE
	SET @strGroup = ''

/*Execute dynamic query*/	
EXEC(
'DECLARE @tblPK TABLE (
            PK  ' + @type + ' NOT NULL PRIMARY KEY
            )

INSERT INTO @tblPK SELECT TOP ' + @strPageSize + ' ' + @PK + ' FROM (SELECT TOP ' + @strRows + ' ' + @PK + @strSortColumn + ' FROM ' + @Tables + @strFilter + ' ' + @strGroup + ' ORDER BY ' + @Sort + ') AS ' + @PKTable + ' ORDER BY ' + @strSortDesc + '

SELECT ' + @Fields + ' FROM ' + @Tables + ' JOIN @tblPK tblPK ON ' + @PK + ' = tblPK.PK ' + @strFilter + ' ' + @strGroup + ' ORDER BY ' + @Sort
)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE Paging_Cursor (
@Tables varchar(1000),
@PK varchar(100),
@Sort varchar(200) = NULL,
@PageNumber int = 1,
@PageSize int = 10,
@Fields varchar(1000) = '*',
@Filter varchar(1000) = NULL,
@Group varchar(1000) = NULL)
AS

/*Find the @PK type*/
DECLARE @PKTable varchar(100)
DECLARE @PKName varchar(100)
DECLARE @type varchar(100)
DECLARE @prec int

IF CHARINDEX('.', @PK) > 0
	BEGIN
		SET @PKTable = SUBSTRING(@PK, 0, CHARINDEX('.',@PK))
		SET @PKName = SUBSTRING(@PK, CHARINDEX('.',@PK) + 1, LEN(@PK))
	END
ELSE
	BEGIN
		SET @PKTable = @Tables
		SET @PKName = @PK
	END

SELECT @type=t.name, @prec=c.prec
FROM sysobjects o 
JOIN syscolumns c on o.id=c.id
JOIN systypes t on c.xusertype=t.xusertype
WHERE o.name = @PKTable AND c.name = @PKName

IF CHARINDEX('char', @type) > 0
   SET @type = @type + '(' + CAST(@prec AS varchar) + ')'

DECLARE @strPageSize varchar(50)
DECLARE @strStartRow varchar(50)
DECLARE @strFilter varchar(1000)
DECLARE @strGroup varchar(1000)

/*Default Sorting*/
IF @Sort IS NULL OR @Sort = ''
	SET @Sort = @PK

/*Default Page Number*/
IF @PageNumber < 1
	SET @PageNumber = 1

/*Set paging variables.*/
SET @strPageSize = CAST(@PageSize AS varchar(50))
SET @strStartRow = CAST(((@PageNumber - 1)*@PageSize + 1) AS varchar(50))

/*Set filter & group variables.*/
IF @Filter IS NOT NULL AND @Filter != ''
	SET @strFilter = ' WHERE ' + @Filter + ' '
ELSE
	SET @strFilter = ''
IF @Group IS NOT NULL AND @Group != ''
	SET @strGroup = ' GROUP BY ' + @Group + ' '
ELSE
	SET @strGroup = ''
	
/*Execute dynamic query*/	
EXEC(
'DECLARE @PageSize int
SET @PageSize = ' + @strPageSize + '

DECLARE @PK ' + @type + '
DECLARE @tblPK TABLE (
            PK  ' + @type + ' NOT NULL PRIMARY KEY
            )

DECLARE PagingCursor CURSOR DYNAMIC READ_ONLY FOR
SELECT '  + @PK + ' FROM ' + @Tables + @strFilter + ' ' + @strGroup + ' ORDER BY ' + @Sort + '

OPEN PagingCursor
FETCH RELATIVE ' + @strStartRow + ' FROM PagingCursor INTO @PK

SET NOCOUNT ON

WHILE @PageSize > 0 AND @@FETCH_STATUS = 0
BEGIN
            INSERT @tblPK (PK)  VALUES (@PK)
            FETCH NEXT FROM PagingCursor INTO @PK
            SET @PageSize = @PageSize - 1
END

CLOSE       PagingCursor
DEALLOCATE  PagingCursor

SELECT ' + @Fields + ' FROM ' + @Tables + ' JOIN @tblPK tblPK ON ' + @PK + ' = tblPK.PK ' + @strFilter + ' ' + @strGroup + ' ORDER BY ' + @Sort
)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE Paging_RowCount
(
@Tables varchar(1000),
@PK varchar(100),
@Sort varchar(200) = NULL,
@PageNumber int = 1,
@PageSize int = 10,
@Fields varchar(1000) = '*',
@Filter varchar(1000) = NULL,
@Group varchar(1000) = NULL)
AS

/*Default Sorting*/
IF @Sort IS NULL OR @Sort = ''
	SET @Sort = @PK

/*Find the @PK type*/
DECLARE @SortTable varchar(100)
DECLARE @SortName varchar(100)
DECLARE @strSortColumn varchar(200)
DECLARE @operator char(2)
DECLARE @type varchar(100)
DECLARE @prec int

/*Set sorting variables.*/	
IF CHARINDEX('DESC',@Sort)>0
	BEGIN
		SET @strSortColumn = REPLACE(@Sort, 'DESC', '')
		SET @operator = '<='
	END
ELSE
	BEGIN
		IF CHARINDEX('ASC', @Sort) = 0
			SET @strSortColumn = REPLACE(@Sort, 'ASC', '')
		SET @operator = '>='
	END


IF CHARINDEX('.', @strSortColumn) > 0
	BEGIN
		SET @SortTable = SUBSTRING(@strSortColumn, 0, CHARINDEX('.',@strSortColumn))
		SET @SortName = SUBSTRING(@strSortColumn, CHARINDEX('.',@strSortColumn) + 1, LEN(@strSortColumn))
	END
ELSE
	BEGIN
		SET @SortTable = @Tables
		SET @SortName = @strSortColumn
	END

SELECT @type=t.name, @prec=c.prec
FROM sysobjects o 
JOIN syscolumns c on o.id=c.id
JOIN systypes t on c.xusertype=t.xusertype
WHERE o.name = @SortTable AND c.name = @SortName

IF CHARINDEX('char', @type) > 0
   SET @type = @type + '(' + CAST(@prec AS varchar) + ')'

DECLARE @strPageSize varchar(50)
DECLARE @strStartRow varchar(50)
DECLARE @strFilter varchar(1000)
DECLARE @strSimpleFilter varchar(1000)
DECLARE @strGroup varchar(1000)

/*Default Page Number*/
IF @PageNumber < 1
	SET @PageNumber = 1

/*Set paging variables.*/
SET @strPageSize = CAST(@PageSize AS varchar(50))
SET @strStartRow = CAST(((@PageNumber - 1)*@PageSize + 1) AS varchar(50))

/*Set filter & group variables.*/
IF @Filter IS NOT NULL AND @Filter != ''
	BEGIN
		SET @strFilter = ' WHERE ' + @Filter + ' '
		SET @strSimpleFilter = ' AND ' + @Filter + ' '
	END
ELSE
	BEGIN
		SET @strSimpleFilter = ''
		SET @strFilter = ''
	END
IF @Group IS NOT NULL AND @Group != ''
	SET @strGroup = ' GROUP BY ' + @Group + ' '
ELSE
	SET @strGroup = ''
	
/*Execute dynamic query*/	
EXEC(
'
DECLARE @SortColumn ' + @type + '
SET ROWCOUNT ' + @strStartRow + '
SELECT @SortColumn=' + @strSortColumn + ' FROM ' + @Tables + @strFilter + ' ' + @strGroup + ' ORDER BY ' + @Sort + '
SET ROWCOUNT ' + @strPageSize + '
SELECT ' + @Fields + ' FROM ' + @Tables + ' WHERE ' + @strSortColumn + @operator + ' @SortColumn ' + @strSimpleFilter + ' ' + @strGroup + ' ORDER BY ' + @Sort + '
'
)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE Paging_SubQuery (
@Tables varchar(1000),
@PK varchar(100),
@Sort varchar(200) = NULL,
@PageNumber int = 1,
@PageSize int = 10,
@Fields varchar(1000) = '*',
@Filter varchar(1000) = NULL,
@Group varchar(1000) = NULL)
AS

DECLARE @strPageSize varchar(50)
DECLARE @strSkippedRows varchar(50)
DECLARE @strFilter varchar(1000)
DECLARE @strSimpleFilter varchar(1000)
DECLARE @strGroup varchar(1000)

/*Default Sorting*/
IF @Sort IS NULL OR @Sort = ''
	SET @Sort = @PK
SET @Sort = ' ORDER BY ' + @Sort + ' '

/*Default Page Number*/
IF @PageNumber < 1
	SET @PageNumber = 1

/*Set paging variables.*/
SET @strPageSize = CONVERT(varchar(50), @PageSize)
SET @strSkippedRows = CONVERT(varchar(50), @PageSize * (@PageNumber - 1))

/*Set filter & group variables.*/
IF @Filter IS NOT NULL AND @Filter != ''
	BEGIN
		SET @strFilter = ' WHERE ' + @Filter + ' '
		SET @strSimpleFilter = ' AND ' + @Filter + ' '
	END
ELSE
	BEGIN
		SET @strSimpleFilter = ''
		SET @strFilter = ''
	END
IF @Group IS NOT NULL AND @Group != ''
	SET @strGroup = ' GROUP BY ' + @Group + ' '
ELSE
	SET @strGroup = ''


IF @PageNumber = 1  -- In this case we can execute a more efficient query with no subqueries.
	EXEC (
		'SELECT TOP ' + @strPageSize + ' ' + @Fields + ' FROM ' + @Tables +
			@strFilter + @strGroup + @Sort
)
ELSE  -- Execute a structure of subqueries that brings the correct page.
	EXEC (
		'SELECT ' + @Fields + ' FROM ' + @Tables + '  WHERE ' + @PK + ' IN ' + '
			(SELECT TOP ' + @strPageSize + ' ' + @PK + ' FROM ' + @Tables +
			' WHERE ' + @PK + ' NOT IN
				(SELECT TOP ' + @strSkippedRows + ' ' + @PK + ' FROM ' + @Tables +
					@strFilter + @strGroup + @Sort + ') ' +
			@strSimpleFilter +
			@strGroup +
			@Sort + ') ' +
			@strGroup +
			@Sort
)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

