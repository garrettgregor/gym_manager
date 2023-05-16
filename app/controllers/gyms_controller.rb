class GymsController < ApplicationController
  def index
    @gyms = Gym.ordered_members
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def new
  end

  def update
    gym = Gym.find(params[:id])
    gym.update(gym_params)
    redirect_to "/gyms/#{gym.id}"
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def create
    gym = Gym.create(gym_params)
    redirect_to "/gyms"
  end

  private

  def gym_params
    params.permit(
      :name,
      :member_cost,
      :guest_cost,
      :in_colorado
    )
  end
end