class SearchController < ApplicationController
  def index
    @stores = BestBuy.find_stores
  end
end
