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
class Response < ApplicationRecord
  belongs_to :question
  belongs_to :option, optional: true
  belongs_to :feedback

  validates :body,      presence: { message: 'Survey question type is a text. Your answer not exist.' },
                        if: -> { question.presence.text? }
  validates :option_id, presence: { message: 'Survey question type is a choice. Your answer not a choice' },
                        if: -> { question.presence.choice? }
end
