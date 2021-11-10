# == Schema Information
#
# Table name: feedbacks
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  survey_id  :uuid
#
# Indexes
#
#  index_feedbacks_on_survey_id  (survey_id)
#
require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  context 'database scheme' do
    should have_db_column(:id).of_type(:uuid).with_options(null: false)
    should have_db_column(:survey_id).of_type(:uuid)
    should have_db_column(:created_at).of_type(:datetime).with_options(null: false)
    should have_db_column(:updated_at).of_type(:datetime).with_options(null: false)
    should have_db_index(:survey_id)
  end

  context 'associations' do
    should belong_to(:survey)
  end
end
