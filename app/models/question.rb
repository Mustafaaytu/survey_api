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
  has_many :responses, dependent: :destroy
  belongs_to :survey

  self.inheritance_column = :_type_disabled

  enum type: %i[text choice]

  validates :title, presence: true, length: { minimum: 3 }
  validates :type, inclusion: { in: %i[text choice] }
end
