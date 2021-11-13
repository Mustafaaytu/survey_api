# frozen_string_literal: true

json.array!(@surveys) do |survey|
  json.name survey.name
  json.id survey.id
  json.created_at survey.created_at
  json.updated_at survey.updated_at
end
