CREATE VIEW PlanCache_MissingIndexes
AS
SELECT TOP 1000
       [CheckDate]
      ,[QueryText]
      ,[QueryPlan]
      ,[Warnings]
      ,[DatabaseName]
      ,[AverageCPU]
      ,[TotalCPU]
      ,[AverageDuration]
      ,[TotalDuration]
      ,[DurationWeight]
      ,[LastExecutionTime]
      ,[SQL Handle More Info]
      ,[QueryHash]
      ,[Query Hash More Info]
      ,[QueryPlanHash]
      ,[MinReturnedRows]
      ,[MaxReturnedRows]
      ,[AverageReturnedRows]
      ,[TotalReturnedRows]
      ,[NumberOfPlans]
      ,[NumberOfDistinctPlans]
      ,[MinGrantKB]
      ,[MaxGrantKB]
      ,[MinUsedGrantKB]
      ,[MaxUsedGrantKB]
      ,[PercentMemoryGrantUsed]
      ,[AvgMaxMemoryGrant]
      ,[QueryPlanCost]
  FROM [dbo].[BlitzCache]
  WHERE Warnings LIKE '%Missing Index%'
  AND CheckDate > DATEADD(DAY,-1,GETDATE())
  ORDER BY [TotalDuration] DESC