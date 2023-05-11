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
end