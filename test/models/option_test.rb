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
require "test_helper"

class OptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
