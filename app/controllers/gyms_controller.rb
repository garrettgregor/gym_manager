class GymsController < ApplicationController
  def index
    @gyms = Gym.order_by_created
  end

  def show
    @gym = Gym.find(params[:id])
  end
end