require 'rails_helper'

describe "user can find stores by zip code" do
  it "can search stores by zip code" do
    visit '/'

    fill_in "Find Stores by Zip Code", with: 80202
    click_on "Search"

    expect(current_path).to eq('/search')

    expect(page).to have_content('17 total stores')

    15.times do |i|
      within(".stores") do
        expect(page).to have_content('Name:')
        expect(page).to have_content('City:')
        expect(page).to have_content('Distance:')
        expect(page).to have_content('Store Type:')
      end
    end
  end
end
