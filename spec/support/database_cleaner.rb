# spec/support/database_cleaner.rb
RSpec.configure do |config|

  # Truncation all the tables before test suite start
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  # Use transaction strategy to clean database
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  # For testing JavaScript
  # use truncation strategy to clean the database
  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  # Start DatabaseCleaner before each test
  config.before(:each) do
    DatabaseCleaner.start
  end

  # Clean the Database after each test start
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
