require "rails_helper"

RSpec.describe "gyms index page", type: :feature do
  # User Story 2, Parent Show

  # As a visitor
  # When I visit '/gyms/:id'
  # Then I see the gym with that id including the gym's attributes
  # (data from each column that is on the gym table)
  it "can show the first gym of the gyms" do
    gym1 = Gym.create!(name:         "Movement",
                      member_cost:  92,
                      guest_cost:   25,
                      in_colorado:  true)
    gym2 = Gym.create!(name:         "The Spot",
                      member_cost:  75,
                      guest_cost:   20,
                      in_colorado:  true)
    visit "/gyms/#{gym1.id}"
    # save_and_open_page

    expect(page).to have_content("Gym Name: #{gym1.name}")
    expect(page).to have_content("Member Cost Per Month: $#{gym1.member_cost}")
    expect(page).to have_content("Day Rate for Guests: $#{gym1.guest_cost}")
    expect(page).to have_content("In Colorado: #{gym1.in_colorado}")
  end

  it "can show the other gym of the gyms" do
    gym1 = Gym.create!(name:         "Movement",
                      member_cost:  92,
                      guest_cost:   25,
                      in_colorado:  true)
    gym2 = Gym.create!(name:         "The Spot",
                      member_cost:  75,
                      guest_cost:   20,
                      in_colorado:  true)
    visit "/gyms/#{gym2.id}"
    # save_and_open_page

    expect(page).to have_content("Gym Name: #{gym2.name}")
    expect(page).to have_content("Member Cost Per Month: $#{gym2.member_cost}")
    expect(page).to have_content("Day Rate for Guests: $#{gym2.guest_cost}")
    expect(page).to have_content("In Colorado: #{gym2.in_colorado}")
  end
end

