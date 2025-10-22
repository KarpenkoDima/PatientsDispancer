USE [Dispancer]
GO

INSERT INTO [dbo].[CustomerNotaBene]
           ([CustomerID]
           ,[NotaBene])
   SELECT distinct c.[CustomerID]
         
      ,N'[Инвалидность]= ' + ISNULL([Инвалидность],' ' ) + '; '+
      N'[Признан инвал(впервые)]= ' + isnull(CONVERT(NVARCHAR(15),[Признан инвал(впервые)]),' ' )+'; '+
      N'[Срок инвал] = ' +isnull(CONVERT(NVARCHAR(15),[Срок инвал]	),' ')		  +'; '+
      N'[Динамика]= '+ isnull([Динамика],' ' )			  +' '+
      N'[Котегория льгот]= ' +isnull([Котегория льгот], ' ' )		  +'; '+
      CASE [НЕ дееспособен]	
		WHEN 0 THEN  '[НЕ дееспособен] = НЕТ; '
		WHEN 1 THEN '[НЕ дееспособен]= ДА; '
		ELSE  '[НЕ дееспособен]=  ;' 
		END
      	  +' '+
      N'[Признан не дееспособным] = ' + isnull(CONVERT(NVARCHAR(15),[Признан не дееспособным]),' ' )+'; '+
      N'[Сведения об опекуне] =' +isnull([Сведения об опекуне],' ' )
        		   
  FROM [TestDataDispancer].[dbo].[InvalidArch]
  INNER JOIN Dispancer.dbo.Customer AS c
  ON c.CustomerTempID = [TestDataDispancer].[dbo].[InvalidArch].CustomerID 
WHERE c.Arch =1
GO


