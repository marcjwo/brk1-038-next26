# The name of this view in Looker is "D Marketingcampaigns"
view: d_marketingcampaigns {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.d_marketingcampaigns ;;
  drill_fields: [campaignid]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: campaignid {
    primary_key: yes
    type: number
    sql: ${TABLE}."campaignid" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Campaignname" in Explore.

  dimension: campaignname {
    type: string
    sql: ${TABLE}."campaignname" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: enddate {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."enddate" ;;
  }

  dimension: impactmultiplier {
    type: number
    sql: ${TABLE}."impactmultiplier" ;;
  }

  dimension_group: startdate {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."startdate" ;;
  }
  measure: count {
    type: count
    drill_fields: [campaignid, campaignname]
  }
}
