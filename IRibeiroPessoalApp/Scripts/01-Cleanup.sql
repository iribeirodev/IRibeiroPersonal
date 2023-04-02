IF OBJECT_ID('Sections') IS NOT NULL
	DROP TABLE dbo.Sections;

IF OBJECT_ID('Presentation') IS NOT NULL
	DROP TABLE dbo.Presentation;

IF OBJECT_ID('ContactFields') IS NOT NULL
	DROP TABLE dbo.ContactFields;

IF OBJECT_ID('Languages') IS NOT NULL
	DROP TABLE dbo.Languages;

IF OBJECT_ID('IPDetails') IS NOT NULL
	DROP TABLE dbo.IPDetails;

IF OBJECT_ID('GetContactFieldsByLanguage') IS NOT NULL
    DROP PROCEDURE dbo.GetContactFieldsByLanguage;

IF OBJECT_ID('GetPresentationByLanguage') IS NOT NULL
    DROP PROCEDURE dbo.GetPresentationByLanguage

IF OBJECT_ID('GetSectionsByLanguage') IS NOT NULL
    DROP PROCEDURE dbo.GetSectionsByLanguage

IF OBJECT_ID('InsertIPDetails') IS NOT NULL
    DROP PROCEDURE dbo.InsertIPDetails