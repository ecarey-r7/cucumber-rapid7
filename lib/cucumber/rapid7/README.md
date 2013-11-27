# Cucumber::Rapid7
## Auxiliary
1. `find_scenario_name(scenario_or_outline)`
1. `find_file_colon_line(scenario_or_outline)`
1. `example_row_from_scenario(scenario_or_outline)`
1. `skip_tag_error(scenario_name, common_tags, !!example_row)`

## Formatter
For more details on the formatters in Cucumber::Rapid7 [see here](formatter/README.md).

1. [html_postponed.rb](https://github.com/ecarey-r7/cucumber-rapid7/blob/master/lib/cucumber/rapid7/formatter/html_postponed.rb)
1. [jira_metrics.rb](https://github.com/ecarey-r7/cucumber-rapid7/blob/master/lib/cucumber/rapid7/formatter/jira_metrics.rb)
1. [notification_center_formatter.rb](https://github.com/ecarey-r7/cucumber-rapid7/blob/master/lib/cucumber/rapid7/formatter/notification_center_formatter.rb)

## Hooks
For more details on the hooks in Cucumber::Rapid7 [see here](hooks/README.md).

1. [capybara.rb](https://github.com/ecarey-r7/cucumber-rapid7/blob/master/lib/cucumber/rapid7/hooks/capybara.rb)
  1. [capybara_register_drivers.rb](https://github.com/ecarey-r7/cucumber-rapid7/blob/master/lib/cucumber/rapid7/hooks/capybara_register_drivers.rb)
1. [postponed.rb](https://github.com/ecarey-r7/cucumber-rapid7/blob/master/lib/cucumber/rapid7/hooks/postponed.rb)
1. [ui.rb](https://github.com/ecarey-r7/cucumber-rapid7/blob/master/lib/cucumber/rapid7/hooks/ui.rb)
