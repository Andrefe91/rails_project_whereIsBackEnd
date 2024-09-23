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
    @attempt.resolved = params[:resolved]
    @attempt.save

    if @attempt.update(attempt_params)
      render json: @attempt
    else
      render json: @attempt.errors, status: :unprocessable_entity
    end
  end

  private

  def attempt_params
    params.require(:attempt).permit(:identifier, :resolved)
  end

  def get_attempt
    @attempt = Attempt.find_by(identifier: params[:identifier])
  end
end
