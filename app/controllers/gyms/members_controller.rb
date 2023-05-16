# module Gyms
#   class MembersController < ApplicationController

#   end
# end

# or...

class Gyms::MembersController < ApplicationController
  def index
    @gym = Gym.find(params[:id])
    @members = @gym.members
  end

  def new
    @gym = Gym.find(params[:id])
  end

  def create
    @gym = Gym.find(params[:id])
    @member = @gym.members.create!(member_params)
    redirect_to "/gyms/#{@gym.id}/members"
  end

  private
  def member_params
    params.permit(
      :name,
      :money_spent,
      :co_resident
    )
  end
end