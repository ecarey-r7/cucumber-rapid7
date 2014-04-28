# FIXME
module ShittyHack
  require 'cucumber/rapid7/auxiliary'
  extend Cucumber::Rapid7::Auxiliary
end

After '@ui', '@wip' do |scenario|
  scenario_name = ShittyHack.find_scenario_name(scenario)

  unless ENV['CI']
    $stdout.puts "\a\nPaused on '#{scenario_name}'. Press enter/return to continue to the next test."
    $stdin.gets
  end
end
