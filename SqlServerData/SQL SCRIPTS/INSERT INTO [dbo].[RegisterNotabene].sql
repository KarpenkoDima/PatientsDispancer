USE [Dispancer]
GO

INSERT INTO [dbo].[RegisterNotaBene]
           ([RegisterID]
           ,[NotaBene])
           SELECT c.[CustomerID]
  
      ,N'[������ ��� ����(�) �� ����] =' +isnull(CONVERT(NVARCHAR(50), [������ ��� ����(�) �� ����],103),' ')+'; ' +
     N'[������ ��� ����(�) � �����] =' +isnull(CONVERT(nvarchar(50), [������ ��� ����(�) � �����],103),' ')+'; ' +
     N'[������ ��� ����(�) �� ����] =' +isnull(CONVERT(nvarchar(50), [������ ��� ����(�) �� ����],103),' ')+'; ' +
     N'[������ ��� ����(�) �� ����] =' +ISNULL([�������], ' ' ) +'; '+
     N'[�������� �/�] =' +ISNULL([�������� �/�], ' ' )+'; '+
     N'[����] =' +ISNULL([����], ' ') +'; '+
     N'[���� � �����] =' +ISNULL([���� � �����], ' ' )+'; '+
     N'[�������(����)] =' +ISNULL([�������(����)], ' ' ) +'; ' +
     N'[�������] =' +ISNULL(CONVERT(NVARCHAR(3), [�������]), ' ' )
  FROM [TestDataDispancer].[dbo].[RegisterArch]
   INNER JOIN Dispancer.dbo.Customer AS c
  ON c.CustomerTempID = [TestDataDispancer].[dbo].RegisterArch.CustomerID 
WHERE c.Arch =1
  --  SELECT RegisterID
  
  --    ,N'[������ ��� ����(�) �� ����] =' +isnull(CONVERT(NVARCHAR(50), [������ ��� ����(�) �� ����],103),' ')+'; ' +
  --   N'[������ ��� ����(�) � �����] =' +isnull(CONVERT(nvarchar(50), [������ ��� ����(�) � �����],103),' ')+'; ' +
  --   N'[������ ��� ����(�) �� ����] =' +isnull(CONVERT(nvarchar(50), [������ ��� ����(�) �� ����],103),' ')+'; ' +
  --   N'[������ ��� ����(�) �� ����] =' +ISNULL([�������], ' ' ) +'; '+
  --   N'[�������� �/�] =' +ISNULL([�������� �/�], ' ' )+'; '+
  --   N'[����] =' +ISNULL([����], ' ') +'; '+
  --   N'[���� � �����] =' +ISNULL([���� � �����], ' ' )+'; '+
  --   N'[�������(����)] =' +ISNULL([�������(����)], ' ' ) +'; ' +
  --   N'[�������] =' +ISNULL(CONVERT(NVARCHAR(3), [�������]), ' ' )
  --FROM [TestDataDispancer].[dbo].[Register]
GO


