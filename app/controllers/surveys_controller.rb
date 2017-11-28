class SurveysController < ApplicationController
  before_action :authenticate_user!
  def index
    @survey = current_user.surveys
  end

  def new
    @survey = Survey.new
  end


  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to @survey
    else
      render 'new'
    end
  end

  private
  def survey_params
    params.require(:survey).permit(
      :question,
      :answer
    )
  end
end
