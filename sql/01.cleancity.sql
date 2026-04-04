USE Stadtdata;
GO

Create View CleanCities AS
Select *
FROM [Stadtdata].[dbo].[stadtdata]
  where [Total] Is Not Null
  And [city] Not like '%kreis%'
  And [city] Not like '%bayern%'
  And [city] Not like '%Schwaben%'
  And [city] Not like '%Pfalz%'
  And [city] Not like '%Ems%'
  And [city] Not like '%Region%'
  And [city] Not like '%franken%'
  And [city] Not like '%Detmold%'
  And [city] Not like '%Arnsberg%'
  And [city] Not like '%Landeshauptstadt%';