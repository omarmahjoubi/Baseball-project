-- 1. Rename or delete the corrupted table to clear the path
DROP TABLE `project-f5aa7f27-0184-4aa1-9b9.baseball_DW.fact_game_statistics`;

-- 2. Restore from the snapshot by creating a clone
CREATE TABLE `project-f5aa7f27-0184-4aa1-9b9.baseball_DW.fact_game_statistics`
CLONE `project-f5aa7f27-0184-4aa1-9b9.baseball_DW_bkp.fact_game_statistics_backup`;