require 'rails_helper'

describe "Item API Service" do
  it "finds items for a cateogry" do
    VCR.use_cassette("search_by_category") do

      item = ItemService.by_category



    end
  end
end
