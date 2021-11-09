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
class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :responses, through: :questions, dependent: :destroy
end
