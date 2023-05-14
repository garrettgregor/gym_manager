require "rails_helper"

RSpec.describe "member index page", type: :feature do
  # User Story 3, member Index

  # As a visitor
  # When I visit '/member_table_name'
  # Then I see each member in the system including the member's attributes
  # (data from each column that is on the member table)
  it "can show all of the members" do
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

    visit "/members"
    # save_and_open_page

    expect(page).to have_content("Member Name: #{member1.name}")
    expect(page).to have_content("Money Spent: $#{member1.money_spent}")
    expect(page).to have_content("Resident of CO?: #{member1.co_resident}")
    expect(page).to have_content("Member of: #{gym1.id}")

    expect(page).to have_content("Member Name: #{member3.name}")
    expect(page).to have_content("Money Spent: $#{member3.money_spent}")
    expect(page).to have_content("Resident of CO?: #{member3.co_resident}")
    expect(page).to have_content("Member of: #{gym2.id}")
  end

  # User Story 8, Child Index Link

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it "can show a link to the members page" do
    gym1 = Gym.create!(name: "Movement",
                        member_cost:  92,
                        guest_cost:   25,
                        in_colorado:  true,
                        created_at: Date.today - 1)
    gym2 = Gym.create!(name: "Touchstone",
                        member_cost:  100,
                        guest_cost:   30,
                        in_colorado:  false)
    visit "/members"
    # save_and_open_page

    expect(page).to have_content("Every Member Everywhere")
    expect(page).to have_link("Every Member Everywhere", href: "/members/")
  end
end