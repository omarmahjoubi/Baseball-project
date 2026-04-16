function assert_game_field_consistency(table, game_id_col, field_id_col, field_name_col) {
  


  return `
    SELECT
      ${game_id_col},
      COUNT(DISTINCT ${field_id_col}) AS id_count,
      COUNT(DISTINCT ${field_name_col}) AS name_count
    FROM
      ${table}
    GROUP BY
      1
    HAVING
      id_count > 1 
      OR name_count > 1
      OR MAX(${field_id_col}) IS NULL 
      OR MAX(${field_name_col}) IS NULL
  `;
}

module.exports = { assert_game_field_consistency };