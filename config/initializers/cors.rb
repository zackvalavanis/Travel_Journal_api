Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173'  # Allow this specific origin
    resource '*',                      # Allow all resources
      headers: :any,                  # Allow any headers
      methods: [:get, :post, :put, :patch, :delete, :options, :head]  # Allow specific methods
  end
end
