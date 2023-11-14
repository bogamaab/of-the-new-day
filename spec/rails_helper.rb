# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false


  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://rspec.info/features/6-0/rspec-rails
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  # FactoryBot Helper
  config.include FactoryBot::Syntax::Methods

  # Rspec-HTML Helper
  config.include RSpecHtmlMatchers

  #Devise Helper
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Devise::Test::IntegrationHelpers, type: :request

  # Capybara
  Capybara.javascript_driver = :capybara_webmock_chrome
  Capybara.register_driver :capybara_webmock_chrome do |app|
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { args: %w(headless disable-gpu no-sandbox --windown-size=1366,768--user-agent='Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:56.0) Gecko/20100101 Firefox/56.0') },
      loggingPrefs: { browser: 'ALL' }
    )

    Capybara::Selenium::Driver.new(nil, browser: :remote, url: "http://selenium:4444/wd/hub", desired_capabilities: caps).tap do |driver|
      driver.browser.file_detector = -> args do
        str = args.first.to_s
        str if File.exist?(str)
      end
    end
  end

  ip = `/sbin/ip route|awk '/scope/ { print $9 }'`
  ip.gsub!(/\n/, "")

  config.around(:each, type: :feature) do |example|
    Capybara.server = :webrick
    old_host = Capybara.server_host
    old_port = Capybara.server_port
    old_app_host = Capybara.app_host

    Capybara.server_host = ip
    Capybara.server_port = 3001
    Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"

    if example.metadata[:js]
      DatabaseCleaner[:active_record].strategy = :truncation
    else
      DatabaseCleaner[:active_record].strategy = :transaction
    end

    example.run

    Capybara.server_host = old_host
    Capybara.server_port = old_port
    Capybara.app_host = old_app_host
  end

  config.before(:each) do
    DatabaseCleaner[:redis].strategy = :deletion
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner[:active_record].start
  end

  config.after(:each) do
    DatabaseCleaner[:active_record].clean
  end

  # Config Shoulda-Matcher to Rspec
  Shoulda::Matchers.configure do |config_shoulda|
    config_shoulda.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
