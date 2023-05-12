class GymsController < ApplicationController
  def index
    @gyms = Gym.all.order(:created_at)
  end

  def show
    @gym = Gym.find(params[:id])
  end
end