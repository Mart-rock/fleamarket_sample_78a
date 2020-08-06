class ItemImagesController < ApplicationController
  before_action :set_item_image, only: [:edit, :update, :destroy, :show]


  def new
    @item_image = Item_image.new
  end

  def create
    @item_image = Item_image.create(image_params)
  end

  def edit
  end

  def update
    if @item_image.update(image_params)
      render :edit unless @item_image.update(image_params)
    else
      render :edit
    end
  end

  def destroy
    if @item_image.destroy
      render :edit unless @item_image.update(image_params)
    else
      render :edit
    end
  end

  def show
  end

  private
  def image_params
    params.require(:item_images).permit([images_attributes: [:image_url]])
  end

  def set_item_image
    @item_image = Item_image.find(params[:id])
  end
end
