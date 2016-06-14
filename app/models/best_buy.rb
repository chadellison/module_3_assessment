class BestBuy < OpenStruct
  attr_reader :service

  def self.service
    @service = BestBuyService.new
  end

  def self.find_stores(zip)
    service.stores_hash(zip).map do |store|
      BestBuy.new(store)
    end
  end
end
