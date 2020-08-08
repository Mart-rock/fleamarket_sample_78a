class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :edit, :update, :destroy, :show]
  before_action :set_item, only: [:edit, :update, :destroy, :show]
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]

  def index
    @items = Item.includes(:item_images).order('created_at DESC')
    @item_lodes = Item.includes(:item_images)
    @item_purchase = ItemPurchase.find_by(item_id: params[:id])
  end

  def new
    @item = Item.new
    @item.item_images.new
    @category_parent_array = Category.where(ancestry: nil)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @category_parent_array = Category.where(ancestry: nil)
  end

  def update
    if @item.update(item_params)
      render :edit unless @item.update(item_params)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def show
    @item_purchase = ItemPurchase.find_by(item_id: params[:id])
    @category_id = @item.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end

  def search
    if params[:keyword].present?
      @Items = Item.where('item LIKE ?', "%#{params[:keywoed]}%")
    else
      @Items = Item.none
    end
  end

  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :condition_id, :price, :completed_at, :brand, :shipping_charges_id, :days_until_delivery_id, :shipping_area_id, :category_id, item_images_attributes: [:image_url, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

end
