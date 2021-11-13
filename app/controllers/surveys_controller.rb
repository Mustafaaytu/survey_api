# frozen_string_literal: true

class SurveysController < ApplicationController
  before_action :set_survey, only: %i[show]

  # GET /surveys
  def index
    @surveys = Survey.all
    render 'surveys/index'
  end

  # GET /surveys/:id
  def show; end

  # POST /surveys/:id
  def feedback
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      render template: 'surveys/update', status: :created
    else
      render json: { errors: @feedback.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:name)
  end

  def feedback_params
    params.require(:feedback)
          .permit(responses_attributes: %i[question_id option_id body])
          .merge(survey_id: params[:survey_id])
  end
end
