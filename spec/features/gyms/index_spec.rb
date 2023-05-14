require "rails_helper"

RSpec.describe "gyms index page", type: :feature do
  # User Story 1, Gym Index

  # For each gyms table
  # As a visitor
  # When I visit '/gyms'
  # Then I see the name of each gym record in the system
  it "can show all of the gyms" do
    gym1 = Gym.create!(name: "Movement",
      member_cost: 92,
      guest_cost: 25,
      in_colorado: true)
    gym2 = Gym.create!(name: "The Spot",
      member_cost: 75,
      guest_cost: 20,
      in_colorado: true)
      
    visit "/gyms"
    # save_and_open_page

    expect(page).to have_content("Gym Name: #{gym1.name}")
    expect(page).to have_content("Created At: #{gym1.created_at}")

    expect(page).to have_content("Gym Name: #{gym2.name}")
    expect(page).to have_content("Created At: #{gym2.created_at}")
  end

  # User Story 6, Parent Index sorted by Most Recently Created

  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
  it "can show all of the gyms in the order they were created at" do
    gym1 = Gym.create!(name: "Movement",
      member_cost: 92,
      guest_cost: 25,
      in_colorado: true,
      created_at: Date.today - 1)
    gym2 = Gym.create!(name: "Touchstone",
      member_cost: 100,
      guest_cost: 30,
      in_colorado: false)

    visit "/gyms"
    # save_and_open_page

    expect("Gym Name: #{gym2.name}").to appear_before("Gym Name: #{gym1.name}")
    expect("Created At: #{gym2.created_at}").to appear_before("Created At: #{gym1.created_at}")
  end

  # User Story 8, Child Index Link

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it "can show a link to the members index page" do
    gym1 = Gym.create!(name: "Movement",
      member_cost: 92,
      guest_cost: 25,
      in_colorado: true,
      created_at: Date.today - 1)
    gym2 = Gym.create!(name: "Touchstone",
      member_cost: 100,
      guest_cost: 30,
      in_colorado: false)

    visit "/gyms"
    # save_and_open_page

    expect(page).to have_content("Every Member Everywhere")
    expect(page).to have_link("Every Member Everywhere", href: "/members/")
  end

  # User Story 9, Parent Index Link

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index
  it "can show a link to the gyms index page" do
    gym1 = Gym.create!(name: "Movement",
      member_cost: 92,
      guest_cost: 25,
      in_colorado: true,
      created_at: Date.today - 1)
    gym2 = Gym.create!(name: "Touchstone",
      member_cost: 100,
      guest_cost: 30,
      in_colorado: false)

    visit "/gyms"
    # save_and_open_page

    expect(page).to have_content("Every Gym Everywhere")
    expect(page).to have_link("Every Gym Everywhere", href: "/gyms/")
  end
end