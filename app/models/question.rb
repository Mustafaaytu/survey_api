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
class Question < ApplicationRecord
  has_many :options, dependent: :destroy
  has_one :response
  belongs_to :survey

  self.inheritance_column = :_type_disabled

  enum type: %i[text choice]
end
