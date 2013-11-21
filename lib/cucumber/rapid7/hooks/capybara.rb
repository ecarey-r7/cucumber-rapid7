require 'capybara'

# Alias :selenium to :firefox
Capybara.register_driver :firefox do |app|
  Capybara.drivers[:selenium]
end

# If a scenario is tagged as @ui and more than one capybara driver this hook
# will pick it up and run it in each browser
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
