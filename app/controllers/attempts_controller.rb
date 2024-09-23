class AttemptsController < ApplicationController
  def index
    @attempts = Attempt.all
  end

  def create
    @attempt = Attempt.new(attempt_params)

  end

  def update
  end

  private

  def attempt_params
    params.require(:attempt).permit(:name, :score)
  end
end
