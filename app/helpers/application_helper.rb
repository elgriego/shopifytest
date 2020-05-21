module ApplicationHelper

  def xero_client
    creds = {
      		client_id: "4777ABAC5CEA47D38468FACC71D30A7F",
      		client_secret: "CyIkjr1DA8hT6qDHPXU60RKeli8qFh57RXktgRDkhPF6eKVI",
      		redirect_uri: "https://shopifygt.herokuapp.com/callback",
      		scopes: "openid profile email accounting.settings accounting.reports.read accounting.journals.read accounting.contacts accounting.attachments accounting.transactions assets assets.read projects projects.read offline_access"
    	}
    @xero_client ||= XeroRuby::ApiClient.new(credentials: creds)
    return @xero_client
  end
end
