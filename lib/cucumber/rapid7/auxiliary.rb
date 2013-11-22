require 'cucumber/ast/outline_table'
require 'cucumber/ast/scenario'
require 'cucumber/term/ansicolor'

module Cucumber
  module Rapid7
    module Auxiliary
      def find_scenario_name(scenario_or_outline)
        case scenario_or_outline
        when Cucumber::Ast::Scenario
          scenario_or_outline.name
        when Cucumber::Ast::OutlineTable::ExampleRow
          scenario_or_outline.scenario_outline.name
        end
      end

      def find_file_colon_line(scenario_or_outline)
        case scenario_or_outline
        when Cucumber::Ast::Scenario
          scenario_or_outline.file_colon_line
        when Cucumber::Ast::OutlineTable::ExampleRow
          scenario_or_outline.scenario_outline.file_colon_line
        end
      end

      def example_row_from_scenario(scenario)
        if scenario.is_a? Cucumber::Ast::OutlineTable::ExampleRow
            example_row = [
              scenario.name.split('|').map { |column| column.cyan }.join(' | '.reset),
              ' |'.reset
            ].flatten.join.sub('| ', '')
        end

        if example_row && ENV['CI']
          Cucumber::Term::ANSIColor.uncolored(example_row)
        elsif example_row
          example_row
        end
      end

      def skip_tag_error(scenario_name, common_tags, example_row = false)
        skip_error = [
          ' Skipping'.cyan,
          %("#{scenario_name}").bold.cyan,
          'due to having the following auto-skip tags:'.cyan,
          common_tags.to_s.bold.cyan
        ].join(' ')

        skip_error << ' |'.reset if example_row
        ENV['CI'] ? Cucumber::Term::ANSIColor.uncolored(skip_error) : skip_error
      end
    end
  end
end
