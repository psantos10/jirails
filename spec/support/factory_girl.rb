# spec/support/factory_girl.rb
RSpec.configure do |config|
  # with this, factory_girl methods does not need FactoryGirl. prefix
  config.include FactoryGirl::Syntax::Methods

  # This will ensure that all factories are valid
  # Since it will end up persisting some records to the Database
  # we need DatabaseCleaner to restore the state of the database after we've
  # linted our factories
  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
