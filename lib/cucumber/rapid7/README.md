# Cucumber::Rapid7
## Auxiliary
1. [`find_scenario_name(scenario_or_outline)`](auxiliary.rb#L8-L15)
1. [`find_file_colon_line(scenario_or_outline)`](auxiliary.rb#L17-L24)
1. [`example_row_from_scenario(scenario_or_outline)`](auxiliary.rb#L26-L39)
1. [`skip_tag_error(scenario_name, common_tags, !!example_row)`](auxiliary.rb#L41-L51)

## Formatter
For more details on the formatters in Cucumber::Rapid7 [see here](formatter/README.md).

1. [html_postponed.rb](formatter/html_postponed.rb)
1. [jira_metrics.rb](formatter/jira_metrics.rb)
1. [notification_center_formatter.rb](formatter/notification_center_formatter.rb)

## Hooks
For more details on the hooks in Cucumber::Rapid7 [see here](hooks/README.md).

1. [capybara.rb](hooks/capybara.rb)
  1. [capybara_register_drivers.rb](hooks/capybara_register_drivers.rb)
1. [postponed.rb](hooks/postponed.rb)
1. [ui.rb](hooks/ui.rb)
