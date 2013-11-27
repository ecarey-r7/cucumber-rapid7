# Cucumber::Rapid7

Cucumber hooks, formatters, and more used at Rapid7 by the ControlsInsight team.

## Installation

Add this line to your application's Gemfile:

    gem 'cucumber-rapid7'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cucumber-rapid7

## Usage
### Auxiliary
```ruby
# features/support/hook.rb
require 'cucumber/rapid7/auxiliary'

# Include Auxiliary in a given scope (or globally)
include Auxiliary

Around do |scenario, block|
  scenario_name = find_scenario_name(scenario)
  file_colon_line = find_file_colon_line(scenario)
  example_row = example_row_from_scenario(scenario)
  skipping_message = skip_tag_error(scenario_name, common_tags, !!example_row)
  # ... Handle skip logic here
  
  # Run the test otherwise
  block.call
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
