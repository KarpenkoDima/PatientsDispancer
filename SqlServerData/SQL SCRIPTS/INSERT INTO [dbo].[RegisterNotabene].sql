USE [Dispancer]
GO

INSERT INTO [dbo].[RegisterNotaBene]
           ([RegisterID]
           ,[NotaBene])
           SELECT c.[CustomerID]
  
      ,N'[Первый раз взят(а) на учет] =' +isnull(CONVERT(NVARCHAR(50), [Первый раз взят(а) на учет],103),' ')+'; ' +
     N'[Первый раз снят(а) с учета] =' +isnull(CONVERT(nvarchar(50), [Первый раз снят(а) с учета],103),' ')+'; ' +
     N'[Второй раз взят(а) на учет] =' +isnull(CONVERT(nvarchar(50), [Второй раз взят(а) на учет],103),' ')+'; ' +
     N'[Второй раз взят(а) на учет] =' +ISNULL([Диагноз], ' ' ) +'; '+
     N'[Динамика Д/З] =' +ISNULL([Динамика Д/З], ' ' )+'; '+
     N'[Учет] =' +ISNULL([Учет], ' ') +'; '+
     N'[Снят с учета] =' +ISNULL([Снят с учета], ' ' )+'; '+
     N'[Диагноз(дата)] =' +ISNULL([Диагноз(дата)], ' ' ) +'; ' +
     N'[Участок] =' +ISNULL(CONVERT(NVARCHAR(3), [Участок]), ' ' )
  FROM [TestDataDispancer].[dbo].[RegisterArch]
   INNER JOIN Dispancer.dbo.Customer AS c
  ON c.CustomerTempID = [TestDataDispancer].[dbo].RegisterArch.CustomerID 
WHERE c.Arch =1
  --  SELECT RegisterID
  
  --    ,N'[Первый раз взят(а) на учет] =' +isnull(CONVERT(NVARCHAR(50), [Первый раз взят(а) на учет],103),' ')+'; ' +
  --   N'[Первый раз снят(а) с учета] =' +isnull(CONVERT(nvarchar(50), [Первый раз снят(а) с учета],103),' ')+'; ' +
  --   N'[Второй раз взят(а) на учет] =' +isnull(CONVERT(nvarchar(50), [Второй раз взят(а) на учет],103),' ')+'; ' +
  --   N'[Второй раз взят(а) на учет] =' +ISNULL([Диагноз], ' ' ) +'; '+
  --   N'[Динамика Д/З] =' +ISNULL([Динамика Д/З], ' ' )+'; '+
  --   N'[Учет] =' +ISNULL([Учет], ' ') +'; '+
  --   N'[Снят с учета] =' +ISNULL([Снят с учета], ' ' )+'; '+
  --   N'[Диагноз(дата)] =' +ISNULL([Диагноз(дата)], ' ' ) +'; ' +
  --   N'[Участок] =' +ISNULL(CONVERT(NVARCHAR(3), [Участок]), ' ' )
  --FROM [TestDataDispancer].[dbo].[Register]
GO


