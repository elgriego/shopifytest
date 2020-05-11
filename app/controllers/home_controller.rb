# frozen_string_literal: true

class HomeController < AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    @ourProducts = ProductQuantity.all
    @products.each do |product|
    	puts "entro aca"
    	if @ourProducts.first != nil
    		puts "entro aca 2"
    		if @product.where(:shopify_id => product.id).first != nil
    			puts "entro aca 3"
		    	product.variants.each do |v|
		    		@productActualQuantity = v.inventory_quantity
		    	end
				@newProduct = ProductQuantity.new(:shopify_id => product.id, :name => product.title, :actualQuantity => @productActualQuantity)
				@newProduct.save
			end
		end
	end
  end
end