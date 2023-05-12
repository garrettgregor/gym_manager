require "rails_helper"

RSpec.describe "gyms index page", type: :feature do
  # User Story 1, Gym Index

  # For each gyms table
  # As a visitor
  # When I visit '/gyms'
  # Then I see the name of each gym record in the system
  before :each do
    @gym1 = Gym.create!(name: "Movement",
                      member_cost:  92,
                      guest_cost:   25,
                      in_colorado:  true)
    @gym2 = Gym.create!(name: "The Spot",
                      member_cost:  75,
                      guest_cost:   20,
                      in_colorado:  true)
  end

  it "can show all of the gyms" do
    visit "/gyms"
    # save_and_open_page

    expect(page).to have_content("Gym Name: #{@gym1.name}")
    expect(page).to have_content("Member Cost Per Month: $#{@gym1.member_cost}")
    expect(page).to have_content("Day Rate for Guests: $#{@gym1.guest_cost}")
    expect(page).to have_content("In Colorado: #{@gym1.in_colorado}")

    expect(page).to have_content("Gym Name: #{@gym2.name}")
    expect(page).to have_content("Member Cost Per Month: $#{@gym2.member_cost}")
    expect(page).to have_content("Day Rate for Guests: $#{@gym2.guest_cost}")
    expect(page).to have_content("In Colorado: #{@gym2.in_colorado}")
  end

  # User Story 6, Parent Index sorted by Most Recently Created

  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
end