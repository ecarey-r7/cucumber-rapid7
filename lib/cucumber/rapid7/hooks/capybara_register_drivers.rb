require 'capybara'

# Alias :selenium to :firefox
Capybara.register_driver :firefox do |app|
  Capybara.drivers[:selenium]
end

# Takes each value in a comma separated list and registers it as a
# Capybara driver
ENV['CAPYBARA_DRIVERS'].split(',').map(&:to_sym).each do |driver|
  case driver
  when :poltergeist
    require 'capybara/poltergeist'

    file_name = ENV['PHANTOMJS_LOG_FILE'] || 'phantomjs.log'
    Capybara.register_driver :poltergeist do |app|
      options = {
        # By default Javascript errors will be reraised in Ruby
        # :js_errors => false,
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
