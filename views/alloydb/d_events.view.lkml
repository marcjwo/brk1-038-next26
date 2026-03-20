# The name of this view in Looker is "D Events"
view: d_events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.d_events ;;
  drill_fields: [eventid]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: eventid {
    primary_key: yes
    type: number
    sql: ${TABLE}."eventid" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Durationdays" in Explore.

  dimension: durationdays {
    type: number
    sql: ${TABLE}."durationdays" ;;
  }

  dimension: eventname {
    type: string
    sql: ${TABLE}."eventname" ;;
  }

  dimension: impactmultiplier {
    type: number
    sql: ${TABLE}."impactmultiplier" ;;
  }
  measure: count {
    type: count
    drill_fields: [eventid, eventname]
  }
}
