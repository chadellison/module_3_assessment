class Api::V1::ItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def create
    respond_with Item.create(item_params), location: nil
  end

  def destroy
    respond_with Item.destroy(params[:id])
  end

  private

    def item_params
      params.require("post").permit(:name, :description, :image_url)
    end
end
