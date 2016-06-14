require "rails_helper"

RSpec.describe Api::V1::ItemsController do
  it "returns all of the items" do
    Item.create(name: "this item", description: "beautimous")
    Item.create(name: "rocks", description: "this item is swell")
    get :index, format: :json
    expect(response).to have_http_status(:success)
    items = JSON.parse(response.body, symbolize_names: true)
    expect(items.first[:name]).to eq "this item"
    expect(items.last[:description]).to eq "this item is swell"
    refute items.first[:created_at]
    refute items.last[:updated_at]
  end

  it "returns a single item" do
    item = Item.create(name: "great things", description: "it is great")

    get :show, id: item.id, format: :json
    expect(response).to have_http_status(:success)
    item = JSON.parse(response.body, symbolize_names: true)
    expect(item[:name]).to eq "great things"
  end

  it "deletes an item" do
    item = Item.create(name: "delete me", description: "do it")

    expect(Item.count).to eq 1

    delete :destroy, id: item.id, format: :json
    expect(response).to have_http_status(:success)
    expect(Item.count).to eq 0
  end

  it "creates an item" do
    expect(Item.count).to eq 0
    post :create, format: :json, post: { name: "Item", description: "this item"}
    expect(response).to have_http_status(:success)

    expect(Item.count).to eq 1
  end
end
