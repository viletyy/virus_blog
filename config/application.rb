require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VirusBlog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = 'Beijing'
    config.encoding = 'utf-8'
    config.i18n.default_locale = "zh-CN"
    config.i18n.fallbacks = [I18n.default_locale]

    config.active_record.default_timezone = :local
    # 自动加载lib中文件
    config.autoload_paths += %W(#{config.root}/lib)
  end
end
