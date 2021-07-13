require 'sidekiq/web'

SIDEKIQ_LOGIN = 'admin'
SIDEKIQ_PASSWORD = 'admin'

Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: '_interslice_session'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(SIDEKIQ_LOGIN)) &
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(SIDEKIQ_PASSWORD))
end

Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :notes
      resources :diaries
    end
  end

  mount Sidekiq::Web => '/sidekiq'
end
