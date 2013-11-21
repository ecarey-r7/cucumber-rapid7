require 'cucumber/rapid7/auxiliary'

# OPTIMIZE: Include helper methods on a global scope, so that they can be used in around hooks
include Cucumber::Rapid7::Auxiliary

Around do |scenario, block|
  scenario_name = find_scenario_name(scenario)
  source_tags = scenario.source_tag_names
  common_tags = source_tags & ENV['CUCUMBER_SKIP_TAGS'].to_s.split(/,/)
  example_row = scenario.is_a?(Cucumber::Ast::OutlineTable::ExampleRow)

  if common_tags.any? && scenario_name.eql?(@last_scenario_name)
    # TODO: Would this always an example row? If not should scenario names be unique?
    if example_row
      $stdout.print example_row_from_scenario(scenario)
    end
  elsif common_tags.any?
    file_name = ENV['CUCUMBER_RERUN_FILE'] || 'rerun.txt'

    File.open(file_name, 'w+') do |rerun_file|
      rerun_file << " #{find_file_colon_line(scenario)}"
    end

    $stdout.puts skip_tag_error(scenario_name, common_tags, example_row)

    if example_row
      # "\s"*6 => six space chars
      $stdout.print "\s"*6, '|', example_row_from_scenario(scenario)
    end
  else
    block.call
  end

  @last_scenario_name = scenario_name
end
