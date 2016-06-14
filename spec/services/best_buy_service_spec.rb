require "rails_helper"

RSpec.describe BestBuyService do
  VCR.use_cassette("nearby_stores#best_buy_service") do
    it "returns 17 nearby stores" do
      service = BestBuyService.new
      stores_hash = service.nearby_stores
      stores = JSON.parse(service.nearby_stores.body, symbolize_names: true)
      expect(stores_hash["total"].count).to eq 17
      expect(stores[:stores].count).to eq 15
    end
  end
end
