view: sales {
  derived_table: {
    datagroup_trigger: bq_refresh
    sql:
    SELECT
    -- Fact/Transaction Columns
    t.salesid,
    t.orderid,
    t.quantity,
    t.transaction_unitprice,
    t.discountamount,
    t.shippingcost,
    t.taxamount,
    t.totalprice,

    -- Date Dimension
    t.transaction_date,
    t.year,
    t.quarter,
    t.isweekend,

    -- Customer Dimension
    t.customerid,
    t.firstname,
    t.lastname,
    t.customer_city,
    t.customer_country,
    t.customer_registrationdate,
    t.loyaltytier,

    -- Product Dimension
    t.productid,
    t.productname,
    t.category,
    t.brand,
    t.product_master_price,
    t.product_cost,

    -- Store Dimension
    t.storeid,
    t.storename,
    t.store_city,
    t.store_region,
    t.currency,
    t.latitude,
    t.longitude,
    t.store_country,

    -- Sales Channel Dimension
    t.saleschannelname,

    -- Payment Type Dimension
    t.paymenttypename
FROM
    EXTERNAL_QUERY('gemini-looker-demo-dataset.us.global_gadgets_alloydb', '''
        SELECT
            -- Transaction Metrics & Keys
            t.salesid,
            t.orderid,
            t.customerid,
            t.productid,
            t.storeid,
            t.quantity,
            t.unitprice AS transaction_unitprice,
            t.discountamount,
            t.shippingcost,
            t.taxamount,
            t.totalprice,

            -- D_DATES
            d.date AS transaction_date,
            d.year,
            d.quarter,
            d.isweekend,

            -- D_CUSTOMERS
            c.firstname,
            c.lastname,
            c.city AS customer_city,
            c.country AS customer_country,
            c.loyaltytier,
            c.registrationdate as customer_registrationdate,

            -- D_PRODUCTS
            p.productname,
            p.category,
            p.brand,
            p.unitprice AS product_master_price,
            p.cost AS product_cost,

            -- D_STORES
            s.storename,
            s.country as store_country,
            s.city AS store_city,
            s.region AS store_region,
            s.currency,
            s.latitude,
            s.longitude,

            -- D_SALESCHANNELS
            sc.saleschannelname,

            -- D_PAYMENTTYPES
            pt.paymenttypename
        FROM
            v_transactions t
        INNER JOIN d_customers c ON t.customerid = c.customerid
        INNER JOIN d_products p ON t.productid = p.productid
        INNER JOIN d_dates d ON t.datekey = d.datekey
        INNER JOIN d_stores s ON t.storeid = s.storeid
        INNER JOIN d_saleschannels sc ON t.saleschannelid = sc.saleschannelid
        INNER JOIN d_paymenttypes pt ON t.paymenttypeid = pt.paymenttypeid
    ''') AS t
ORDER BY t.salesid;;
  }

# --- Primary Key ---
  dimension: salesid {
    primary_key: yes
    type: number
    sql: ${TABLE}.salesid ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.totalprice ;;
  }

  # --- Metrics (Measures) ---
  measure: count {
    type: count
    drill_fields: [salesid, orderid, transaction_date_date]
  }

  measure: total_revenue {
    label: "Total Sales Revenue"
    type: sum
    sql: ${total_price} ;;
    # value_format_name: usd
    value_format: "0.000,,\" M\""
  }

  measure: total_quantity_sold {
    type: sum
    sql: ${quantity} ;;
  }

  dimension: transaction_cost {
    type: number
    sql: ${quantity} * ${product_cost} ;;
    value_format_name: usd
  }

  measure: total_cost_sold {
    type: sum
    sql: ${transaction_cost} ;;
    value_format_name: usd
  }

  dimension: transaction_margin {
    type: number
    sql: ${total_price}-${transaction_cost} ;;
    value_format_name: usd
  }

  measure: total_transaction_margin {
    sql: ${transaction_margin} ;;
    value_format_name: usd
    type: sum
  }

  measure: gross_margin_percentage {
    value_format_name: percent_2
    type: number
    sql: ${total_transaction_margin}/${total_revenue}
    ;;
  }

  measure: average_transaction_margin {
    sql: ${transaction_margin} ;;
    value_format_name: usd
    type: average
  }

  measure: average_transaction_value {
    label: "Average Transaction Value"
    type: average
    sql: ${total_price} ;;
    value_format_name: usd

  }

  # --- Transaction/Fact Columns ---
  dimension: orderid {
    type: string
    sql: ${TABLE}.orderid ;;
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discountamount ;;
    value_format_name: usd
  }

  # --- Date Dimensions ---
  dimension_group: transaction_date {
    type: time
    timeframes: [date, week, month,month_name, quarter, year, raw]
    sql: ${TABLE}.transaction_date ;;
  }

  dimension: calendar_year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: is_weekend {
    type: yesno
    sql: ${TABLE}.isweekend ;;
  }

  # --- Customer Dimensions (d_customers) ---
  dimension: customerid {
    type: number
    sql: ${TABLE}.customerid ;;
  }

  dimension: full_customer_name {
    type: string
    sql: concat(${TABLE}.firstname, ' ', ${TABLE}.lastname) ;;
  }

  dimension: customer_city {
    type: string
    sql: ${TABLE}.customer_city ;;
  }

  dimension: customer_country {
    type: string
    sql: ${TABLE}.customer_country ;;
  }

  dimension_group: customer_registration_date {
    type: time
    timeframes: [date, month]
    sql: ${TABLE}.customer_registrationdate ;;
  }

  dimension_group: between_today_and_registration {
    type: duration
    intervals: [day, month]
    sql_start:  ${customer_registration_date_date};;
    sql_end:  CURRENT_DATE() ;;
  }

  dimension_group: between_transaction_and_registration  {
    type: duration
    intervals: [day, month]
    sql_start: ${customer_registration_date_date} ;;
    sql_end: ${transaction_date_date} ;;
  }

  dimension: sanity_check {
    hidden: no
    type: yesno
    sql: DATE_DIFF(${transaction_date_date},${customer_registration_date_date}, DAY) > 1 ;;
  }

  dimension: loyalty_tier {
    type: string
    # tiers: [ "Bronze", "Silver", "Gold", "Platinum"]
    sql: ${TABLE}.loyaltytier ;;
  }

  # --- Product Dimensions (d_products) ---
  dimension: productid {
    type: number
    sql: ${TABLE}.productid ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.productname ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: product_brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: product_cost {
    type: number
    sql: ${TABLE}.product_cost ;;
    value_format_name: usd
  }

  dimension: product_master_price {
    type: number
    sql: ${TABLE}.product_product_master_price ;;
    value_format_name: usd
  }

  dimension: product_margin {
    type: number
    sql:  ${product_master_price}-${product_cost}  ;;
    value_format_name: usd
  }

  # --- Store Dimensions (d_stores) ---
  dimension: store_name {
    type: string
    sql: ${TABLE}.storename ;;
  }

  dimension: store_city {
    type: string
    sql: ${TABLE}.store_city ;;
  }

  dimension: store_region {
    type: string
    sql: ${TABLE}.store_region ;;
  }
  dimension: store_country {
    type: string
    sql: ${TABLE}.store_country ;;
  }
  dimension: store_country_1 {
    type: string
    map_layer_name: countries
    sql:
    CASE
    WHEN ${store_country} = "JP" THEN "Japan"
    WHEN ${store_country} = "US" THEN "United States"
    WHEN ${store_country} = "FR" THEN "France"
    WHEN ${store_country} = "GB" THEN "United Kingdom"
    END
    ;;
  }

  dimension: store_location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  # --- Channel & Payment Dimensions ---
  dimension: sales_channel_name {
    type: string
    sql: ${TABLE}.saleschannelname ;;
  }

  dimension: payment_type_name {
    type: string
    sql: ${TABLE}.paymenttypename ;;
  }
}

# view: sales {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
