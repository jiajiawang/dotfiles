# .pryrc

if Rails.env.test?
  include FactoryBot::Syntax::Methods
end

def clean_db
  return unless Rails.env.test?

  DatabaseCleaner.clean_with :truncation
end
