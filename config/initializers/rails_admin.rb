RailsAdmin.config do |c|
  c.excluded_models << RelTest
  c.model User do
    exclude_fields :role
  end
end
