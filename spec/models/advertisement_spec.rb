require 'rails_helper'

RSpec.describe Advertisement, type: :model do
    let(:ad) {Advertisement.create!(title: "New Ad Title", body: "New Ad Body", price: 3)}

    describe "attributes" do
        it "has title and body attributes" do
            expect(ad).to have_attributes(title: "New Ad Title", body: "New Ad Body", price: 3)
        end
    end
end
