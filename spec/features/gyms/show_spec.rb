require "rails_helper"

RSpec.describe "gyms index page", type: :feature do
  # User Story 2, Parent Show

  # As a visitor
  # When I visit '/gyms/:id'
  # Then I see the gym with that id including the gym's attributes
  # (data from each column that is on the gym table)
  it "can show the first gym of the gyms" do
    gym1 = Gym.create!(name: "Movement",
      member_cost: 92,
      guest_cost: 25,
      in_colorado: true)
    gym2 = Gym.create!(name: "The Spot",
      member_cost: 75,
      guest_cost: 20,
      in_colorado: true)
    visit "/gyms/#{gym1.id}"
    # save_and_open_page

    expect(page).to have_content("Gym Name: #{gym1.name}")
    expect(page).to have_content("Member Cost Per Month: $#{gym1.member_cost}")
    expect(page).to have_content("Day Rate for Guests: $#{gym1.guest_cost}")
    expect(page).to have_content("In Colorado: #{gym1.in_colorado}")
  end

  it "can show the other gym of the gyms" do
    gym1 = Gym.create!(name: "Movement",
      member_cost: 92,
      guest_cost: 25,
      in_colorado: true)
    gym2 = Gym.create!(name: "The Spot",
      member_cost: 75,
      guest_cost: 20,
      in_colorado: true)
    visit "/gyms/#{gym2.id}"
    # save_and_open_page

    expect(page).to have_content("Gym Name: #{gym2.name}")
    expect(page).to have_content("Member Cost Per Month: $#{gym2.member_cost}")
    expect(page).to have_content("Day Rate for Guests: $#{gym2.guest_cost}")
    expect(page).to have_content("In Colorado: #{gym2.in_colorado}")
  end

  # User Story 7, Parent Child Count

  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent
  it "can show the other gym of the gyms" do
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

    visit "/gyms/#{gym1.id}"
    # save_and_open_page

    expect(page).to have_content("Gym Name: #{gym1.name}")
    expect(page).to have_content("Number of Members: #{gym1.number_of_members}")
    expect(page).to have_content("Member Cost Per Month: $#{gym1.member_cost}")
    expect(page).to have_content("Day Rate for Guests: $#{gym1.guest_cost}")
    expect(page).to have_content("In Colorado: #{gym1.in_colorado}")

    visit "/gyms/#{gym2.id}"
    # save_and_open_page

    expect(page).to have_content("Gym Name: #{gym2.name}")
    expect(page).to have_content("Number of Members: #{gym2.number_of_members}")
    expect(page).to have_content("Member Cost Per Month: $#{gym2.member_cost}")
    expect(page).to have_content("Day Rate for Guests: $#{gym2.guest_cost}")
    expect(page).to have_content("In Colorado: #{gym2.in_colorado}")
  end

  # User Story 8, Child Index Link

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it "can show a link to the members index page" do
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

    visit "/gyms/#{gym1.id}"
    # save_and_open_page

    expect(page).to have_content("Every Member Everywhere")
    expect(page).to have_link("Every Member Everywhere", href: "/members/")

    visit "/gyms/#{gym2.id}"
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

    visit "/gyms/#{gym1.id}"
    # save_and_open_page

    expect(page).to have_content("Every Gym Everywhere")
    expect(page).to have_link("Every Gym Everywhere", href: "/gyms/")

    visit "/gyms/#{gym2.id}"
    # save_and_open_page

    expect(page).to have_content("Every Gym Everywhere")
    expect(page).to have_link("Every Gym Everywhere", href: "/gyms/")
  end

  # User Story 10, Parent Child Index Link

  # As a visitor
  # When I visit a parent show page ('/parents/:id')
  # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
  it "can show a link to the gyms index page" do
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

    visit "/gyms/#{gym1.id}"
    # save_and_open_page

    expect(page).to have_content("Gym Members")
    expect(page).to have_link("Gym Members", href: "/gyms/#{gym1.id}/members")

    visit "/gyms/#{gym2.id}"
    # save_and_open_page

    expect(page).to have_content("Gym Members")
    expect(page).to have_link("Gym Members", href: "/gyms/#{gym2.id}/members")
  end
end

