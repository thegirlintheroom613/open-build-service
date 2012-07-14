require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module OBSWebUI
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Use SQL instead of Active Record's schema dumper when creating the database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql

    # Enforce whitelist mode for mass assignment.
    # This will create an empty whitelist of attributes available for mass-assignment for all models
    # in your app. As such, your models will need to explicitly whitelist or blacklist accessible
    # parameters by using an attr_accessible or attr_protected declaration.
    config.active_record.whitelist_attributes = true
    #NOTE: The above can't hurt, altough we currently only have ActiveXML models ATM.

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    #TODO: Port bento directory structure to lib/assets:
    config.assets.paths << Rails.root.join('public', 'themes') << Rails.root.join('public', 'themes', 'bento', 'images')

    # Skip frameworks you're not going to use
    #config.frameworks -= [ :action_web_service, :active_resource ]

    # Add additional load paths for your own custom dirs
    # config.load_paths += %W( #{Rails.root}/extras )

    # Rails.root is not working directory when running under lighttpd, so it has
    # to be added to load path
    #config.load_paths << Rails.root unless config.load_paths.include? Rails.root
    
    # Force all environments to use the same logger level 
    # (by default production uses :info, the others :debug)
    # config.log_level = :debug
    
    # Use the database for sessions instead of the file system
    # (create the session table with 'rake create_sessions_table')
    # config.action_controller.session_store = :active_record_store
    
    # put the rubygem requirements here for a clean handling
    # rake gems:install (installs the needed gems)
    # rake gems:unpack (this unpacks the gems to vendor/gems)
    
    #config.cache_store = :mem_cache_store, 'localhost:11211', {:namespace => 'obs-webui', :compress => true }
    
    # Activate observers that should always be running
    # config.active_record.observers = :cacher, :garbage_collector
    
    # Make Active Record use UTC-base instead of local time
    # config.active_record.default_timezone = :utc
    
    config.active_record.schema_format = :sql
    
    config.action_controller.perform_caching = true

    config.exceptions_app = self.routes

    # See Rails::Configuration for more options
    config.after_initialize do
      #ExceptionNotifier.exception_recipients = CONFIG["exception_recipients"]
      #ExceptionNotifier.sender_address = CONFIG["exception_sender"]
    end unless Rails.env.test?

  end
end
