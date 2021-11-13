# frozen_string_literal: true

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
require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  setup do
    @response = responses(:response_one)
  end

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
    should belong_to(:feedback).without_validating_presence
    should belong_to(:option).without_validating_presence
    should belong_to(:question).without_validating_presence
  end

  test 'if question type 0 body must be exist' do
    response = Response.new(question_id: questions(:question_one).id)
    response.valid?
    refute_equal 'false', response.valid?
    assert_equal response.errors[:body][0], 'Survey question type is a text. Your answer not exist.'
  end

  test 'if question type 1 body can be nil' do
    response = Response.new(body: nil, question_id: questions(:question_two).id, option: options(:option_one))
    response.valid?

    assert_equal response.errors[:body], []
  end

  test 'if question type 1 option must be exist' do
    response = Response.new(body: nil, question_id: questions(:question_two).id, option: nil)
    response.valid?
    assert_equal response.errors[:option_id][0], 'Survey question type is a choice. Your answer not a choice'
  end

  test 'if question type 0 option can be nil' do
    response = Response.new(body: 'Answers', question_id: questions(:question_one).id, option: nil)
    response.valid?
    assert_equal response.errors[:option_id], []
  end
end
