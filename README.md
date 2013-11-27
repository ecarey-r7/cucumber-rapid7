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
require 'cucumber/rapid7/auxiliary'

# Include Auxiliary in a given scope (or globally)
include Auxiliary

Around do |scenario, block|
  scenario_name = find_scenario_name(scenario)
  file_colon_line = find_file_colon_line(scenario)
  example_row = example_row_from_scenario(scenario)
  skipping_message = skip_tag_error(scenario_name, common_tags, !!example_row)
  # ... Handle auto-skip logic here
  
  # Run the test otherwise
  block.call
end
```

### Hooks
#### Capybara
##### Register drivers
```ruby
# lib/cucumber/rapid7/hooks/capybara.rb

# Alias :selenium to :firefox
Capybara.register_driver :firefox do |app|
  Capybara.drivers[:selenium]
end

# lib/cucumber/rapid7/hooks/capybara.rb

ENV['CAPYBARA_DRIVERS'].split(',').map(&:to_sym).each do |driver|
  case driver
  when :poltergeist
    require 'capybara/poltergeist'

    file_name = ENV['PHANTOMJS_LOG_FILE'] || 'phantomjs.log'
    Capybara.register_driver :poltergeist do |app|
      options = {
        :phantomjs_options => %w[--ignore-ssl-errors=yes],
        :phantomjs_logger  => File.open(file_name, 'a+')
      }
      Capybara::Poltergeist::Driver.new(app, options)
    end
  else
    Capybara.register_driver driver do |app|
      Capybara::Selenium::Driver.new(app, :browser => driver)
    end
  end
end
```

##### Rerun scenarios for multiple browsers
```ruby
# lib/cucumber/rapid7/hooks/capybara.rb

# Given a scenario is tagged with @ui then run the test for every browser that scenario is tagged with
Around '@ui' do |scenario, block|
  tags = scenario.source_tag_names.map do |tag|
    tag.sub(/^@/, '').to_sym
  end

  common_drivers = tags & Capybara.drivers.keys

  if common_drivers.count <= 1
    Capybara.current_driver = common_drivers.first unless common_drivers.empty?
    block.call
  else
    common_drivers.each do |driver|
      Capybara.using_driver(driver, &block)
    end
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
