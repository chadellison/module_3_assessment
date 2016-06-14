require "rails_helper"

RSpec.describe BestBuy do
  it "returns the nearby stores" do
    stores = BestBuy.find_stores("80202")
    expect(stores.count).to eq 15
    store = stores.last

    expect(store.name).to eq "S.E. Aurora"
    expect(store.phone).to eq "303-693-0166"
    expect(store.distance).to eq 18.51
    expect(store.city).to eq "Aurora"
    expect(store.storeType).to eq "BigBox"
  end
end
