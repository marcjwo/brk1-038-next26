include: "/views/bq/*.view"

explore: sales {
  label: "Full Transaction Analysis"
  # Optional: Define joins here if you want to join other LookML views.
  # Since this view is already denormalized, we will keep it simple.
}
