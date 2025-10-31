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
    --  ,[Медицинская карточка амбулаторного больного №]
    --  ,[Код больного(год)]
   --   ,[Фамилия]
   --   ,[Имя]
    --  ,[Отчество]
      ,[Адрес1]AS city
      , CASE [Адрес] 
         WHEN 'область' THEN 1
      	 WHEN 'Автономная республика' THEN 2 
      	 WHEN 'р-н' THEN 3 
      	 WHEN 'ПГТ' THEN 4
      	 WHEN 'Город' THEN 5
      	  WHEN '14' THEN 5
      	 WHEN 'смт' THEN 4
      	 WHEN 'Село' THEN 6
      	 WHEN 'Поселок' THEN 7 
      	 ELSE 5
       END AS admindivision    -- город/село
      ,[Название улицы(пер)] AS nameStreet
      ,CASE [Улица(пер)] 
		WHEN 'бульвар' THEN 10
		WHEN 'Бульвар' THEN 10
		WHEN 'б-р' THEN 10
		WHEN 'Въезд' THEN 13
		WHEN 'въезд' THEN 13
		WHEN 'Двор' THEN 75
		WHEN 'квартал' THEN 33
		WHEN 'кв-л' THEN 33
		WHEN 'Квартал' THEN 33
		WHEN 'мкр' THEN 42
		WHEN 'м-н' THEN 42 
		WHEN 'м-р' THEN 42
		WHEN 'Переулок' THEN 51
		WHEN 'Площадь' THEN 55
		WHEN 'пл.' THEN 55
		WHEN 'Проезд' THEN 62
		WHEN 'Проспект' THEN 66
		WHEN 'пр-т' THEN 66
		WHEN 'село' THEN 74
		WHEN 'ст.' THEN 78  
		WHEN 'ст' THEN  78
		WHEN 'Улица' THEN 84 
		WHEN 'Тупик' THEN 83
		ELSE NULL
		 
	END  AS typeStreet
      ,[Дом]
      ,[Квартира]
  FROM [TestDataDispancer].[dbo].[Address]
  SET IDENTITY_INSERT [ADDRESS] OFF
GO


