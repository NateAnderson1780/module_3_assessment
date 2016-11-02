require 'rails_helper'

describe "user can find one stores hours" do
  it "can see store hours and details for a specific store" do
    VCR.use_cassette("store_hours") do
      visit '/'

      fill_in "Find Stores by Zip Code", with: 80202
      click_on "Search"

      expect(current_path).to eq('/search')

      click_link "Best Buy Mobile - Cherry Creek Shopping Center"

      expect(current_path).to eq("/stores/1")

      expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(page).to have_content("Mobile")
      expect(page).to have_content("3000 East First Ave, Denver, CO, 80206")

      within (".hours") do
        expect(page).to have_content("Mon: 10am-9pm")
        expect(page).to have_content("Tue: 10am-9pm")
        expect(page).to have_content("Wed: 10am-9pm")
        expect(page).to have_content("Thurs: 10am-9pm")
        expect(page).to have_content("Fri: 10am-9pm")
        expect(page).to have_content("Sat: 10am-9pm")
        expect(page).to have_content("Sun: 11am-6pm")
      end
    end
  end
end
