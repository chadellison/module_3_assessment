class BestBuy < OpenStruct
  attr_reader :service

  def self.service
    @service = BestBuyService.new
  end

  def self.find_stores
    service.stores_hash.map do |store|
      BestBuy.new(store)
    end
  end
end
