# frozen_string_literal: true

require 'test_helper'

class SurveysControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'http://127.0.0.1:3000'
    @survey = surveys(:survey_one)
    @question = questions(:question_two)
    @res = responses(:response_one)
    @option = options(:option_two)
    @surveys = surveys
  end

  test 'should show surveys' do
    get surveys_url(@surveys)
    assert_response :success
  end

  test 'should show survey' do
    # Reuse the @survey instance variable from setup
    get survey_url(@survey)
    assert_response :success
  end

  test 'feedback for survey' do
    post survey_url(survey_id: @survey.id, feedback: {
                      survey_id: @survey.id,
                      responses_attributes: [
                        question_id: @question.id,
                        option_id: @option.id
                      ]
                    })

    assert_response :created
  end

  test 'failed feedback for survey' do
    post survey_url(survey_id: @survey.id, feedback: {
                      survey_id: @survey.id,
                      responses_attributes: [
                        question_id: @question.id
                      ]
                    })

    assert_response :unprocessable_entity
  end
end
