ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "07cf7354cb5010d7afec692501dd6240"
  config.secret = "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"
  config.old_secret = "<old_secret>"
  config.scope = "read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2020-04"
  config.session_repository = Shop
end
