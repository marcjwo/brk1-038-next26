# The name of this view in Looker is "D Paymenttypes"
view: d_paymenttypes {
  fields_hidden_by_default: yes
  view_label: "Transactions"
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.d_paymenttypes ;;
  drill_fields: [paymenttypeid]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: paymenttypeid {
    primary_key: yes
    type: number
    sql: ${TABLE}."paymenttypeid" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Paymenttypename" in Explore.

  dimension: paymenttypename {
    hidden: no
    type: string
    sql: ${TABLE}."paymenttypename" ;;
  }
  measure: count {
    type: count
    drill_fields: [paymenttypeid, paymenttypename]
  }
}
