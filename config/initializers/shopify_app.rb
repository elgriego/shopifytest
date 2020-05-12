ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "986b091bccfe7954e103a0e7f63c22ed"
  config.secret = "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"
  config.old_secret = "<old_secret>"
  config.scope = "read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2020-04"
  config.session_repository = Shop
end
