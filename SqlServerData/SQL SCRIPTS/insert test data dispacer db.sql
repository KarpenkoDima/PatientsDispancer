USE [Dispancer]
GO

/* =============================================================================
 ����� 1: ���������� ������������ (�� ����� 11 ������)
============================================================================= */

PRINT N'����� 1: ���������� ������������ �� 11 ������...';
GO

-- ---
-- ����: INSERT INTO [Dispancer].[dbo].[AdminDivision].sql
-- ---
PRINT N'���������� [AdminDivision]...';
-- ������� ����� ��������, ����� �������� ������ ����������
DELETE FROM [Dispancer].[dbo].[AdminDivision];
SET IDENTITY_INSERT Dispancer.dbo.admindivision ON;
INSERT INTO [Dispancer].[dbo].[AdminDivision]([AdminDivisionID],[Level],[Name],[SocrName],[CodeType])
VALUES(1,1, N'�������                      ', N'���       ',101);
INSERT INTO [Dispancer].[dbo].[AdminDivision]([AdminDivisionID],[Level],[Name],[SocrName],[CodeType])
VALUES(2,1, N'���������� ����������        ', N'��        ',102);
INSERT INTO [Dispancer].[dbo].[AdminDivision]([AdminDivisionID],[Level],[Name],[SocrName],[CodeType])
VALUES(3,2, N'�����                        ', N'�-�       ',201);
INSERT INTO [Dispancer].[dbo].[AdminDivision]([AdminDivisionID],[Level],[Name],[SocrName],[CodeType])
VALUES(4,3, N'������ ���������� ����      ', N'���       ',302);
INSERT INTO [Dispancer].[dbo].[AdminDivision]([AdminDivisionID],[Level],[Name],[SocrName],[CodeType])
VALUES(5,3, N'�����                        ', N'�         ',301);
INSERT INTO [Dispancer].[dbo].[AdminDivision]([AdminDivisionID],[Level],[Name],[SocrName],[CodeType])
VALUES(6,3, N'����                         ', N'�         ',303);
INSERT INTO [Dispancer].[dbo].[AdminDivision]([AdminDivisionID],[Level],[Name],[SocrName],[CodeType])
VALUES(7,3, N'������                      ', N'�         ',304);
SET IDENTITY_INSERT Dispancer.dbo.admindivision OFF;
GO

-- ---
-- ����: INSERT INTO [Dispancer].[dbo].[APPPTPR].sql
-- ---
PRINT N'���������� [APPPTPR]...';
-- ������� ����� ��������
DELETE FROM [Dispancer].[dbo].[APPPTPR];
SET IDENTITY_INSERT Dispancer.dbo.appptpr ON;
INSERT INTO [Dispancer].[dbo].[APPPTPR]([APPPTPR],[Name])
VALUES(1, N'���  ');
INSERT INTO [Dispancer].[dbo].[APPPTPR]([APPPTPR],[Name])
VALUES(2, N'���� ');
INSERT INTO [Dispancer].[dbo].[APPPTPR]([APPPTPR],[Name])
VALUES(3, N'���  ');
SET IDENTITY_INSERT Dispancer.dbo.appptpr OFF;
GO

-- ---
-- ����: INSERT INTO [Dispancer].[dbo].[BenefitsCategory.sql
-- ---
PRINT N'���������� [BenefitsCategory]...';
-- ������� ����� ��������
DELETE FROM [Dispancer].[dbo].[BenefitsCategory];
SET IDENTITY_INSERT Dispancer.dbo.benefitscategory ON;
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(1, N'���� �����',NULL);
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(2, N'����������',NULL);
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(3, N'����',NULL);
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(4, N'�������� ���',NULL);
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(5, N'���',NULL);
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(6, N'�������� ��',NULL);
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(7, N'����',NULL);
INSERT INTO [Dispancer].[dbo].[BenefitsCategory]([BenefitsCategoryID],[Name],[NotaBene])
VALUES(8, N'������ �������',NULL);
SET IDENTITY_INSERT Dispancer.dbo.benefitscategory OFF;
GO

-- ---
-- ����: INSERT INTO [Dispancer].[dbo].[ChiperRecept].sql
-- ---
PRINT N'���������� [ChiperRecept]...';
-- ������� ����� ��������
DELETE FROM [Dispancer].[dbo].[ChiperRecept];
SET IDENTITY_INSERT Dispancer.dbo.chiperrecept ON;
INSERT INTO [Dispancer].[dbo].[ChiperRecept]([ChiperReceptID],[Name],[NotaBene])
VALUES(1, N'01',NULL);
INSERT INTO [Dispancer].[dbo].[ChiperRecept]([ChiperReceptID],[Name],[NotaBene])
VALUES(2, N'',NULL);
INSERT INTO [Dispancer].[dbo].[ChiperRecept]([ChiperReceptID],[Name],[NotaBene])
VALUES(3, N'48',NULL);
INSERT INTO [Dispancer].[dbo].[ChiperRecept]([ChiperReceptID],[Name],[NotaBene])
VALUES(4, N'27',NULL);
INSERT INTO [Dispancer].[dbo].[ChiperRecept]([ChiperReceptID],[Name],[NotaBene])
VALUES(5, N'28',NULL);
INSERT INTO [Dispancer].[dbo].[ChiperRecept]([ChiperReceptID],[Name],[NotaBene])
VALUES(6, N'02',NULL);
INSERT INTO [Dispancer].[dbo].[ChiperRecept]([ChiperReceptID],[Name],[NotaBene])
VALUES(7, N'0',NULL);
SET IDENTITY_INSERT Dispancer.dbo.chiperrecept OFF;
GO

-- ---
-- ����: INSERT INTO [Dispancer].[dbo].[TypeStreet].sql
-- ---
PRINT N'���������� [TypeStreet]...';
-- ������� ����� ��������
DELETE FROM [Dispancer].[dbo].[TypeStreet];
SET IDENTITY_INSERT Dispancer.dbo.typestreet ON;
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'���                          ', N'���       ',532,2);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����������� ����             ', N'�/�       ',572,3);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',501,4);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',560,5);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'���                          ', N'���       ',533,6);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',581,7);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',573,8);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',576,9);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'�-�       ',502,10);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',582,11);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'���                          ', N'���       ',568,12);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',503,13);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������(��)                  ', N'�����     ',534,14);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������-������-��� ����������', N'���       ',563,15);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',586,16);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'�������   ',535,17);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'������ ���                   ', N'���       ',587,18);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'�         ',536,19);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'������                       ', N'���       ',504,20);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�/� �������. (��������) �����', N'�/�_��    ',539,21);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'��������������� �����        ', N'�/�_����� ',537,22);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'��������������� �������      ', N'�/�_������',538,23);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'��������������� ���������    ', N'�/�_����� ',559,24);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'��������������� �������      ', N'�/�_��    ',542,25);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'��������������� ����         ', N'�/�_����  ',540,26);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'��������������� �������      ', N'�/�_���   ',541,27);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'���������������� �����       ', N'��        ',505,28);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',506,29);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����                         ', N'����      ',577,30);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'�������   ',543,31);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',562,32);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'��-�      ',507,33);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'��������                     ', N'��        ',508,34);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'������                       ', N'������    ',509,35);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����                         ', N'����      ',567,36);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����������                   ', N'���       ',565,37);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',510,38);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����                         ', N'����      ',585,39);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'��������                     ', N'�         ',544,40);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'���������                    ', N'��������� ',580,41);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����������                   ', N'���       ',545,42);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����                         ', N'����      ',570,43);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'���                          ', N'���       ',584,44);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����������                   ', N'���       ',511,45);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'���������� �����             ', N'��        ',546,46);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����������                   ', N'�/�       ',588,47);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'������                       ', N'������    ',512,48);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����                         ', N'����      ',513,49);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'�������   ',515,50);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'��������                     ', N'���       ',514,51);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'������������� �����          ', N'�/�       ',550,52);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'���������                    ', N'�����     ',547,53);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'��������                     ', N'��-��     ',517,54);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'��        ',516,55);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����������                   ', N'����������',552,56);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'�         ',548,57);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'������� �(���) �������(�)    ', N'�/��      ',551,58);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'�������   ',553,59);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������� ���������           ', N'�/�       ',549,60);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'������                       ', N'������    ',583,61);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'������                       ', N'������    ',518,62);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'������                       ', N'������    ',520,63);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'�������   ',574,64);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'��������                     ', N'��������  ',521,65);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'��������                     ', N'��-��     ',519,66);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'������                       ', N'������    ',566,67);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'�������   ',575,68);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'�������   ',522,69);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'���       ',554,70);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����                         ', N'����      ',571,71);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'���                          ', N'���       ',523,72);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����-� �����-� ������������ ', N'���       ',564,73);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����                         ', N'�         ',555,74);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',524,75);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'��        ',556,76);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',561,77);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'��        ',557,78);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'��������                     ', N'���       ',525,79);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����������                   ', N'���       ',526,80);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'�������   ',579,81);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',527,82);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'���       ',528,83);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'��        ',529,84);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�������                      ', N'��-�      ',530,85);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�����     ',569,86);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����������                   ', N'�/�       ',589,87);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�         ',558,88);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'�����                        ', N'�         ',531,89);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'��������                     ', N'��������  ',578,90);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'����                         ', N'����      ',590,91);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'���������', N'���������',591,93);
INSERT INTO [Dispancer].[dbo].[TypeStreet]([Level],[Name],[SocrName],[CodeType],[TypeStreetID])
VALUES(5, N'���������', N'���������',592,95);
SET IDENTITY_INSERT Dispancer.dbo.typestreet OFF;
GO

-- ---
-- ����: INSERT INTO [Dispancer].[dbo].[WhyDeRegister].sql
-- ---
PRINT N'���������� [WhyDeRegister]...';
-- ������� ����� ��������
DELETE FROM [Dispancer].[dbo].[WhyDeRegister];
SET IDENTITY_INSERT Dispancer.dbo.whyderegister ON;
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(1, N'�������������\������', N'� ����� �� ������?');
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(2, N'�������� ����� �����', N'� ����');
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(3, N'������', N'� �����');
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(4, N'������ �������', N'� ����� �� � �����');
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(5, N'�� ���������� ������', N'� ����� �� ������');
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(6, N'��������� �� ������ ', N'� ����� �� ������');
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(7, N'��������� � ���',NULL);
INSERT INTO [Dispancer].[dbo].[WhyDeRegister]([WhyDeRegisterID],[Name],[NotaBene])
VALUES(8, N'[�����]', N'������');
SET IDENTITY_INSERT Dispancer.dbo.whyderegister OFF;
GO

/* =============================================================================
 ����� 2: ����������� ����������� (��������� ��� ��������)
============================================================================= */

PRINT N'����� 2: ���������� ����������� ������������ (Gender, Land, RegisterType, DisabilityGroup)...';
GO

-- ���������� ���� (Gender) (��������� ��� Customer.sql)
PRINT N'���������� [Gender]...';
-- ������� ����� ��������
DELETE FROM [dbo].[Gender];
SET IDENTITY_INSERT [dbo].[Gender] ON;
INSERT INTO [dbo].[Gender] ([GenderID], [Name])
VALUES
    (1, N'�'),
    (2, N'�');
SET IDENTITY_INSERT [dbo].[Gender] OFF;
GO

-- ���������� �������� (Land) (��������� ��� Register.sql)
PRINT N'���������� [Land]...';
-- ������� ����� ��������
DELETE FROM [dbo].[Land];
SET IDENTITY_INSERT [dbo].[Land] ON;
INSERT INTO [dbo].[Land] ([LandID], [NumberLand], [NotaBene])
VALUES
    (1, N'������� 0', NULL),
    (2, N'������� 1', NULL),
    (3, N'������� 2', NULL),
    (4, N'������� 3', NULL),
    (5, N'������� 4', NULL),
    (6, N'������� 5', NULL),
    (7, N'������� 6', NULL),
    (8, N'������� 7', NULL),
    (9, N'������� 8', NULL),
    (10, N'������� 9', NULL);
SET IDENTITY_INSERT [dbo].[Land] OFF;
GO

-- ���������� ����� ����� (RegisterType) (��������� ��� Register.sql)
PRINT N'���������� [RegisterType]...';
-- ������� ����� ��������
DELETE FROM [dbo].[RegisterType];
SET IDENTITY_INSERT [dbo].[RegisterType] ON;
INSERT INTO [dbo].[RegisterType] ([RegisterTypeID], [Name], [NotaBene])
VALUES
    (1, N'������������ ������', NULL),
    (2, N'�� ����� �� �������', NULL),
    (3, N'��������������� ������', NULL),
    (4, N'�����', NULL),
    (5, N'������', NULL),
    (6, N'������', NULL),
    (7, N'70.0', N'������'),
    (8, N'���', NULL),
    (9, N'[����������]', NULL);
SET IDENTITY_INSERT [dbo].[RegisterType] OFF;
GO

-- ���������� ����� ������������ (DisabilityGroup) (��������� ��� �������� ������)
PRINT N'���������� [DisabilityGroup]...';
-- ������� ����� ��������
DELETE FROM [dbo].[DisabilityGroup];
SET IDENTITY_INSERT [dbo].[DisabilityGroup] ON;
INSERT INTO [dbo].[DisabilityGroup] ([DisabilityGroupID], [Name], [NotaBene])
VALUES
    (1, N'I ������', NULL),
    (2, N'II ������', NULL),
    (3, N'III ������', NULL),
    (4, N'�������-�������', NULL);
SET IDENTITY_INSERT [dbo].[DisabilityGroup] OFF;
GO

/* =============================================================================
 ����� 3: �������� �������� ������ (�� ����� 11 ������)
============================================================================= */

PRINT N'����� 3: �������� �������� ������ (Customer, Address, Register)...';
GO

-- ������� ������ ����� ���������
-- �����: ������� �������� �������� ������� �������� ������
PRINT N'������� ������ ����� ���������...';
DELETE FROM [dbo].[CustomerNotaBene];
DELETE FROM [dbo].[RegisterNotaBene];
DELETE FROM [dbo].[Invalid_BenefitsCategory];
DELETE FROM [dbo].[Invalid];
DELETE FROM [dbo].[Register];
DELETE FROM [dbo].[Address];
DELETE FROM [dbo].[Customer];
GO

-- ---
-- ����: INSERT INTO [dbo].[Customer].sql
-- ---
PRINT N'�������� [Customer]...';
ALTER TABLE [dbo].[Customer]
NOCHECK CONSTRAINT [CK_Customer_BirthDay];
SET IDENTITY_INSERT [dbo].[Customer] ON;
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
      -- ���������� TRY_CONVERT ��� ������������
      , TRY_CONVERT(DATETIME, [���� ��������]) 
      ,0 -- Arch = 0 �� ��������� ��� �������������
      ,[CustomerID] -- CustomerTempID = ������� ID
      ,1 -- APPPTPRID = 1 ('���') �� ���������? ������, ���� ����� ������ ��������
      ,CASE	[���] WHEN '�' THEN 1 ELSE 2 end
     
  FROM [TestDataDispancer].[dbo].[Customer];
SET IDENTITY_INSERT [dbo].[Customer] OFF;
ALTER TABLE [dbo].[Customer]
CHECK CONSTRAINT [CK_Customer_BirthDay];
GO

-- ---
-- ����: INSERT INTO [dbo].[Address].sql
-- ---
PRINT N'�������� [Address]...';
SET IDENTITY_INSERT [dbo].[Address] ON;
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
      -- ������� N' ��� Unicode �����
      , N'[�����1]' AS city 
      , CASE [�����] 
         WHEN N'�������' THEN 1
      	 WHEN N'���������� ����������' THEN 2 
      	 WHEN N'�-�' THEN 3 
      	 WHEN N'���' THEN 4
      	 WHEN N'�����' THEN 5
      	 WHEN N'14' THEN 5 -- ����� ��������, ��� ������ '14'
      	 WHEN N'���' THEN 4
      	 WHEN N'����' THEN 6
      	 WHEN N'�������' THEN 7 
      	 ELSE 5 -- �� ��������� �����?
       END AS admindivision
      ,[�������� �����(���)] AS nameStreet
      ,CASE [�����(���)] 
		WHEN N'�������' THEN 10
		WHEN N'�������' THEN 10
		WHEN N'�-�' THEN 10
		WHEN N'�����' THEN 13
		WHEN N'�����' THEN 13
		WHEN N'����' THEN 91 -- ID 75 ��� '�����', ID 91 = '����'
		WHEN N'�������' THEN 33
		WHEN N'��-�' THEN 33
		WHEN N'�������' THEN 33
		WHEN N'���' THEN 42
		WHEN N'�-�' THEN 42 
		WHEN N'�-�' THEN 42
		WHEN N'��������' THEN 51
		WHEN N'�������' THEN 55
		WHEN N'��.' THEN 55
		WHEN N'������' THEN 62
		WHEN N'��������' THEN 66
		WHEN N'��-�' THEN 66
		WHEN N'����' THEN 74
		WHEN N'��.' THEN 78  
		WHEN N'��' THEN  78
		WHEN N'�����' THEN 84 
		WHEN N'�����' THEN 83
		ELSE 84 -- �� ��������� �����? ��� NULL? �������� 84 (�����)
	END  AS typeStreet
      ,[���]
      ,[��������]
  FROM [TestDataDispancer].[dbo].[Address];
SET IDENTITY_INSERT [dbo].[Address] OFF;
GO

-- ---
-- ����: INSERT INTO [dbo].[Register].sql
-- ---
PRINT N'�������� [Register]...';
SET IDENTITY_INSERT [dbo].[Register] ON;
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
          )
    SELECT 
    [CustomerID]
     ,[RegisterID]      
      ,TRY_CONVERT(DATETIME,[������ ��� ����(�) �� ����])
      ,TRY_CONVERT(DATETIME,[������ ��� ����(�) � �����])
      ,TRY_CONVERT(DATETIME,[������ ��� ����(�) �� ����])
      ,[�������]
     ,TRY_CONVERT(DATETIME,[�������(����)],104) -- ������ dd.mm.yyyy
      ,CASE [����]
       WHEN N'�� ����� �� ������� ���' THEN 2
      	 WHEN N'�� ����� �� ������� �����' THEN 2 
      	 WHEN N'�� ����� �� �������' THEN  2
      	 WHEN N'� �����' THEN 4
      	 WHEN N'�����(������)' THEN 4
      	 WHEN N'����� (������)' THEN 4
      	 WHEN N'�����( ������)' THEN 4
      	 WHEN N'����� (�����)' THEN 4
      	 WHEN N'�����(�����)' THEN 4
      	 WHEN N'����� (���)' THEN 4 
      	 WHEN N'�����' THEN 4 
      	 WHEN N'������' THEN 4 
      	 WHEN N'70.0' THEN 7 
      	 WHEN N'066' THEN 7
      	 WHEN N'06.6' THEN 7 
      	 WHEN N'45.8' THEN 7
      	 WHEN N'������' THEN 5
      	 WHEN N'�������' THEN 5
      	 WHEN N'��������������� ������' THEN 3
      	 WHEN N'���' THEN 8
      	 WHEN N'������������ ������' THEN 1 
      	 WHEN N'������' THEN 6
      	 ELSE 9 -- [����������]
      	END AS RegisterType
     , CASE [���� � �����]
		 WHEN N'�������������\������� ���������' THEN 1
		 WHEN N'������ �������' THEN 4 
      	 WHEN N'�� ������ �������' THEN 6 
      	 WHEN N'��������� � � ������ �������' THEN 6 
      	 WHEN N'��������� �� ������ �������' THEN 6
      	 WHEN N'���������� �� ������ �������' THEN 6 
      	 WHEN N'�������� ����� ����������' THEN 2
      	 WHEN N'�� ���������� ��������' THEN 5
      	 WHEN N'������' THEN 3
      	 WHEN N' ' THEN 8 -- �����
         WHEN N'' THEN 8  -- �����
         WHEN NULL THEN 8 -- �����
      	 WHEN N'2017 - ����.��.' THEN 7 -- ��������� � ���? ��� ������ �������? �������� 7
      	 WHEN N'� ���' THEN 4 -- ������ �������? ��� ������� �����? �������� 4
		 ELSE 8 -- �� ��������� [�����]
      END AS WhyDeRegister
     ,CASE TRY_CAST([�������] AS INT) -- ���������� �������������� � �����
		   WHEN 0 THEN 1
		   WHEN 1 THEN 2
		   WHEN 2 THEN 3
		   WHEN 3 THEN 4
		   WHEN 4 THEN 5
		   WHEN 5 THEN 6
		   WHEN 6 THEN 7
		   WHEN 7 THEN 8
		   WHEN 8 THEN 9
		   WHEN 9 THEN 10    
		   ELSE 1 -- �� ��������� ������� 0?
	   END AS LandID
  FROM [TestDataDispancer].[dbo].[Register];
SET IDENTITY_INSERT [dbo].[Register] OFF;
GO

/* =============================================================================
 ����� 4: �������� �������� ���������� (�� ����� 11 ������)
============================================================================= */

PRINT N'����� 4: �������� �������� ���������� (CustomerNotabene, RegisterNotabene)...';
GO

-- ---
-- ����: INSERT INTO [dbo].[CustomerNotabene].sql
-- ---
PRINT N'�������� [CustomerNotabene]...';
INSERT INTO [dbo].[CustomerNotaBene]
           ([CustomerID]
           ,[NotaBene])
   SELECT distinct c.[CustomerID]
      -- ���������� ISNULL � N'' ��� Unicode
      ,N'[������������]= ' + ISNULL([������������], N' ' ) + N'; '+
      N'[������� �����(�������)]= ' + isnull(CONVERT(NVARCHAR(15),[������� �����(�������)]), N' ' ) + N'; '+
      N'[���� �����] = ' +isnull(CONVERT(NVARCHAR(15),[���� �����]), N' ') + N'; '+
      N'[��������]= '+ isnull([��������], N' ' ) + N' '+
      N'[��������� �����]= ' +isnull([��������� �����], N' ' ) + N'; '+
      CASE [�� �����������]	
		WHEN 0 THEN  N'[�� �����������] = ���; '
		WHEN 1 THEN N'[�� �����������]= ��; '
		ELSE  N'[�� �����������]=  ;' 
		END
      	  + N' '+
      N'[������� �� ������������] = ' + isnull(CONVERT(NVARCHAR(15),[������� �� ������������]), N' ' ) + N'; '+
      N'[�������� �� �������] =' +isnull([�������� �� �������], N' ' )
        		   
  FROM [TestDataDispancer].[dbo].[InvalidArch]
  INNER JOIN Dispancer.dbo.Customer AS c
  ON c.CustomerTempID = [TestDataDispancer].[dbo].[InvalidArch].CustomerID 
  --WHERE c.Arch =1 -- ������� Arch=1 �� �����, CustomerID ��� ��������
GO

-- ---
-- ����: INSERT INTO [dbo].[RegisterNotabene].sql
-- ---
PRINT N'�������� [RegisterNotabene]...';
INSERT INTO [dbo].[RegisterNotaBene]
           ([RegisterID]
           ,[NotaBene])
   SELECT r.[RegisterID] -- ���������� RegisterID �� ������� �������
      -- ���������� ISNULL � N'' ��� Unicode
      ,N'[������ ��� ����(�) �� ����] =' +isnull(CONVERT(NVARCHAR(50), ra.[������ ��� ����(�) �� ����],103), N' ') + N'; ' +
     N'[������ ��� ����(�) � �����] =' +isnull(CONVERT(nvarchar(50), ra.[������ ��� ����(�) � �����],103), N' ') + N'; ' +
     N'[������ ��� ����(�) �� ����] =' +isnull(CONVERT(nvarchar(50), ra.[������ ��� ����(�) �� ����],103), N' ') + N'; ' +
     N'[�������] =' +ISNULL(ra.[�������], N' ' ) + N'; '+ -- ������� ��� ����
     N'[�������� �/�] =' +ISNULL(ra.[�������� �/�], N' ' )+ N'; '+
     N'[����] =' +ISNULL(ra.[����], N' ') + N'; '+
     N'[���� � �����] =' +ISNULL(ra.[���� � �����], N' ' )+ N'; '+
     N'[�������(����)] =' +ISNULL(ra.[�������(����)], N' ' ) + N'; ' +
     N'[�������] =' +ISNULL(CONVERT(NVARCHAR(3), ra.[�������]), N' ' )
  FROM [TestDataDispancer].[dbo].[RegisterArch] AS ra
   -- �������������� ����� Customer, ����� �������� CustomerID ����� ����
   INNER JOIN Dispancer.dbo.Customer AS c ON c.CustomerTempID = ra.CustomerID 
   -- �������������� � Register, ����� �������� RegisterID ����� ����
   INNER JOIN Dispancer.dbo.Register AS r ON r.CustomerID = c.CustomerID 
   -- WHERE c.Arch =1 -- �� �����, ���� ��������� ���
GO


/* =============================================================================
 ����� 5: ���������� 10 �������� ��������� (��� ������)
============================================================================= */

PRINT N'����� 5: ���������� 10 �������� ���������...';
GO

BEGIN TRANSACTION;
BEGIN TRY

    -- ������� 1: ������ ���� (��������, ������������ ������)
    DECLARE @CustID_1 INT, @AddrID_1 INT, @RegID_1 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_1 OUT, @MedCard = 1001, @CodeCustomer = 2025,
        @LastName = N'������', @FirstName = N'����', @MiddleName = N'��������',
        @Birthday = '1980-05-10', @APPPTPRID = 1, @GenderID = 1, @Arch = 0,
        @NotaBene = N'��������� ������ ��������.';
    
    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_1 OUT, @CustomerID = @CustID_1, @City = N'��������',
        @AdminDivisionID = 5, @TypeStreetID = 84, @NameStreet = N'�����������',
        @NumberHouse = N'10', @NumberApartment = N'5';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_1 OUT, @FirstRegister = '2023-01-15', @Diagnosis = N'F20.0',
        @RegisterTypeID = 1, @CustomerID = @CustID_1, @LandID = 2,
        @NotaBene = N'�� ������������ �����. �������� ���������.';
    PRINT N'�������� ������� 1: ������';

    -- ������� 2: ������� ���� (�����, II ������, ���������)
    DECLARE @CustID_2 INT, @AddrID_2 INT, @RegID_2 INT, @InvID_2 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_2 OUT, @MedCard = 1002, @CodeCustomer = 2025,
        @LastName = N'�������', @FirstName = N'����', @MiddleName = N'���������',
        @Birthday = '1955-02-20', @APPPTPRID = 2, @GenderID = 2, @Arch = 1,
        @NotaBene = N'���������� � ����� �� ��������.';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_2 OUT, @CustomerID = @CustID_2, @City = N'��������',
        @AdminDivisionID = 5, @TypeStreetID = 51, @NameStreet = N'������',
        @NumberHouse = N'22', @NumberApartment = N'1';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_2 OUT, @FirstRegister = '2010-06-01', @FirstDeregister = '2020-01-01',
        @Diagnosis = N'F01.1', @RegisterTypeID = 4, @CustomerID = @CustID_2,
        @WhyDeRegisterID = 8, @LandID = 3, @NotaBene = N'�������� ������'; -- �������� WhyDeRegister �� WhyDeRegisterID

    EXEC [dbo].[uspSaveInvalid]
        @InvalidID = @InvID_2 OUT, @DisabilityGroupID = 2, @DataInvalidity = '2015-03-01',
        @PeriodInvalidity = '2025-03-01', @ChiperReceptID = 1, @Incapable = 0, -- OK, < 2025-10-18
        @CustomerID = @CustID_2;

    EXEC [dbo].[uspSaveInvalidBenefitsCategory]
        @InvalidID = @InvID_2, @BenefitsCategoryID = 2; -- ID 2 = '����������'
    PRINT N'�������� ������� 2: �������';

    -- ������� 3: ������� ���� (��������, ��������������� ������)
    DECLARE @CustID_3 INT, @AddrID_3 INT, @RegID_3 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_3 OUT, @MedCard = 1003, @CodeCustomer = 2025,
        @LastName = N'�������', @FirstName = N'����', @MiddleName = N'��������',
        @Birthday = '1992-11-30', @APPPTPRID = 1, @GenderID = 1, @Arch = 0,
        @NotaBene = N'��������� ����������.';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_3 OUT, @CustomerID = @CustID_3, @City = N'����������',
        @AdminDivisionID = 5, @TypeStreetID = 84, @NameStreet = N'��������',
        @NumberHouse = N'1', @NumberApartment = NULL;

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_3 OUT, @FirstRegister = '2024-02-10', @Diagnosis = N'F41.1',
        @RegisterTypeID = 3, @CustomerID = @CustID_3, @LandID = 5,
        @NotaBene = N'��������������� ������. ������������� ����������.';
    PRINT N'�������� ������� 3: �������';

    -- ������� 4: ��������� ����� (��������, III ������, ����)
    DECLARE @CustID_4 INT, @AddrID_4 INT, @RegID_4 INT, @InvID_4 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_4 OUT, @MedCard = 1004, @CodeCustomer = 2025,
        @LastName = N'���������', @FirstName = N'�����', @MiddleName = N'��������',
        @Birthday = '1986-04-15', @APPPTPRID = 1, @GenderID = 2, @Arch = 0,
        @NotaBene = N'�������� ���������: ����';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_4 OUT, @CustomerID = @CustID_4, @City = N'��������',
        @AdminDivisionID = 5, @TypeStreetID = 10, @NameStreet = N'��������',
        @NumberHouse = N'150', @NumberApartment = N'42';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_4 OUT, @FirstRegister = '2019-01-20', @Diagnosis = N'F32.2',
        @RegisterTypeID = 1, @CustomerID = @CustID_4, @LandID = 2,
        @NotaBene = N'���������� ����������.';

    EXEC [dbo].[uspSaveInvalid]
        @InvalidID = @InvID_4 OUT, @DisabilityGroupID = 3, @DataInvalidity = '2019-02-01',
        @PeriodInvalidity = '2025-01-01', @ChiperReceptID = 7, @Incapable = 0, -- �������� �� ������� ����
        @CustomerID = @CustID_4;

    EXEC [dbo].[uspSaveInvalidBenefitsCategory]
        @InvalidID = @InvID_4, @BenefitsCategoryID = 3; -- ID 3 = '����'
    PRINT N'�������� ������� 4: ���������';

    -- ������� 5: ����� ������ (��������, ��� ������������)
    DECLARE @CustID_5 INT, @AddrID_5 INT, @RegID_5 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_5 OUT, @MedCard = 1005, @CodeCustomer = 2025,
        @LastName = N'�����', @FirstName = N'������', @MiddleName = N'����������',
        @Birthday = '1975-08-01', @APPPTPRID = 1, @GenderID = 1, @Arch = 0,
        @NotaBene = NULL;

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_5 OUT, @CustomerID = @CustID_5, @City = N'��������',
        @AdminDivisionID = 5, @TypeStreetID = 84, @NameStreet = N'�������� �������',
        @NumberHouse = N'30', @NumberApartment = N'11';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_5 OUT, @FirstRegister = '2022-11-05', @Diagnosis = N'F33.1',
        @RegisterTypeID = 1, @CustomerID = @CustID_5, @LandID = 4,
        @NotaBene = N'������������ ����.';
    PRINT N'�������� ������� 5: �����';

    -- ������� 6: �������� ����� (�����, ������)
    DECLARE @CustID_6 INT, @AddrID_6 INT, @RegID_6 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_6 OUT, @MedCard = 1006, @CodeCustomer = 2024,
        @LastName = N'��������', @FirstName = N'�����', @MiddleName = N'����������',
        @Birthday = '1940-01-15', @APPPTPRID = 1, @GenderID = 2, @Arch = 1,
        @NotaBene = N'����� (������)';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_6 OUT, @CustomerID = @CustID_6, @City = N'��������',
        @AdminDivisionID = 5, @TypeStreetID = 84, @NameStreet = N'����',
        @NumberHouse = N'5', @NumberApartment = N'102';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_6 OUT, @FirstRegister = '2005-03-12', @FirstDeregister = '2024-01-20',
        @Diagnosis = N'F00.1', @RegisterTypeID = 5, @CustomerID = @CustID_6,
        @WhyDeRegisterID = 3, @LandID = 1, @NotaBene = N'����� � ����� �� ������� ������.'; -- �������� WhyDeRegister �� WhyDeRegisterID
    PRINT N'�������� ������� 6: ��������';

    -- ������� 7: �������� ������ (��������, ���)
    DECLARE @CustID_7 INT, @AddrID_7 INT, @RegID_7 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_7 OUT, @MedCard = 1007, @CodeCustomer = 2025,
        @LastName = N'��������', @FirstName = N'������', @MiddleName = N'����������',
        @Birthday = '1963-07-22', @APPPTPRID = 3, @GenderID = 1, @Arch = 0,
        @NotaBene = N'���';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_7 OUT, @CustomerID = @CustID_7, @City = N'��������',
        @AdminDivisionID = 5, @TypeStreetID = 84, @NameStreet = N'������������',
        @NumberHouse = N'44', @NumberApartment = N'2';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_7 OUT, @FirstRegister = '2021-05-30', @Diagnosis = N'F10.2',
        @RegisterTypeID = 8, @CustomerID = @CustID_7, @LandID = 7,
        @NotaBene = N'������ ���.';
    PRINT N'�������� ������� 7: ��������';

    -- ������� 8: ������� ����� (��������, I ������, ������� ���)
    DECLARE @CustID_8 INT, @AddrID_8 INT, @RegID_8 INT, @InvID_8 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_8 OUT, @MedCard = 1008, @CodeCustomer = 2025,
        @LastName = N'�������', @FirstName = N'�����', @MiddleName = N'����������',
        @Birthday = '1948-12-07', @APPPTPRID = 1, @GenderID = 2, @Arch = 0,
        @NotaBene = N'������� ���';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_8 OUT, @CustomerID = @CustID_8, @City = N'��������',
        @AdminDivisionID = 5, @TypeStreetID = 10, @NameStreet = N'��������',
        @NumberHouse = N'12', @NumberApartment = N'9';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_8 OUT, @FirstRegister = '2015-02-11', @Diagnosis = N'F03',
        @RegisterTypeID = 1, @CustomerID = @CustID_8, @LandID = 3,
        @NotaBene = N'������������ ����.';

    EXEC [dbo].[uspSaveInvalid]
        @InvalidID = @InvID_8 OUT, @DisabilityGroupID = 1, @DataInvalidity = '2010-01-01',
        @PeriodInvalidity = '2025-01-01', @ChiperReceptID = 1, @Incapable = 1, -- �������� �� ������� ����
        @DateIncapable = '2012-05-20', @CustomerID = @CustID_8;

    EXEC [dbo].[uspSaveInvalidBenefitsCategory]
        @InvalidID = @InvID_8, @BenefitsCategoryID = 4; -- ID 4 = '�������� ���'
    EXEC [dbo].[uspSaveInvalidBenefitsCategory]
        @InvalidID = @InvID_8, @BenefitsCategoryID = 2; -- ID 2 = '����������'
    PRINT N'�������� ������� 8: �������';

    -- ������� 9: ������� ������� (��������, ����. ������)
    DECLARE @CustID_9 INT, @AddrID_9 INT, @RegID_9 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_9 OUT, @MedCard = 1009, @CodeCustomer = 2025,
        @LastName = N'�������', @FirstName = N'�������', @MiddleName = N'�������',
        @Birthday = '2001-03-18', @APPPTPRID = 1, @GenderID = 1, @Arch = 0,
        @NotaBene = N'�������';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_9 OUT, @CustomerID = @CustID_9, @City = N'��������',
        @AdminDivisionID = 5, @TypeStreetID = 84, @NameStreet = N'������',
        @NumberHouse = N'19', @NumberApartment = N'55';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_9 OUT, @FirstRegister = '2024-03-01', @Diagnosis = N'F43.2',
        @RegisterTypeID = 3, @CustomerID = @CustID_9, @LandID = 6,
        @NotaBene = N'������������.';
    PRINT N'�������� ������� 9: �������';

    -- ������� 10: ���������� C������� (��������, ���)
    DECLARE @CustID_10 INT, @AddrID_10 INT, @RegID_10 INT, @InvID_10 INT;
    EXEC [dbo].[uspSaveCustomer]
        @CustomerID = @CustID_10 OUT, @MedCard = 1010, @CodeCustomer = 2025,
        @LastName = N'����������', @FirstName = N'C�������', @MiddleName = N'�������������',
        @Birthday = '1990-10-25', @APPPTPRID = 1, @GenderID = 2, @Arch = 0,
        @NotaBene = N'���';

    EXEC [dbo].[uspSaveAddress]
        @AddressID = @AddrID_10 OUT, @CustomerID = @CustID_10, @City = N'��������',
        @AdminDivisionID = 5, @TypeStreetID = 84, @NameStreet = N'�������',
        @NumberHouse = N'7', @NumberApartment = N'23';

    EXEC [dbo].[uspSaveRegister]
        @RegisterID = @RegID_10 OUT, @FirstRegister = '2023-08-14', @Diagnosis = N'F43.1',
        @RegisterTypeID = 1, @CustomerID = @CustID_10, @LandID = 8,
        @NotaBene = N'����. ������������ ����.';
        
    EXEC [dbo].[uspSaveInvalid]
        @InvalidID = @InvID_10 OUT, @DisabilityGroupID = 3, @DataInvalidity = '2023-09-01',
        @PeriodInvalidity = '2025-09-01', @ChiperReceptID = 7, @Incapable = 0, -- OK, < 2025-10-18
        @CustomerID = @CustID_10;
        
    EXEC [dbo].[uspSaveInvalidBenefitsCategory]
        @InvalidID = @InvID_10, @BenefitsCategoryID = 5; -- ID 5 = '���'
    PRINT N'�������� ������� 10: ����������';


    COMMIT TRANSACTION;
    PRINT N'��� 10 ��������� ������� ���������.';

END TRY
BEGIN CATCH
    -- ���� ������ ��������� � �������� ������, ���������� ������ ��
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
    PRINT N'��������� ������ ��� ���������� �������� ������! ��������� �������� ������ ��������.';
    -- ����� ���������� �� ������
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO

PRINT N'===== ������ �������� =====';
GO