ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "d65cb26014299b6927b13a8a9855ace7"
  config.secret = "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"
  config.old_secret = "<old_secret>"
  config.scope = "read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2019-10"
  config.session_repository = Shop
end
