ENV["PLAYLISTER_ENV"] = "test"

require_relative '../config/environment'
ActiveRecord::Migration.maintain_test_schema!  # 4.1 release  test database will get the correct schema every time your tests run, whether you run them from a Rake task or not.


RSpec.configure do |config|
  config.order = 'default'

  `rake db:migrate`

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
