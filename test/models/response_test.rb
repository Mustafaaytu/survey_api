# == Schema Information
#
# Table name: responses
#
#  id          :uuid             not null, primary key
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  feedback_id :uuid
#  option_id   :uuid
#  question_id :uuid
#
# Indexes
#
#  index_responses_on_feedback_id  (feedback_id)
#  index_responses_on_option_id    (option_id)
#  index_responses_on_question_id  (question_id)
#
require "test_helper"

class ResponseTest < ActiveSupport::TestCase
  context 'database scheme' do
    should have_db_column(:id).of_type(:uuid).with_options(null: false)
    should have_db_column(:body).of_type(:text)
    should have_db_column(:feedback_id).of_type(:uuid)
    should have_db_column(:option_id).of_type(:uuid)
    should have_db_column(:question_id).of_type(:uuid)
    should have_db_column(:created_at).of_type(:datetime).with_options(null: false)
    should have_db_column(:updated_at).of_type(:datetime).with_options(null: false)
    should have_db_index(:feedback_id)
    should have_db_index(:option_id)
    should have_db_index(:question_id)
  end

  context 'associations' do
    should belong_to(:feedback)
    should belong_to(:option)
    should belong_to(:question)
  end
end
