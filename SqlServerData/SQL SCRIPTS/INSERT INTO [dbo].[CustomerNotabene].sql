USE [Dispancer]
GO

INSERT INTO [dbo].[CustomerNotaBene]
           ([CustomerID]
           ,[NotaBene])
   SELECT distinct c.[CustomerID]
         
      ,N'[������������]= ' + ISNULL([������������],' ' ) + '; '+
      N'[������� �����(�������)]= ' + isnull(CONVERT(NVARCHAR(15),[������� �����(�������)]),' ' )+'; '+
      N'[���� �����] = ' +isnull(CONVERT(NVARCHAR(15),[���� �����]	),' ')		  +'; '+
      N'[��������]= '+ isnull([��������],' ' )			  +' '+
      N'[��������� �����]= ' +isnull([��������� �����], ' ' )		  +'; '+
      CASE [�� �����������]	
		WHEN 0 THEN  '[�� �����������] = ���; '
		WHEN 1 THEN '[�� �����������]= ��; '
		ELSE  '[�� �����������]=  ;' 
		END
      	  +' '+
      N'[������� �� ������������] = ' + isnull(CONVERT(NVARCHAR(15),[������� �� ������������]),' ' )+'; '+
      N'[�������� �� �������] =' +isnull([�������� �� �������],' ' )
        		   
  FROM [TestDataDispancer].[dbo].[InvalidArch]
  INNER JOIN Dispancer.dbo.Customer AS c
  ON c.CustomerTempID = [TestDataDispancer].[dbo].[InvalidArch].CustomerID 
WHERE c.Arch =1
GO


