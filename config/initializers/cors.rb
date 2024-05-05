Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # TODO update
    origins "*"
    # origins "http://localhost:8080/"
    resource "*", headers: :any, methods: [:get, :post]
  end
end
