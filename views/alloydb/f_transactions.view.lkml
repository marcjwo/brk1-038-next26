# The name of this view in Looker is "F Transactions"
view: f_transactions {
  view_label: "Transactions"
  fields_hidden_by_default: yes
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.v_transactions ;;
  # This is based on v_transactions now, which is a view on top of full transactions having everything until today!
  drill_fields: [salesid]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: salesid {
    hidden: no
    primary_key: yes
    type: number
    sql: ${TABLE}."salesid" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Customerid" in Explore.

  dimension: customerid {
    type: number
    value_format_name: id
    sql: ${TABLE}."customerid" ;;
  }

  dimension: datekey {
    type: number
    sql: ${TABLE}."datekey" ;;
  }

  dimension: discountamount {
    type: number
    sql: ${TABLE}."discountamount" ;;
  }

  dimension: orderid {
    type: string
    sql: ${TABLE}."orderid" ;;
  }

  dimension: paymenttypeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."paymenttypeid" ;;
  }

  dimension: productid {
    type: number
    value_format_name: id
    sql: ${TABLE}."productid" ;;
  }

  dimension: quantity {
    hidden: no
    type: number
    sql: ${TABLE}."quantity" ;;
  }

  measure: average_quantity {
    hidden: no
    type: average
    sql: ${quantity} ;;
  }


  dimension: saleschannelid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}."saleschannelid" ;;
  }

  dimension: shippingcost {
    type: number
    sql: ${TABLE}."shippingcost" ;;
  }

  dimension: storeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."storeid" ;;
  }

  dimension: taxamount {
    type: number
    sql: ${TABLE}."taxamount" ;;
  }

  dimension: totalprice {
    type: number
    sql: ${TABLE}."totalprice" ;;
  }

  measure: total_sales {
    hidden: no
    type: sum
    sql: ${totalprice} ;;
    value_format_name: usd
  }

  dimension: unitprice {
    type: number
    sql: ${TABLE}."unitprice" ;;
  }
  measure: count {
    hidden: no
    description: "Number of unique orders/transactions"
    synonyms: ["Number of orders","Number of transactions"]
    type: count
    drill_fields: [salesid]
  }
}
