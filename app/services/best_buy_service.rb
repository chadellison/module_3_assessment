class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,city,distance,phone,location,name&pageSize=15")
    @connection.params["apiKey"] = ENV["apiKey"]
  end

  def stores_hash
    parse(nearby_stores)
  end

  def nearby_stores
    connection.get
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)[:stores]
  end
end
