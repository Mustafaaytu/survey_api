# frozen_string_literal: true

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
class Feedback < ApplicationRecord
  has_many :responses, dependent: :destroy
  accepts_nested_attributes_for :responses
  belongs_to :survey
end
