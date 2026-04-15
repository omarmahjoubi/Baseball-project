-- random insert for tables stg_games_all (150)
INSERT INTO `project-f5aa7f27-0184-4aa1-9b9.baseball_STG.stg_games_all` 
(
  gameId, seasonId, seasonType, year, startTime, gameStatus, attendance, dayNight,
  awayTeamId, awayTeamName, homeTeamId, homeTeamName, venueId, venueName,
  homeFinalRuns, awayFinalRuns, updatedAt, createdAt
)
SELECT
  CONCAT('MOCK_GAME_V2_', CAST(id AS STRING)) as gameId,
  '2026_REG' as seasonId,
  'REG' as seasonType,
  2026 as year,
  TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL CAST(RAND() * 30 AS INT64) DAY) as startTime,
  'closed' as gameStatus,
  CAST(25000 + (RAND() * 15000) AS INT64) as attendance,
  IF(RAND() > 0.5, 'night', 'day') as dayNight,
  
  -- Logic for AWAY TEAM
  CASE 
    WHEN rand_val_away < 0.35 THEN '93941372-eb4c-4c40-aced-fe3267174393' 
    WHEN rand_val_away < 0.70 THEN 'a09ec676-f887-43dc-bbb3-cf4bbaee9a18' 
    ELSE 'bdc11650-6f74-49c4-875e-778aeb7632d9' 
  END as awayTeamId,
  
  CASE 
    WHEN rand_val_away < 0.35 THEN 'Red Sox' 
    WHEN rand_val_away < 0.70 THEN 'Yankees'
    ELSE 'Rays' 
  END as awayTeamName,
  
  -- Logic for HOME TEAM (With a check to prevent duplicates)
  CASE 
    -- If the randomizer picks Sox vs Sox, force Home Team to be Blue Jays
    WHEN (rand_val_away < 0.35 AND rand_val_home > 0.65) THEN '1d678440-b4b1-4954-9b39-70afb3ebbcfa'
    -- If the randomizer picks Yankees vs Yankees, force Home Team to be Orioles
    WHEN (rand_val_away >= 0.35 AND rand_val_away < 0.70 AND rand_val_home <= 0.35) THEN '75729d34-bca7-4a0f-b3df-6f26c6ad3719'
    -- Otherwise, proceed with normal logic
    WHEN rand_val_home > 0.65 THEN '93941372-eb4c-4c40-aced-fe3267174393' 
    ELSE '1d678440-b4b1-4954-9b39-70afb3ebbcfa' 
  END as homeTeamId,
  
  CASE 
    WHEN (rand_val_away < 0.35 AND rand_val_home > 0.65) THEN 'Blue Jays'
    WHEN (rand_val_away >= 0.35 AND rand_val_away < 0.70 AND rand_val_home <= 0.35) THEN 'Orioles'
    WHEN rand_val_home > 0.65 THEN 'Red Sox' 
    ELSE 'Blue Jays' 
  END as homeTeamName,
  
  'VENUE_GENERIC' as venueId,
  'Test Stadium' as venueName,
  CAST(RAND() * 12 AS INT64) as homeFinalRuns,
  CAST(RAND() * 12 AS INT64) as awayFinalRuns,
  CURRENT_TIMESTAMP() as updatedAt,
  CURRENT_TIMESTAMP() as createdAt
FROM (
  -- Pre-generate random values to use in the CASE statements
  SELECT id, RAND() as rand_val_away, RAND() as rand_val_home 
  FROM UNNEST(GENERATE_ARRAY(1, 150)) AS id
);


-- random insert for tables stg_schedules (150)
INSERT INTO `project-f5aa7f27-0184-4aa1-9b9.baseball_STG.stg_schedules` 
(
  gameId, gameNumber, seasonId, year, type, dayNight, duration, duration_minutes,
  homeTeamId, homeTeamName, awayTeamId, awayTeamName, startTime, attendance, status, created
)
SELECT
  CONCAT('MOCK_GAME_V2_', CAST(id AS STRING)) as gameId,
  1 as gameNumber,
  '2026_REG' as seasonId,
  2026 as year,
  'REG' as type,
  IF(rand_val_home > 0.5, 'night', 'day') as dayNight,
  '3:05' as duration,
  CAST(150 + (RAND() * 60) AS INT64) as duration_minutes,
  
  -- Match the Home Team logic from the previous generator
  CASE 
    -- If the randomizer picks Sox vs Sox, force Home Team to be Blue Jays
    WHEN (rand_val_away < 0.35 AND rand_val_home > 0.65) THEN '1d678440-b4b1-4954-9b39-70afb3ebbcfa'
    -- If the randomizer picks Yankees vs Yankees, force Home Team to be Orioles
    WHEN (rand_val_away >= 0.35 AND rand_val_away < 0.70 AND rand_val_home <= 0.35) THEN '75729d34-bca7-4a0f-b3df-6f26c6ad3719'
    -- Otherwise, proceed with normal logic
    WHEN rand_val_home > 0.65 THEN '93941372-eb4c-4c40-aced-fe3267174393' 
    ELSE '1d678440-b4b1-4954-9b39-70afb3ebbcfa' 
  END as homeTeamId,
  
  CASE 
    WHEN (rand_val_away < 0.35 AND rand_val_home > 0.65) THEN 'Blue Jays'
    WHEN (rand_val_away >= 0.35 AND rand_val_away < 0.70 AND rand_val_home <= 0.35) THEN 'Orioles'
    WHEN rand_val_home > 0.65 THEN 'Red Sox' 
    ELSE 'Blue Jays' 
  END as homeTeamName,

  -- Match the Away Team logic
  CASE 
    WHEN rand_val_away < 0.35 THEN '93941372-eb4c-4c40-aced-fe3267174393' 
    WHEN rand_val_away < 0.70 THEN 'a09ec676-f887-43dc-bbb3-cf4bbaee9a18' 
    ELSE 'bdc11650-6f74-49c4-875e-778aeb7632d9' 
  END as awayTeamId,
  
  CASE 
    WHEN rand_val_away < 0.35 THEN 'Red Sox' 
    WHEN rand_val_away < 0.70 THEN 'Yankees'
    ELSE 'Rays' 
  END as awayTeamName,

  TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL CAST(RAND() * 30 AS INT64) DAY) as startTime,
  CAST(25000 + (RAND() * 15000) AS INT64) as attendance,
  'closed' as status,
  CURRENT_TIMESTAMP() as created
FROM (
  SELECT id, RAND() as rand_val_away, RAND() as rand_val_home 
  FROM UNNEST(GENERATE_ARRAY(1, 150)) AS id
);