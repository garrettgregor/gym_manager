require "rails_helper"

RSpec.describe "parent child index page", type: :feature do
  # User Story 5, Parent Children Index

  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  # (data from each column that is on the child table)
  before :each do
    @gym1 = Gym.create!(name: "Movement",
                        member_cost:  92,
                        guest_cost:   25,
                        in_colorado:  true)
    @member1 = Member.create!(name: "Garrett",
                              money_spent: 300,
                              co_resident: true,
                              gym_id: @gym1.id)
    @member2 = Member.create!(name: "Audrey",
                              money_spent: 300,
                              co_resident: true,
                              gym_id: @gym1.id)

    @gym2 = Gym.create!(name: "The Spot",
                        member_cost:  75,
                        guest_cost:   20,
                        in_colorado:  true)
    @member3 = Member.create!(name: "Brad",
                              money_spent: 250,
                              co_resident: false,
                              gym_id: @gym2.id)
    @member4 = Member.create!(name: "Sarah",
                              money_spent: 250,
                              co_resident: false,
                              gym_id: @gym2.id)
  end

  it "can show one of the members" do
    visit "/gyms/#{@gym1.id}/members"
    # save_and_open_page

    expect(page).to have_content("Member Name: #{@member1.name}")
    expect(page).to have_content("Money Spent: $#{@member1.money_spent}")
    expect(page).to have_content("Resident of CO?: #{@member1.co_resident}")
    expect(page).to have_content("Member of: #{@gym1.id}")

    expect(page).to have_content("Member Name: #{@member2.name}")
    expect(page).to have_content("Money Spent: $#{@member2.money_spent}")
    expect(page).to have_content("Resident of CO?: #{@member2.co_resident}")
    expect(page).to have_content("Member of: #{@gym1.id}")
  end

  it "can show one another member" do
    visit "/gyms/#{@gym2.id}/members"
    save_and_open_page

    expect(page).to have_content("Member Name: #{@member3.name}")
    expect(page).to have_content("Money Spent: $#{@member3.money_spent}")
    expect(page).to have_content("Resident of CO?: #{@member3.co_resident}")
    expect(page).to have_content("Member of: #{@gym2.id}")

    expect(page).to have_content("Member Name: #{@member4.name}")
    expect(page).to have_content("Money Spent: $#{@member4.money_spent}")
    expect(page).to have_content("Resident of CO?: #{@member4.co_resident}")
    expect(page).to have_content("Member of: #{@gym2.id}")
  end
end