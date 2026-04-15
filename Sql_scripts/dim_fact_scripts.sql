-- dim team
create or replace table project-f5aa7f27-0184-4aa1-9b9.baseball_DW.dim_team (
  TeamId String,
  TeamName String,
  PRIMARY KEY (TeamId) NOT ENFORCED
)

-- dim Venue
create or replace table project-f5aa7f27-0184-4aa1-9b9.baseball_DW.dim_venue (
  venueId String,
  venueName String,
  venueSurface String,
  venueCapacity Integer,
  VenueCity String,
  VenueState String,
  VenueZip String,
  VenueMarket String,
  venueOutfieldDistances String,
  PRIMARY KEY (VenueId) NOT ENFORCED
)

-- dim season
create or replace table project-f5aa7f27-0184-4aa1-9b9.baseball_DW.dim_season (
  seasonId String,
  seasonType String,
  Year Integer,
  PRIMARY KEY (seasonId) NOT ENFORCED
)

-- dim DATE
create or replace table project-f5aa7f27-0184-4aa1-9b9.baseball_DW.dim_date (
  startTime TIMESTAMP,
  startTimeFull String,
  startTimeDay Integer,
  startTimeMonth Integer,
  startTimeYear Integer,
  startTimeHour Integer,
  startTimeMinute Integer,
  PRIMARY KEY (startTime) NOT ENFORCED
)