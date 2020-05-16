ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "4ff0541eb48b8bc77605e3139bcb3eab"
  config.secret = "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"
  config.old_secret = "<old_secret>"
  config.scope = "read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2020-04"
  config.session_repository = Shop
end
