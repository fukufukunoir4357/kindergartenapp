require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kindergartenapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    
    config.load_defaults 5.2
    config.generators.template_engine = :slim
    
    config.generators do |g| g.test_framework :rspec,
      fixtures: false,     #テストデータベースにレコードを作成するファイル生成をしない
      view_specs: false,   #viewsペックを作成しない
      helper_specs: false, #ヘルパーファイル用のスペックを作成しない
      routing_specs: false #ルーティングスペックを作成しない
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
