view: locations {
  sql_table_name: google.locations ;;

  dimension: location_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.location_id ;;
  }

  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  measure: actions_driving_directions {
    type: sum
    sql: ${TABLE}.actions_driving_directions ;;
    group_label: "Counts"
  }

  measure: actions_phone {
    type: sum
    sql: ${TABLE}.actions_phone ;;
    group_label: "Counts"
  }

  measure: actions_website {
    type: sum
    sql: ${TABLE}.actions_website ;;
    group_label: "Counts"
  }

  measure: local_post_views_search {
    type: sum
    sql: ${TABLE}.local_post_views_search ;;
    group_label: "Counts"
  }

  measure: photos_count_customers {
    type: sum
    sql: ${TABLE}.photos_count_customers ;;
    group_label: "Counts"
  }

  measure: photos_count_merchant {
    type: sum
    sql: ${TABLE}.photos_count_merchant ;;
    group_label: "Counts"
  }

  measure: photos_views_customers {
    type: sum
    sql: ${TABLE}.photos_views_customers ;;
    group_label: "Counts"
  }

  measure: photos_views_merchant {
    type: sum
    sql: ${TABLE}.photos_views_merchant ;;
    group_label: "Counts"
  }

  measure: queries_direct {
    type: sum
    sql: ${TABLE}.queries_direct ;;
    group_label: "Counts"
  }

  measure: queries_indirect {
    type: sum
    sql: ${TABLE}.queries_indirect ;;
    group_label: "Counts"
  }

  measure: views_maps {
    type: sum
    sql: ${TABLE}.views_maps ;;
    group_label: "Counts"
  }

  measure: views_search {
    type: sum
    sql: ${TABLE}.views_search ;;
    group_label: "Counts"
  }

  measure: average_actions_driving_directions {
    type: average
    sql: ${TABLE}.actions_driving_directions ;;
    group_label: "Averages"
  }

  measure: average_actions_phone {
    type: average
    sql: ${TABLE}.actions_phone ;;
    group_label: "Averages"
  }

  measure: average_actions_website {
    type: average
    sql: ${TABLE}.actions_website ;;
    group_label: "Averages"
  }

  measure: average_local_post_views_search {
    type: average
    sql: ${TABLE}.local_post_views_search ;;
    group_label: "Averages"
  }

  measure: average_photos_count_customers {
    type: average
    sql: ${TABLE}.photos_count_customers ;;
    group_label: "Averages"
  }

  measure: average_photos_count_merchant {
    type: average
    sql: ${TABLE}.photos_count_merchant ;;
    group_label: "Averages"
  }

  measure: average_photos_views_customers {
    type: average
    sql: ${TABLE}.photos_views_customers ;;
    group_label: "Averages"
  }

  measure: average_photos_views_merchant {
    type: average
    sql: ${TABLE}.photos_views_merchant ;;
    group_label: "Averages"
  }

  measure: average_queries_direct {
    type: average
    sql: ${TABLE}.queries_direct ;;
    group_label: "Averages"
  }

  measure: average_queries_indirect {
    type: average
    sql: ${TABLE}.queries_indirect ;;
    group_label: "Averages"
  }

  measure: average_views_maps {
    type: average
    sql: ${TABLE}.views_maps ;;
    group_label: "Averages"
  }

  measure: average_views_search {
    type: average
    sql: ${TABLE}.views_search ;;
    group_label: "Averages"
  }

  measure: count {
    type: count
    drill_fields: [location_id]
  }
}
