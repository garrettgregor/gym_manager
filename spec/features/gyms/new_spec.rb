require "rails_helper"

RSpec.describe "Create Gym", type: :feature do
  describe "as a visitor" do
    it "can create a gym" do
      # User Story 11, Parent Creation

      # As a visitor
      # When I visit the Parent Index page
      # Then I see a link to create a new Parent record, "New Parent"
      # When I click this link
      # Then I am taken to '/parents/new' where I  see a form for a new parent record
      # When I fill out the form with a new parent's attributes:
      # And I click the button "Create Parent" to submit the form
      # Then a `POST` request is sent to the '/parents' route,
      # a new parent record is created,
      # and I am redirected to the Parent Index page where I see the new Parent displayed.
      visit "/gyms/new"

      # save_and_open_page
      fill_in(:name, with: "Gravity Vault")
      fill_in(:member_cost, with: 150)
      fill_in(:guest_cost, with: 35)
      check(:in_colorado)
      click_button("Create Gym")

      expect(current_path).to eq("/gyms")
      expect(page).to have_content("Gravity Vault")
    end
  end
end
