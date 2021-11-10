# frozen_string_literal: true

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
class Option < ApplicationRecord
  has_one :response
  belongs_to :question

  validates :title, presence: true, length: { minimum: 3 }
end
