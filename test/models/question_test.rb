# == Schema Information
#
# Table name: questions
#
#  id         :uuid             not null, primary key
#  title      :text
#  type       :integer          default("text")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  survey_id  :uuid
#
# Indexes
#
#  index_questions_on_survey_id  (survey_id)
#
require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
