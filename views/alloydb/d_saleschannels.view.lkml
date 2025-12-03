# The name of this view in Looker is "D Saleschannels"
view: d_saleschannels {
  fields_hidden_by_default: yes
  view_label: "Transactions"
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.d_saleschannels ;;
  drill_fields: [saleschannelid]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: saleschannelid {
    primary_key: yes
    type: number
    sql: ${TABLE}."saleschannelid" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Saleschannelname" in Explore.

  dimension: saleschannelname {
    label: "Saleschannel Name"
    hidden: no
    type: string
    sql: ${TABLE}."saleschannelname" ;;
  }
  measure: count {
    type: count
    drill_fields: [saleschannelid, saleschannelname]
  }
}
