view: marketing_campaign_impact_bq {
  sql_table_name: `gemini-looker-demo-dataset.cymbal_gadgets.marketing_campaign_impact` ;;
#   derived_table: {
#     datagroup_trigger: bq_refresh
#     sql:
#     SELECT
#     t.salesid,
#     t.totalprice,
#     t.transaction_date,

#     -- Marketing/Event Context
#     t.campaignname,
#     t.campaign_impact,
#     t.eventname,
#     t.event_impact,
#     t.durationdays,

#     t.productid,
#     t.customerid
# FROM
#     EXTERNAL_QUERY('gemini-looker-demo-dataset.us.global_gadgets_alloydb', '''
#         SELECT
#             t.salesid,
#             t.productid,
#             t.customerid,
#             t.totalprice,

#             d.date AS transaction_date,

#             mc.campaignname,
#             mc.impactmultiplier AS campaign_impact,

#             e.eventname,
#             e.impactmultiplier AS event_impact,
#             e.durationdays
#         FROM
#             v_transactions t
#         INNER JOIN
#             d_dates d ON t.datekey = d.datekey

#         -- LEFT JOIN for Marketing Campaigns (Range lookup)
#         LEFT JOIN
#             d_marketingcampaigns mc ON d.date BETWEEN mc.startdate AND mc.enddate

#         -- LEFT JOIN for Singular Events (Date Match)
#         LEFT JOIN
#             d_events e ON d.date = e.date
#     ''') AS t
# ORDER BY t.salesid;
#     ;;
#   }

# --- Primary Key ---
  dimension: salesid {
    primary_key: yes
    type: number
    sql: ${TABLE}.salesid ;;
  }

  # --- Metrics (Measures) ---
  measure: count {
    type: count
    # drill_fields: [salesid, transaction_date]
  }

  measure: total_price {
    type: sum
    sql: ${TABLE}.totalprice ;;
    value_format_name: usd
  }

  # --- Transaction/Keys ---
  dimension: productid {
    type: number
    sql: ${TABLE}.productid ;;
  }

  dimension: customerid {
    type: number
    sql: ${TABLE}.customerid ;;
  }

  # --- Date Dimension ---
  dimension_group: transaction_date {
    type: time
    timeframes: [date, week, month, quarter, year, raw]
    sql: ${TABLE}.transaction_date ;;
  }

  # --- Marketing Campaign Dimensions ---
  # dimension: campaign_name {
  #   type: string
  #   sql: ${TABLE}.campaignname ;;
  #   group_label: "Campaign Details"
  #   description: "The name of the marketing campaign."

  # }

  dimension: campaignname {
    type: string
    sql: ${TABLE}.campaignname ;;
    group_label: "Campaign Details"
    description: "The name of the marketing campaign."

  }

  dimension: campaign_impact_multiplier {
    label: "Campaign Impact (Multiplier)"
    type: number
    sql: ${TABLE}.campaign_impact ;;
  }

  # --- Event Dimensions ---
  dimension: event_name {
    type: string
    sql: ${TABLE}.eventname ;;
    group_label: "Campaign Details"
  }

  dimension: event_impact_multiplier {
    label: "Event Impact (Multiplier)"
    type: number
    sql: ${TABLE}.event_impact ;;
  }

  dimension: event_duration_days {
    type: number
    sql: ${TABLE}.durationdays ;;
    group_label: "Campaign Details"
    label: "Duration (Days)"
  }

# --- New Measures (Safely added from Snippet 1) ---
  measure: total_campaign_impact {
    label: "Total Campaign Impact"
    description: "The sum of the campaign impact metric across all campaigns."
    type: sum
    sql: ${campaign_impact_multiplier} ;;
    value_format_name: decimal_2
  }

  measure: total_event_impact {
    label: "Total Event Impact"
    description: "The sum of the event impact metric across all campaigns."
    type: sum
    sql: ${event_impact_multiplier} ;;
    value_format_name: decimal_2
  }

  measure: average_duration_days {
    label: "Average Campaign Duration"
    type: average
    sql: ${event_duration_days} ;;
    value_format_name: decimal_1
  }

  # --- New Sets (Safely added from Snippet 1) ---
  set: campaign_details {
    # Adjusted to use Snippet 2's specific dimension names
    fields: [campaignname, event_name, event_duration_days, total_campaign_impact]
  }


}

# view: marketing_event_impact {
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
