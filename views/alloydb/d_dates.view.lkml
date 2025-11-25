# The name of this view in Looker is "D Dates"
view: d_dates {
  fields_hidden_by_default: yes
  view_label: "Transactions"
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.d_dates ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    label: "Transaction"
    hidden: no
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Datekey" in Explore.

  dimension: datekey {
    type: number
    sql: ${TABLE}."datekey" ;;
  }

  dimension: day {
    type: number
    sql: ${TABLE}."day" ;;
  }

  dimension: dayofweek {
    type: number
    sql: ${TABLE}."dayofweek" ;;
  }

  dimension: isweekend {
    type: yesno
    sql: ${TABLE}."isweekend" ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}."month" ;;
  }

  dimension: quarter {
    type: number
    sql: ${TABLE}."quarter" ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}."year" ;;
  }
  measure: count {
    type: count
  }
}
