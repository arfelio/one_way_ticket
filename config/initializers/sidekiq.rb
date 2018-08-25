redis_url = ENV.fetch("SPLIT_REDIS_URL", "redis://127.0.0.1:6379")

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url }
end

if Rails.env.development? && !!ENV["SIDEKIQ_PERFORM_INLINE"]
  require 'sidekiq/testing'
  Sidekiq::Testing.inline!
end

Sidekiq::Extensions.enable_delay!
