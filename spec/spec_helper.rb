require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'
  require 'paperclip/matchers'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  Fabrication.configure do |config|
    config.fabricator_path = "spec/fabricators"
  end

  RSpec.configure do |config|
    config.include Paperclip::Shoulda::Matchers
    
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false

    config.before(:suite) do
      DatabaseCleaner.strategy = :deletion
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
      Capybara.reset_sessions!
      Capybara.use_default_driver
    end
  end

  def json_data(resp)
    JSON.parse(resp.kind_of?(String) ? resp : resp.body)
  end

  def json_error(resp)
    json_data(resp.kind_of?(String) ? resp : resp.body)['error']
  end

  def file_fixture(path)
    File.open(Rails.root.join('spec/fixtures', path))
  end

  def upload_fixture(path, mime)
    Rack::Test::UploadedFile.new(
      Rails.root.join('spec/fixtures', path),
      mime
    )
  end
end

Spork.each_run do
  # run stuff each time you run rspec
end