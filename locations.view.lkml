view: locations {
  sql_table_name: google.locations ;;

  dimension: location_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.location_id ;;
  }

  dimension: actions_driving_directions {
    type: number
    sql: ${TABLE}.actions_driving_directions ;;
  }

  dimension: actions_phone {
    type: number
    sql: ${TABLE}.actions_phone ;;
  }

  dimension: actions_website {
    type: number
    sql: ${TABLE}.actions_website ;;
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
measure: local_post_views_search {
  type: sum
  sql: ${TABLE}.local_post_views_search ;;
  group_label: "counts"
}

measure: photos_count_customers {
  type: sum
  sql: ${TABLE}.photos_count_customers ;;
  group_label: "counts"
}

measure: photos_count_merchant {
  type: sum
  sql: ${TABLE}.photos_count_merchant ;;
  group_label: "counts"
}

measure: photos_views_customers {
  type: sum
  sql: ${TABLE}.photos_views_customers ;;
  group_label: "counts"
}

measure: photos_views_merchant {
  type: sum
  sql: ${TABLE}.photos_views_merchant ;;
  group_label: "counts"
}

measure: queries_direct {
  type: sum
  sql: ${TABLE}.queries_direct ;;
  group_label: "counts"
}

measure: queries_indirect {
  type: sum
  sql: ${TABLE}.queries_indirect ;;
  group_label: "counts"
}

measure: views_maps {
  type: sum
  sql: ${TABLE}.views_maps ;;
  group_label: "counts"
}

measure: views_search {
  type: sum
  sql: ${TABLE}.views_search ;;
  group_label: "counts"
}

measure: average_local_post_views_search {
  type: average
  sql: ${TABLE}.local_post_views_search ;;
  group_label: "averages"
}

measure: average_photos_count_customers {
  type: average
  sql: ${TABLE}.photos_count_customers ;;
  group_label: "averages"
}

measure: average_photos_count_merchant {
  type: average
  sql: ${TABLE}.photos_count_merchant ;;
  group_label: "averages"
}

measure: average_photos_views_customers {
  type: average
  sql: ${TABLE}.photos_views_customers ;;
  group_label: "averages"
}

measure: average_photos_views_merchant {
  type: average
  sql: ${TABLE}.photos_views_merchant ;;
  group_label: "averages"
}

measure: average_queries_direct {
  type: average
  sql: ${TABLE}.queries_direct ;;
  group_label: "averages"
}

measure: average_queries_indirect {
  type: average
  sql: ${TABLE}.queries_indirect ;;
  group_label: "averages"
}

measure: average_views_maps {
  type: average
  sql: ${TABLE}.views_maps ;;
  group_label: "averages"
}

measure: average_views_search {
  type: average
  sql: ${TABLE}.views_search ;;
  group_label: "averages"
}

  measure: count {
    type: count
    drill_fields: [location_id]
  }
}
