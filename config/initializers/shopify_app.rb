ShopifyApp.configure do |config|
  config.application_name = "App de Prueba"
  config.api_key = "571f70b5ac1425c8499188a61e7281ba"
  config.secret = "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"
  config.old_secret = "<old_secret>"
  config.scope = "read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2020-04"
  config.session_repository = Shop
end
