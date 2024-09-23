class AttemptsController < ApplicationController
  before_action :get_attempt, only: [:update]

  def index
    @attempts = Attempt.all
    render json: @attempts
  end

  def create
    @attempt = Attempt.new(attempt_params)
    if @attempt.save
      render json: @attempt, status: :ok
    else
      render json: @attempt.errors, status: :unprocessable_entity
    end
  end

  def update
    #If there is an attempt at update, then it should have the time
    @attempt.resolved = params[:resolved]
    @attempt.time = params[:time]

    @attempt.save

    if @attempt.update(attempt_params)
      render json: @attempt, status: :ok
    else
      render json: @attempt.errors, status: :unprocessable_entity
    end
  end

  private

  def attempt_params
    params.require(:attempt).permit(:identifier, :resolved, :time, :name)
  end

  def get_attempt
    @attempt = Attempt.find_by(identifier: params[:identifier])
  end
end
