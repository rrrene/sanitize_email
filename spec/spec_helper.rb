require 'launchy'
require 'mail'
require 'rails'
require 'letter_opener'
require 'action_mailer'
require 'email_spec'

# For code coverage, must be required before all application / gem / library code.
require 'coveralls'
Coveralls.wear!

require 'sanitize_email'
require 'sanitize_email/rspec_matchers'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.include SanitizeEmail::RspecMatchers
end

