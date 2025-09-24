# The name of this view in Looker is "D Products"
view: d_products {
  view_label: "Products"
  fields_hidden_by_default: yes
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.d_products ;;
  drill_fields: [productid]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: productid {
    primary_key: yes
    type: number
    sql: ${TABLE}."productid" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Brand" in Explore.

  dimension: brand {
    hidden: no
    type: string
    sql: ${TABLE}."brand" ;;
  }

  dimension: category {
    hidden: no
    type: string
    sql: ${TABLE}."category" ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}."cost" ;;
  }

  dimension: department {
    hidden: no
    type: string
    sql: ${TABLE}."department" ;;
  }

  dimension: productname {
    hidden: no
    type: string
    sql: ${TABLE}."productname" ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}."sku" ;;
  }

  dimension: unitprice {
    type: number
    sql: ${TABLE}."unitprice" ;;
  }
  measure: count {
    type: count
    drill_fields: [productid, productname]
  }
}
