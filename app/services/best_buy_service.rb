class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://api.bestbuy.com/v1/stores")
    @connection.params["apiKey"] = ENV["apiKey"]
  end

  def stores_hash(zip)
    parse(nearby_stores(zip))
  end

  def nearby_stores(zip)
    binding.pry
    connection.get "(area(#{zip},25))?format=json&show=storeId,storeType,city,distance,phone,location,name&pageSize=15"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)[:stores]
  end
end
