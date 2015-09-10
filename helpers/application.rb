def application_layout
  { layout: :"layouts/application" }
end

def parse_errors(errors)
  errors.map do |key, error|
    error
  end.join(", ")
end
