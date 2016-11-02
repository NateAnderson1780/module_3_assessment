require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)

  end

  it "can get one item by its id" do
    item_last = Item.last

    get "/api/v1/items/#{item_last.id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
  end

  it "can create a new item" do
    item_params = { name: "widget", description: "cool thing", image_url: "widget.jpg" }

    post "/api/v1/items", {item: item_params}
    item = Item.last

    assert_response :success
    expect(response).to be_success
    expect(item.id).to eq(item_params[:id])
    expect(item.name).to eq(item_params[:name])
    expect(item.description).to eq(item_params[:description])
    expect(item.image_url).to eq(item_params[:image_url])
  end

  it "can delete an item" do
    item = Item.first

    delete "/api/v1/items/#{item.id}"

    expect{delete "/api/v1/items/#{item.id}"}.to change(Item, :count).by(-1)
  end

end
