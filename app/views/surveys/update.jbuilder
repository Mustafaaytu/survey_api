json.id @feedback.id
json.responses do
  json.array! @feedback.responses do |response|
    json.id response.id
    json.body response.body
    json.option_id response.option_id
    json.question_id response.question_id
  end
end