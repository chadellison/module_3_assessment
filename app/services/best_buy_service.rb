class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,name&pageSize=15")
    @connection.params["apiKey"] = ENV["apiKey"]
  end

  def nearby_stores
    connection.get
  end
end
