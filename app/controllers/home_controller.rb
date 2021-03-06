class HomeController < AuthenticatedController
	include ApplicationHelper
	require 'xero-ruby'
	before_action :xero_client

	def index
	    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
	    @webhooks = ShopifyAPI::Webhook.find(:all)
	    @ourProducts = ProductQuantity.all
	    if @ourProducts.first == nil
		    @products.each do |product|
		    	puts "entro aca"
		    	product.variants.each do |v|
		    		@productActualQuantity = v.inventory_quantity
		    	end
				@newProduct = ProductQuantity.new(:shopify_id => product.id, :name => product.title, :actualQuantity => @productActualQuantity)
				@newProduct.save
			end
		else
			@products.each do |product|
				if @ourProducts.where(:shopify_id => product.id).first == nil
					puts "entro aca 3"
			    	product.variants.each do |v|
			    		@productActualQuantity = v.inventory_quantity
			    	end
					@newProduct = ProductQuantity.new(:shopify_id => product.id, :name => product.title, :actualQuantity => @productActualQuantity)
					@newProduct.save
				end
			end
		end

		creds = {
      		client_id: "4777ABAC5CEA47D38468FACC71D30A7F",
      		client_secret: "CyIkjr1DA8hT6qDHPXU60RKeli8qFh57RXktgRDkhPF6eKVI",
      		redirect_uri: "https://shopifygt.herokuapp.com/callback",
      		scopes: "openid profile email accounting.settings accounting.reports.read accounting.journals.read accounting.contacts accounting.attachments accounting.transactions assets assets.read projects projects.read offline_access"
    	}
    	
    	@xero_client ||= XeroRuby::ApiClient.new(credentials: creds)

    	@authorization_url = @xero_client.authorization_url

	end

	def callback
	    @token_set = xero_client.get_token_set_from_callback(params)

	    @thisShop = Shop.first
	    @thisShop.update_attribute(:shopify_token, @token_set)

	    # you can use `@xero_client.connections` to fetch info about which orgs
	    # the user has authorized and the most recently connected tenant_id

	end

  	def updateMinQuantity
  		@product = ProductQuantity.find(params[:product_id])
		if @product.update_attribute(:minQuantity, params[:newMinStock])
			@result = "created"
		else
			@result = "error"
		end	
  	end
end