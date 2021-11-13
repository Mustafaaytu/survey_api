# frozen_string_literal: true

json.survey do
  json.extract! @survey, :id, :name # :feedbacks
  json.questions @survey.questions do |question|
    json.id question.id
    json.type question.type
    json.title question.title
    json.options question.options do |option|
      json.id option.id
      json.title option.title
    end
  end
end
