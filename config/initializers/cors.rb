Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000"  # Replace with your frontend domain in production

    resource "*",
      headers: :any,
      expose: [ "Authorization" ], # Add this if you're using JWT authentication
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
      credentials: true
  end
end
