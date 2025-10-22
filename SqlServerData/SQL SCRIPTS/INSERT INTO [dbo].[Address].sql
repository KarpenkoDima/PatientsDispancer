USE [Dispancer]
GO

SET IDENTITY_INSERT [ADDRESS] ON

INSERT INTO [dbo].[Address]
           ([CustomerID]
           ,addressID
           ,[City]
           ,[AdminDivisionID]
           ,[NameStreet]
           ,[TypeStreetID]           
           ,[NumberHouse]
           ,[NumberApartment])
    SELECT [CustomerID]
      ,[AddressID]
    --  ,[����������� �������� ������������� �������� �]
    --  ,[��� ��������(���)]
   --   ,[�������]
   --   ,[���]
    --  ,[��������]
      ,[�����1]AS city
      , CASE [�����] 
         WHEN '�������' THEN 1
      	 WHEN '���������� ����������' THEN 2 
      	 WHEN '�-�' THEN 3 
      	 WHEN '���' THEN 4
      	 WHEN '�����' THEN 5
      	  WHEN '14' THEN 5
      	 WHEN '���' THEN 4
      	 WHEN '����' THEN 6
      	 WHEN '�������' THEN 7 
      	 ELSE 5
       END AS admindivision    -- �����/����
      ,[�������� �����(���)] AS nameStreet
      ,CASE [�����(���)] 
		WHEN '�������' THEN 10
		WHEN '�������' THEN 10
		WHEN '�-�' THEN 10
		WHEN '�����' THEN 13
		WHEN '�����' THEN 13
		WHEN '����' THEN 75
		WHEN '�������' THEN 33
		WHEN '��-�' THEN 33
		WHEN '�������' THEN 33
		WHEN '���' THEN 42
		WHEN '�-�' THEN 42 
		WHEN '�-�' THEN 42
		WHEN '��������' THEN 51
		WHEN '�������' THEN 55
		WHEN '��.' THEN 55
		WHEN '������' THEN 62
		WHEN '��������' THEN 66
		WHEN '��-�' THEN 66
		WHEN '����' THEN 74
		WHEN '��.' THEN 78  
		WHEN '��' THEN  78
		WHEN '�����' THEN 84 
		WHEN '�����' THEN 83
		ELSE NULL
		 
	END  AS typeStreet
      ,[���]
      ,[��������]
  FROM [TestDataDispancer].[dbo].[Address]
  SET IDENTITY_INSERT [ADDRESS] OFF
GO


