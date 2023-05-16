require "rails_helper"

RSpec.describe "parent child new page", type: :feature do
  before :each do
    @gym1 = Gym.create!(name: "Movement",
      member_cost: 92,
      guest_cost: 25,
      in_colorado: true)
    @member1 = Member.create!(name: "Garrett",
      money_spent: 300,
      co_resident: true,
      gym_id: @gym1.id)
    @member2 = Member.create!(name: "Audrey",
      money_spent: 300,
      co_resident: true,
      gym_id: @gym1.id)

    @gym2 = Gym.create!(name: "The Spot",
      member_cost: 75,
      guest_cost: 20,
      in_colorado: true)
    @member3 = Member.create!(name: "Brad",
      money_spent: 250,
      co_resident: false,
      gym_id: @gym2.id)
    @member4 = Member.create!(name: "Sarah",
      money_spent: 250,
      co_resident: false,
      gym_id: @gym2.id)
  end

  # User Story 13, Parent Child Creation

  # As a visitor
  # When I visit a Parent Children Index page
  # Then I see a link to add a new adoptable child for that parent "Create Child"
  # When I click the link
  # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
  # When I fill in the form with the child's attributes:
  # And I click the button "Create Child"
  # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
  # a new child object/row is created for that parent,
  # and I am redirected to the Parent Childs Index page where I can see the new child listed
  it "can direct to a new gym member page" do
    visit "/gyms/#{@gym1.id}/members"

    click_link("Create Member")
    expect(current_path).to eq("/gyms/#{@gym1.id}/members/new")
  end

  it "can create a new gym member" do
    visit "/gyms/#{@gym1.id}/members/new"

    fill_in(:name, with: "Robert")
    fill_in(:money_spent, with: 200)
    check(:co_resident)
    click_button("Create Member")

    expect(current_path).to eq("/gyms/#{@gym1.id}/members")
    # save_and_open_page
    expect(page).to have_content("Member Name: Robert")
    expect(page).to have_content("Money Spent: $200")
    expect(page).to have_content("Resident of CO?: true")
    expect(page).to have_content("Member of: #{@gym1.id}")
  end
end