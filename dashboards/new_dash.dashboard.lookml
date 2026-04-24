---
- dashboard: cymbal_gadgets__n26_business_pulse__wnibi
  title: Cymbal Gadgets - N26 Business Pulse - WNIBI
  preferred_viewer: dashboards-next
  # crossfilter_enabled: true
  description: ''
  filters_bar_collapsed: true
  filters_location_top: false
  preferred_slug: 7pvRAShYRvLDEYooYeHKJj
  theme_name: cymbal_gadgets
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: Total Revenue
    name: Total Revenue
    model: gadgets_bq
    explore: transactions_bq
    type: single_value
    fields: [transactions_bq.total_revenue]
    limit: 5000
    column_limit: 50
    listen:
      Brand: transactions_bq.brand
      Category: transactions_bq.category
      Product Name: transactions_bq.productname
      Transaction Date: transactions_bq.transaction_date
    row: 0
    col: 0
    width: 4
    height: 3
    tab_name: ''
  - title: Total Gross Profit
    name: Total Gross Profit
    model: gadgets_bq
    explore: transactions_bq
    type: single_value
    fields: [transactions_bq.total_gross_profit]
    limit: 5000
    column_limit: 50
    listen:
      Brand: transactions_bq.brand
      Category: transactions_bq.category
      Product Name: transactions_bq.productname
      Transaction Date: transactions_bq.transaction_date
    row: 0
    col: 4
    width: 4
    height: 3
    tab_name: ''
  - title: Unique Customers
    name: Unique Customers
    model: gadgets_bq
    explore: transactions_bq
    type: single_value
    fields: [transactions_bq.unique_customers]
    limit: 5000
    column_limit: 50
    listen:
      Brand: transactions_bq.brand
      Category: transactions_bq.category
      Product Name: transactions_bq.productname
      Transaction Date: transactions_bq.transaction_date
    row: 0
    col: 8
    width: 4
    height: 3
    tab_name: ''
  - title: Revenue Trend over Time
    name: Revenue Trend over Time
    model: gadgets_bq
    explore: transactions_bq
    type: looker_area
    fields: [transactions_bq.transaction_month_name, transactions_bq.total_revenue,
      transactions_bq.transaction_year]
    pivots: [transactions_bq.transaction_year]
    fill_fields: [transactions_bq.transaction_year, transactions_bq.transaction_month_name]
    sorts: [transactions_bq.transaction_year, transactions_bq.transaction_month_name]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Brand: transactions_bq.brand
      Category: transactions_bq.category
      Product Name: transactions_bq.productname
      Transaction Date: transactions_bq.transaction_date
    row: 3
    col: 0
    width: 16
    height: 11
    tab_name: ''
  - title: Top Categories by Revenue
    name: Top Categories by Revenue
    model: gadgets_bq
    explore: transactions_bq
    type: looker_column
    fields: [transactions_bq.category, transactions_bq.total_revenue]
    sorts: [transactions_bq.total_revenue desc]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Brand: transactions_bq.brand
      Category: transactions_bq.category
      Product Name: transactions_bq.productname
      Transaction Date: transactions_bq.transaction_date
    row: 0
    col: 16
    width: 8
    height: 8
    tab_name: ''
  - title: Average Order Value
    name: Average Order Value
    model: gadgets_bq
    explore: transactions_bq
    type: single_value
    fields: [transactions_bq.average_order_value]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Brand: transactions_bq.brand
      Category: transactions_bq.category
      Product Name: transactions_bq.productname
      Transaction Date: transactions_bq.transaction_date
    row: 0
    col: 12
    width: 4
    height: 3
    tab_name: ''
  - title: Average Product Rating
    name: Average Product Rating
    model: gadgets_bq
    explore: transactions_bq
    type: looker_bar
    fields: [transactions_bq.category, product_reviews_bq.average_rating]
    sorts: [product_reviews_bq.average_rating desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Brand: transactions_bq.brand
      Category: transactions_bq.category
      Product Name: transactions_bq.productname
      Transaction Date: transactions_bq.transaction_date
    row: 8
    col: 16
    width: 8
    height: 6
    tab_name: ''
  - title: Campaign Impact by Campaign Name
    name: Campaign Impact by Campaign Name
    model: gadgets_bq
    explore: transactions_bq
    type: looker_bar
    fields: [marketing_campaign_impact_bq.campaignname, marketing_campaign_impact_bq.total_campaign_impact,
      marketing_campaign_impact_bq.count]
    sorts: [marketing_campaign_impact_bq.total_campaign_impact desc]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      marketing_campaign_impact_bq.count: Total Campaign Events
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Brand: transactions_bq.brand
      Category: transactions_bq.category
      Product Name: transactions_bq.productname
      Transaction Date: transactions_bq.transaction_date
    row: 14
    col: 0
    width: 24
    height: 8
    tab_name: ''
  - title: Order cancellations by supplier
    name: Order cancellations by supplier
    model: gadgets_bq
    explore: transactions_bq
    type: looker_column
    fields: [transactions_bq.delayed_order_count, transactions_bq.customer_city]
    filters:
      transactions_bq.transaction_date: 2 weeks
      transactions_bq.brand: ''
      transactions_bq.category: ''
      transactions_bq.productname: ''
    sorts: [transactions_bq.delayed_order_count desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      transactions_bq.delayed_order_count: Cancelled Order Count
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Brand: transactions_bq.brand
      Category: transactions_bq.category
      Product Name: transactions_bq.productname
      Transaction Date: transactions_bq.transaction_date
    row: 22
    col: 0
    width: 24
    height: 6
    tab_name: ''
  filters:
  - name: Brand
    title: Brand
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gadgets_bq
    explore: transactions_bq
    listens_to_filters: []
    field: transactions_bq.brand
  - name: Category
    title: Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gadgets_bq
    explore: transactions_bq
    listens_to_filters: []
    field: transactions_bq.category
  - name: Product Name
    title: Product Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gadgets_bq
    explore: transactions_bq
    listens_to_filters: []
    field: transactions_bq.productname
  - name: Transaction Date
    title: Transaction Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gadgets_bq
    explore: transactions_bq
    listens_to_filters: []
    field: transactions_bq.transaction_date
