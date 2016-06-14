require "rails_helper"

RSpec.describe BestBuyService do
  VCR.use_cassette("nearby_stores#best_buy_service") do
    it "returns 17 nearby stores" do
      service = BestBuyService.new
      stores = JSON.parse(service.nearby_stores.body, symbolize_names: true)
      expect(stores[:total]).to eq 17
      expect(stores[:stores].count).to eq 15
      store = stores[:stores].first
      expect(store[:storeType]).to eq "Mobile"
      expect(store[:city]).to eq "Denver"
      expect(store[:distance]).to eq 3.25
      expect(store[:phone]).to eq "303-270-9189"
      expect(store[:name]).to eq "Cherry Creek Shopping Center"
    end
  end
end
