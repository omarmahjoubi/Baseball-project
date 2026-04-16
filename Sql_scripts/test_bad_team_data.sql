INSERT INTO `project-f5aa7f27-0184-4aa1-9b9.baseball_STG.stg_games_all` 
(gameId, homeTeamId, homeTeamName, awayTeamId, awayTeamName, startTime, inningNumber, atBatEventSequenceNumber)
VALUES
  -- ROW 1: THE CORRECT DATA
  -- Game 999: Red Sox (Home) vs Yankees (Away)
  ('test_game_999', '111', 'Boston Red Sox', '147', 'New York Yankees', CURRENT_TIMESTAMP(), 1, 1),

  -- ROW 2: THE VIOLATION (Same gameId, different Home Team ID)
  -- This will cause COUNT(DISTINCT homeTeamId) to be 2
  ('test_game_999', '999', 'Boston Red Sox', '147', 'New York Yankees', CURRENT_TIMESTAMP(), 1, 2),

  -- ROW 3: THE VIOLATION (Same gameId, different Home Team Name)
  -- This will cause COUNT(DISTINCT homeTeamName) to be 2
  ('test_game_999', '111', 'Red Sox (Typo)', '147', 'New York Yankees', CURRENT_TIMESTAMP(), 1, 3),

   -- ROW 4: THE VIOLATION (Same gameId, different Away Team ID)
   -- This will cause COUNT(DISTINCT homeTeamId) to be 2
  ('test_game_999', '111', 'Boston Red Sox', '123', 'New York Yankees', CURRENT_TIMESTAMP(), 1, 1);