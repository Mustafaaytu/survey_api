# frozen_string_literal: true

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
require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  context 'database scheme' do
    should have_db_column(:id).of_type(:uuid).with_options(null: false)
    should have_db_column(:title).of_type(:text)
    should have_db_column(:type).of_type(:integer).with_options(default: 'text')
    should have_db_column(:survey_id).of_type(:uuid)
    should have_db_column(:created_at).of_type(:datetime).with_options(null: false)
    should have_db_column(:updated_at).of_type(:datetime).with_options(null: false)
    should have_db_index(:survey_id)
  end

  context 'associations' do
    should belong_to(:survey)
  end

  context 'validation' do
    context 'for title' do
      should validate_presence_of(:title)
      should_not allow_value(' ').for(:title)
    end
  end
end
