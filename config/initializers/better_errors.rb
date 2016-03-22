if Rails.env.development? && defined?(BetterErrors)
  BetterErrors::Middleware.allow_ip!("192.168.56.1/24")
end
