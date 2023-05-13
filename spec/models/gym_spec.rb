require "rails_helper"

RSpec.describe Gym, type: :model do
  describe "relationships" do
    it { should have_many :members }
  end

  describe "#order_by_created_at" do
    it "will sort items in most recently created order" do
      gym1 = Gym.create!(name: "Touchstone",
        member_cost: 100,
        guest_cost: 30,
        in_colorado: false)
      gym2 = Gym.create!(name: "Movement",
        member_cost: 92,
        guest_cost: 25,
        in_colorado: true)

      # actual = Gym.order_by_created
      # expected/result = [gym2,gym1]

      expect(Gym.order_by_created).to eq([gym2,gym1])
    end
  end

  describe "#number_of_members" do
    it "will calculate the number of members at a gym" do
      gym1 = Gym.create!(name: "Movement",
        member_cost: 92,
        guest_cost: 25,
        in_colorado: true)
      member1 = Member.create!(name: "Garrett",
        money_spent: 300,
        co_resident: true,
        gym_id: gym1.id)
      member2 = Member.create!(name: "Audrey",
        money_spent: 300,
        co_resident: true,
        gym_id: gym1.id)

      gym2 = Gym.create!(name: "The Spot",
        member_cost: 75,
        guest_cost: 20,
        in_colorado: true)
      member3 = Member.create!(name: "Brad",
        money_spent: 250,
        co_resident: false,
        gym_id: gym2.id)
      member4 = Member.create!(name: "Sarah",
        money_spent: 250,
        co_resident: false,
        gym_id: gym2.id)
      member5 = Member.create!(name: "Chris",
        money_spent: 250,
        co_resident: true,
        gym_id: gym2.id)

      expect(gym1.number_of_members).to eq(2)
      expect(gym2.number_of_members).to eq(3)
    end
  end

end