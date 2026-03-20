---
- dashboard: cymbal_gadgets__n26_business_pulse__template
  title: Cymbal Gadgets - N26 Business Pulse - Template
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  filters_bar_collapsed: true
  filters_location_top: false
  preferred_slug: KNuEZswuiZQoTzqzHZKsJT
  theme_name: ''
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
    width: 6
    height: 4
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
    col: 6
    width: 6
    height: 4
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
    col: 12
    width: 6
    height: 4
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
    row: 4
    col: 0
    width: 18
    height: 11
    tab_name: ''
  - title: Top Categories by Revenue
    name: Top Categories by Revenue
    model: gadgets_bq
    explore: transactions_bq
    type: looker_bar
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
    col: 18
    width: 6
    height: 15
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
