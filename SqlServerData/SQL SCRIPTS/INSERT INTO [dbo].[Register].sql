USE [Dispancer]
GO
SET IDENTITY_INSERT dbo.Register ON
INSERT INTO [dbo].[Register]
           ([CustomerID]
           ,RegisterID
           ,[FirstRegister]
           ,[FirstDeregister]
           ,[SecondRegister]
           ,[Diagnosis]
           ,[DataDiagnosis]
           ,[RegisterTypeID]        
           ,[WhyDeRegisterID]
           ,[LandID]
          -- ,[NotaBene]
          -- ,[SecondDeRegister]
          -- ,[SecondRegisterTypeID]
         --  ,[WhySecondDeRegisterID]
          -- ,[ModifiedDate]
          )
    SELECT 
    [CustomerID]
     ,[RegisterID]      
      ,CONVERT(DATETIME,[������ ��� ����(�) �� ����])
      ,convert(DATETIME,[������ ��� ����(�) � �����])
      ,convert(DATETIME,[������ ��� ����(�) �� ����])
      ,[�������]
     ,try_CONVERT(DATETIME,[�������(����)],104)
      ,CASE [����]
       WHEN '�� ����� �� ������� ���' THEN 2
      	 WHEN '�� ����� �� ������� �����' THEN 2 
      	 WHEN '�� ����� �� �������' THEN  2
      	 WHEN '� �����' THEN 4
      	 WHEN '�����(������)' THEN 4
      	 WHEN '����� (������)' THEN 4
      	 WHEN '�����( ������)' THEN 4
      	 WHEN '����� (�����)' THEN 4
      	 WHEN '�����(�����)' THEN 4
      	 WHEN '����� (���)' THEN 4 
      	 WHEN '�����' THEN 4 
      	 WHEN '������' THEN 4 
      	 WHEN '70.0' THEN 7 
      	 WHEN '066' THEN 7
      	 WHEN '06.6' THEN 7 
      	 WHEN '45.8' THEN 7
      	 WHEN '������' THEN 5
      	 WHEN '�������' THEN 5
      	 WHEN '��������������� ������' THEN 3
      	 WHEN '���' THEN 8
      	 WHEN '������������ ������' THEN 1 
      	 WHEN '������' THEN 6
      	 ELSE 9 
      	END AS RegisterType
     , CASE [���� � �����]
		 WHEN '�������������\������� ���������' THEN 1
		 WHEN '������ �������' THEN 4 
      	 WHEN '�� ������ �������' THEN 6 
      	 WHEN '��������� � � ������ �������' THEN 6 
      	 WHEN '��������� �� ������ �������' THEN 6
      	 WHEN '���������� �� ������ �������' THEN 6 
      	 WHEN '�������� ����� ����������' THEN 2
      	 WHEN '�� ���������� ��������' THEN 5
      	 WHEN '������' THEN 3
      	 WHEN ' ' THEN 8
      	 WHEN '2017 - ����.��.' THEN 7
      	 WHEN '� ���' THEN 9
		ELSE 8
      END AS WhyDeRegister
      
     ,CASE [�������]
		   WHEn 0 THEN 1
		   WHEn 1 THEN 2
		   WHEn 2 THEN 3
		   WHEn 3 THEN 4
		   WHEn 4 THEN 5
		   WHEn 5 THEN 6
		   WHEn 6 THEN 7
		   WHEn 7 THEN 8
		   WHEn 8 THEN 9
		   WHEn 9 THEN 10    
		   ELSE 1
	   END AS LandID
  FROM [TestDataDispancer].[dbo].[Register]
  
  SET IDENTITY_INSERT [dbo].[Register] OFF
GO


