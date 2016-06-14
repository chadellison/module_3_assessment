require "rails_helper"

RSpec.describe BestBuyService do
  VCR.use_cassette("method#best_buy_service") do
    it "returns a nearby store" do
    end
  end
end
