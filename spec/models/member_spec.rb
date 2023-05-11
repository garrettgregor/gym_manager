require "rails_helper"

RSpec.describe Member, type: :model do
  describe "relationships" do
    it {should belong_to :gym}
  end
end