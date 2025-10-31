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
      ,CONVERT(DATETIME,[Первый раз взят(а) на учет])
      ,convert(DATETIME,[Первый раз снят(а) с учета])
      ,convert(DATETIME,[Второй раз взят(а) на учет])
      ,[Диагноз]
     ,try_CONVERT(DATETIME,[Диагноз(дата)],104)
      ,CASE [Учет]
       WHEN 'на учете не состоит ДПХ' THEN 2
      	 WHEN 'на учете не состоит выезд' THEN 2 
      	 WHEN 'на учете не состоит' THEN  2
      	 WHEN 'в архив' THEN 4
      	 WHEN 'архив(опекун)' THEN 4
      	 WHEN 'архив (опекун)' THEN 4
      	 WHEN 'архив( опекун)' THEN 4
      	 WHEN 'архив (опека)' THEN 4
      	 WHEN 'архив(опека)' THEN 4
      	 WHEN 'архив (ДПХ)' THEN 4 
      	 WHEN 'архив' THEN 4 
      	 WHEN 'архиив' THEN 4 
      	 WHEN '70.0' THEN 7 
      	 WHEN '066' THEN 7
      	 WHEN '06.6' THEN 7 
      	 WHEN '45.8' THEN 7
      	 WHEN 'смерть' THEN 5
      	 WHEN 'смертть' THEN 5
      	 WHEN 'консультативная группа' THEN 3
      	 WHEN 'ДПХ' THEN 8
      	 WHEN 'диспансерная группа' THEN 1 
      	 WHEN 'опекун' THEN 6
      	 ELSE 9 
      	END AS RegisterType
     , CASE [Снят с учета]
		 WHEN 'выздоровление\стойкое улучшение' THEN 1
		 WHEN 'другие причины' THEN 4 
      	 WHEN 'на другой участок' THEN 6 
      	 WHEN 'переведен н а другой участок' THEN 6 
      	 WHEN 'переведен на другой участок' THEN 6
      	 WHEN 'переведена на другой участок' THEN 6 
      	 WHEN 'перемена места жительства' THEN 2
      	 WHEN 'по достижению возраста' THEN 5
      	 WHEN 'смерть' THEN 3
      	 WHEN ' ' THEN 8
      	 WHEN '2017 - конс.гр.' THEN 7
      	 WHEN 'в ПНИ' THEN 9
		ELSE 8
      END AS WhyDeRegister
      
     ,CASE [Участок]
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


