class Gym < ApplicationRecord
  has_many :members

  def self.order_by_created
    #self.order(created_at: :desc)
    # ^ does the same thing but as a reminder that this is a class method
    order(created_at: :desc)
  end

  def number_of_members
    members.count
  end

end