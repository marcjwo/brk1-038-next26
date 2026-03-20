# The name of this view in Looker is "D Stores"
view: d_stores {
  view_label: "Stores"
  fields_hidden_by_default: yes
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.d_stores ;;
  drill_fields: [storeid]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: storeid {
    primary_key: yes
    type: number
    sql: ${TABLE}."storeid" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "City" in Explore.

  dimension: city {
    hidden: no
    type: string
    sql: ${TABLE}."city" ;;
  }

  dimension: country {
    hidden: no
    type: string
    map_layer_name: countries
    sql: ${TABLE}."country" ;;
  }

  dimension: currency {
    hidden: yes
    type: string
    sql: ${TABLE}."currency" ;;
  }

  dimension: latitude {
    hidden: no
    type: number
    sql: ${TABLE}."latitude" ;;
  }

  dimension: longitude {
    hidden: no
    type: number
    sql: ${TABLE}."longitude" ;;
  }

  dimension: location {
    hidden: no
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: opendate {
    hidden: yes
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."opendate" ;;
  }

  dimension: openinghours {
    hidden: yes
    type: string
    sql: ${TABLE}."openinghours" ;;
  }

  dimension: region {
    hidden: no
    type: string
    sql: ${TABLE}."region" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  # dimension: storename {
  #   hidden: no
  #   type: string
  #   sql: ${TABLE}."storename" ;;
  # }

  dimension: storename {
    label: "Store Name"
    hidden: no
    type: string
    sql: CASE WHEN ${TABLE}."storename" IS NOT NULL THEN ${TABLE}."storename" ELSE 'Online Transaction' END ;;
  }


  dimension: zipcode {
    hidden: yes
    type: zipcode
    sql: ${TABLE}."zipcode" ;;
  }
  measure: count {
    type: count
    drill_fields: [storeid, storename]
  }
}
