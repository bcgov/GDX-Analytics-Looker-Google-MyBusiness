view: driving_directions {
  derived_table: {
    sql:
      SELECT
        gd.*
      FROM
        google.gmb_directions as gd
      WHERE
        {% condition days_aggregated %} gd.days_aggregated {% endcondition %}
    ;;
  }

  label: "Google MyBusiness Driving Directions"

  dimension: utc_query_date {
    type: date
    sql: ${TABLE}.utc_query_date ;;
    label: " Query Date in UTC"
    description: "The aggregate results will be determined based on this UTC based query date."
  }

  dimension: days_aggregated {
    type: number
    sql:${TABLE}.days_aggregated ;;
    label: "Days Aggregated"
    description: "Must be set to one of: 7, 30, or 90. Results are aggregated over this many days as of the UTC Query Date."
  }

  dimension: client_shortname {
    type: string
    sql: ${TABLE}.client_shortname ;;
    label: "Client Short-Name"
    group_label: "Location"
    description: "An internal short-name for the client who controls the locations imported from Google MyBusiness API."
  }

  dimension: location_time_zone {
    type: string
    sql: ${TABLE}.location_time_zone ;;
    label: "Location Time Zone"
    group_label: "Location"
    description: "The time zone where this location is situated."
  }

  dimension: location_postal_code {
    type: string
    sql: ${TABLE}.location_postal_code ;;
    label: "Postal Code"
    group_label: "Location"
    description: "The postal code portion of the location's address."
  }

  dimension: location_name {
    type: string
    sql: ${TABLE}.location_name ;;
    label: "Google Identifier"
    group_label: "Location"
    description: "Google identifier for this location."
  }

  dimension: location_locality {
    type: string
    sql: ${TABLE}.location_locality ;;
    label: "Locality"
    group_label: "Location"
    description: "The city, town, or community portion of the location's address."
  }

  dimension: location_label {
    type: string
    sql: ${TABLE}.location_label ;;
    label: "Business Name"
    group_label: "Location"
    description: "The location's real-world name."
  }

  dimension: region {
    type: location
    sql_latitude: ${TABLE}.region_latitude ;;
    sql_longitude: ${TABLE}.region_longitude ;;
    label: "Region Coordinates"
    group_label: "Region"
    description: "The position of the location based on it's latitude/longitude."
  }


  dimension: rank_on_query {
    type: number
    sql: ${TABLE}.rank_on_query ;;
    label: "Rank of Region"
    group_label: "Region"
    description: "The region's rank by number of requests at this Days Aggregated and UTC Query Date."
  }

  dimension: region_label {
    type: string
    sql: ${TABLE}.region_label ;;
    label: "Region"
    group_label: "Region"
    description: "The region where these results relate to."
  }

  ###
  # MEASURES
  ###

  measure: dynamic_sum {
    required_fields: [days_aggregated]
    type: sum
    sql: CASE
          WHEN ${days_aggregated} = '7' THEN ${TABLE}.region_count_seven_days
          WHEN ${days_aggregated} = '30' THEN ${TABLE}.region_count_thirty_days
          WHEN ${days_aggregated} = '90' THEN ${TABLE}.region_count_ninety_days
          ELSE NULL
         END ;;
    label: "Requests sum"
    description: "The sum of requests from this region filtered on the Days Aggregated ."
  }

  measure: dynamic_average {
    required_fields: [days_aggregated]
    type: average
    sql: CASE
          WHEN ${days_aggregated} = '7' THEN ${TABLE}.region_count_seven_days
          WHEN ${days_aggregated} = '30' THEN ${TABLE}.region_count_thirty_days
          WHEN ${days_aggregated} = '90' THEN ${TABLE}.region_count_ninety_days
          ELSE NULL
         END ;;
    label: "Requests average"
    description: "The average of requests from this region filtered on the Days Aggregated ."
  }

  measure: region_count_seven_days {
    hidden: yes
    type: sum
    sql: ${TABLE}.region_count_seven_days ;;
    label: "7 Day Count"
    description: "The count of requests from this region over 7 days since this query date."
  }

  measure: region_count_thirty_days {
    hidden: yes
    type: sum
    sql: ${TABLE}.region_count_thirty_days ;;
    label: "30 Day Count"
    description: "The count of requests from this region over 30 days since this query date."
  }

  measure: region_count_ninety_days {
    hidden: yes
    type: sum
    sql: ${TABLE}.region_count_ninety_days ;;
    label: "90 Day Count"
    description: "The count of requests from this region over 90 days since this query date."
  }
}
