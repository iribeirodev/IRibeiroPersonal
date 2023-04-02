CREATE PROCEDURE [dbo].[GetContactFieldsByLanguage]
	@abbreviation VARCHAR(5)
AS 

SET NOCOUNT ON

SELECT 
		c.FieldName
		, c.FieldValue
  FROM ContactFields c 
  JOIN Languages l
    ON c.LanguageId = l.id
 WHERE l.abbreviation = @abbreviation;

CREATE PROCEDURE [dbo].[GetPresentationByLanguage]
	@abbreviation VARCHAR(5)
AS 

SET NOCOUNT ON

SELECT 
		p.PresentationTitle
		, p.PresentationText
		, l.LanguageName
  FROM Presentation p 
  JOIN Languages l
    ON p.LanguageId = l.id
 WHERE l.abbreviation = @abbreviation;


CREATE PROCEDURE [dbo].[GetSectionsByLanguage]
	@abbreviation VARCHAR(5)
AS 

SET NOCOUNT ON

SELECT 
		s.SectionName
		, l.LanguageName
  FROM Sections s 
  JOIN Languages l
    ON s.LanguageId = l.id
 WHERE l.abbreviation = @abbreviation;

CREATE PROCEDURE [dbo].[InsertIPDetails]
	@city				VARCHAR(100)
	, @continentName	VARCHAR(50)
	, @countryCode		VARCHAR(5)
	, @countryName		VARCHAR(100)
	, @ipAddress		VARCHAR(50)
	, @stateProv		VARCHAR(100)
AS 

SET NOCOUNT ON

DECLARE @currentDate VARCHAR(16)

-- yyyy-mm-ddThh:mi
SELECT @currentDate = CONVERT(VARCHAR(16), GETDATE(), 126)	

IF NOT EXISTS (SELECT 1 
 				 FROM dbo.IPDetails 
 				WHERE IPAddress = @ipAddress
 				  AND CONVERT(VARCHAR(16), DateAdded , 126) = @currentDate)
BEGIN
	INSERT INTO [dbo].[IPDetails]
			   ([City]
			   ,[ContinentName]
			   ,[CountryCode]
			   ,[CountryName]
			   ,[IPAddress]
			   ,[StateProv])
		 VALUES
			   (@city
			   , @continentName
			   , @countryCode
			   , @countryName
			   , @ipAddress
			   , @stateProv)
END

SELECT @@ROWCOUNT 'AffectedRows';

