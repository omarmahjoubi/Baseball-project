const sources = ["schedules", "games_wide", "games_post_wide"];

sources.forEach((source) => {
  declare({
    database: dataform.projectConfig.vars.source_project_id,
    schema: dataform.projectConfig.vars.source_dataset_id,
    name: source,
  });
});