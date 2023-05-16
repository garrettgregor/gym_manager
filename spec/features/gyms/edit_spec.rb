require "rails_helper"

RSpec.describe "Update Gym", type: :feature do
  describe "As a visitor" do
    it "can update a gym" do
      # User Story 12, Parent Update

      # As a visitor
      # When I visit a parent show page
      # Then I see a link to update the parent "Update Parent"
      # When I click the link "Update Parent"
      # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
      # When I fill out the form with updated information
      # And I click the button to submit the form
      # Then a `PATCH` request is sent to '/parents/:id',
      # the parent's info is updated,
      # and I am redirected to the Parent's Show page where I see the parent's updated info
      gym1 = Gym.create!(name: "Movemen",
        member_cost: 92,
        guest_cost: 25,
        in_colorado: true)
      gym2 = Gym.create!(name: "The Spot",
        member_cost: 75,
        guest_cost: 20,
        in_colorado: true)

      visit "/gyms/#{gym1.id}/edit"
      # save_and_open_page

      fill_in(:name, with: "Movement")
      fill_in(:member_cost, with: 100)
      fill_in(:guest_cost, with: 10)
      check(:in_colorado)
      click_button("Update Gym")

      expect(current_path).to eq("/gyms/#{gym1.id}")
      expect(page).to have_content("Movement")
      expect(page).to have_content(100)
      expect(page).to have_content(10)
      expect(page).to have_content(true)
    end
  end
end