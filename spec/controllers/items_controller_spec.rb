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
end
