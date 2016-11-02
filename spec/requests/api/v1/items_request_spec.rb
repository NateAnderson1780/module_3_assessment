require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do


    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)

  end

  it "can get one item by its id" do

    get '/api/v1/items/1'

    item = JSON.parse(response.body)

    expect(response).to be_success
  end

  it "can create a new item" do
    item_params = { name: "widget", description: "cool thing" }

    post "/api/v1/items", params: {item: item_params}
    item = Item.last

    assert_response :success
    expect(response).to be_success
    expect(item.name).to eq(item_params[:name])
  end

end
