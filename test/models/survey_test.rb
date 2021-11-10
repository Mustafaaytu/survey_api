# frozen_string_literal: true

# == Schema Information
#
# Table name: surveys
#
#  id         :uuid             not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  context 'database scheme' do
    should have_db_column(:id).of_type(:uuid).with_options(null: false)
    should have_db_column(:name).of_type(:text)
    should have_db_column(:created_at).of_type(:datetime).with_options(null: false)
    should have_db_column(:updated_at).of_type(:datetime).with_options(null: false)
  end

  context 'associations' do
    should have_many(:questions).dependent(:destroy)
    should have_many(:feedbacks).dependent(:destroy)
    should have_many(:responses).through(:questions).dependent(:destroy)
  end


  context 'validation' do
    context 'for name' do
      should validate_presence_of(:name)
      should_not allow_value(' ').for(:name)
    end
  end


end
