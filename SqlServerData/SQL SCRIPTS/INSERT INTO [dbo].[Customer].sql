USE [Dispancer]
GO
ALTER TABLE [dbo].[Customer]
NOCHECK CONSTRAINT [CK_Customer_BirthDay];
SET IDENTITY_INSERT Customer ON
INSERT INTO [dbo].[Customer]
           (CustomerID
           	,[MedCard]
           ,[CodeCustomer]
           ,[LastName]
           ,[FirstName]
           ,[MiddleName]
           ,[Birthday]
           ,[Arch]
           ,[CustomerTempID]
           ,[APPPTPRID]
           ,[GenderID]          
          )
   SELECT 
       [CustomerID]    
      ,[����������� �������� ������������� �������� �]
      ,[��� ��������(���)]
      ,[�������]
      , ISNULL([���],'')
      ,[��������]
      ,CONVERT(DATETIME, [���� ��������])
      ,0
      ,[CustomerID]
      ,1
      ,CASE	[���] WHEN '�' THEN 1 ELSE 2 end
     
  FROM [TestDataDispancer].[dbo].[Customer]
  SET IDENTITY_INSERT Customer OFF
  ALTER TABLE [dbo].[Customer]
CHECK CONSTRAINT [CK_Customer_BirthDay];
GO


