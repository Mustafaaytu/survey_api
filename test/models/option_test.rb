# == Schema Information
#
# Table name: options
#
#  id          :uuid             not null, primary key
#  title       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :uuid
#
# Indexes
#
#  index_options_on_question_id  (question_id)
#
require 'test_helper'

class OptionTest < ActiveSupport::TestCase
  context 'database scheme' do
    should have_db_column(:id).of_type(:uuid).with_options(null: false)
    should have_db_column(:title).of_type(:text)
    should have_db_column(:question_id).of_type(:uuid)
    should have_db_column(:created_at).of_type(:datetime).with_options(null: false)
    should have_db_column(:updated_at).of_type(:datetime).with_options(null: false)
    should have_db_index(:question_id)
  end

  context 'associations' do
    should belong_to(:question)
    should have_many(:responses).dependent(:destroy)
  end

  context 'validation' do
    context 'for title' do
      should validate_presence_of(:title)
      should_not allow_value(' ').for(:title)
    end
  end
end
