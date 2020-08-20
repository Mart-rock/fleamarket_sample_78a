class ItemImagesController < ApplicationController
  before_action :set_item_image, only: [:edit, :update, :destroy, :show]


  def new
    @item_image = ItemImage.new
  end

  def create
    @item_image = ItemImage.create(params)
  end

  def edit
    @item_image = ItemImage.find(params[:id])
  end

  def update
    @item_image = ItemImage.find(params[:id])
    @item_image.update(params)
  end

  def destroy
    @item_image = ItemImage.find(params[:id])
    @item_image.destroy
  end

  def show
  end

  private
  def image_params
    params.require(:item_images).permit([images_attributes: [:image_url, :_destroy, :id]])
  end

  def set_item_image
    @item_image = ItemImage.find(params[:id])
  end
end
