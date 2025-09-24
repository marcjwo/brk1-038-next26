# Define the database connection to be used for this model.
connection: "cloud-bi-opm-alloydb"

# include all the views
include: "/views/**/*.view.lkml"
include: "/explores/transactions.explore.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: global_gadgets_alloydb_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: global_gadgets_alloydb_default_datagroup
