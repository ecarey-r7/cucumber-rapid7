After '@ui', '@wip' do |scenario|
  require 'cucumber/rapid7/auxiliary'
  include Cucumber::Rapid7::Auxiliary

  scenario_name = find_scenario_name(scenario)

  unless ENV['CI']
    $stdout.puts "\a\nPaused on '#{scenario_name}'. Press enter/return to continue to the next test."
    $stdin.gets
  end
end
