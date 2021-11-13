# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

survey_one = Survey.create(name: 'Weekly Routine Employee Control')

survey_one_question_one = Question.create(title: 'How was your experience with us today?', survey_id: survey_one.id,
                                          type: 1)
survey_one_question_two = Question.create(title: 'Please explain the reason for your choice', survey_id: survey_one.id)

question_one_options = Option.create([
                                       { title: 'Very Good', question_id: survey_one_question_one.id },
                                       { title: 'Good', question_id: survey_one_question_one.id },
                                       { title: 'Neutral', question_id: survey_one_question_one.id },
                                       { title: 'Bad', question_id: survey_one_question_one.id },
                                       { title: 'Very Bad', question_id: survey_one_question_one.id }
                                     ])
