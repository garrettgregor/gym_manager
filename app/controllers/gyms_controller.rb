class GymsController < ApplicationController
  def index
    @gyms = Gym.ordered_members
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def new
    
  end
end