class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
    member.update(member_params)
    redirect_to "/members/#{member.id}"
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