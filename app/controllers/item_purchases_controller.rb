class ItemPurchasesController < ApplicationController
 # before_action :set_card, only: [:pay]
 # before_action :set_item, only: [:pay]

  def pay_index
   # @card = @set_card.first
   # if @card.blank?
   #   redirect_to controller: "cards", action: "new"
   # else
   #   Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
   #   customer = Payjp::Customer.retrieve(@card.customer_id)
   #   @default_card_information = customer.cards.retrieve(@card.card_id)
   # end
  end

 # def pay
 #   @card = @set_card.first
 #   Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
 #   Payjp::Charge.create(
 #   :amount => @item.price,
 #   :customer => @card.customer_id,
 #   :currency => 'jpy',
 # )
 # redirect_to action: 'done', item_id: @item
 # end
#
 # def done
 #   ItemPurchases.create(item_id: @item.id, user_id: current_user.id)
 # end
#
 # private

  #def set_card
  #  @set_card = Card.where(user_id: current_user.id)
  #end

 # def set_item
 #   @item = Item.find(params[:item_id])
 # end

end