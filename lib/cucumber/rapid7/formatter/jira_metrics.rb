require 'cucumber/formatter/pretty'
require 'cucumber/jira'

# This formatter is a WIP that will eventually gather information from JIRA
# based on JIRA themes and Gherkin tags and add the information into cucumber
# reports.
#
# @author Erran Carey <erran_carey@rapid7.com>
# @api private
class JiraMetrics < Cucumber::Formatter::Pretty
  def initialize(runtime, path_or_io, options)
    super

    jira_client = Cucumber::Jira::Soap.new(ENV['JIRA_ENDPOINT'])
    jira_client.login(ENV['JIRA_USER'], ENV['JIRA_PASSWORD'], true)
    @jira_issues = jira_client.search :project => ENV['JIRA_PROJECT_KEY'], :themes => ENV['JIRA_THEMES'].to_s.split(/,\s*/, '')
  end

  def before_feature(feature)
    super

    tags = feature.source_tags.map { |tag| tag.name.sub(/^@/, '') }
    jira_tags = tags.grep(/^COSMO-\d+/)

    issues = @jira_issues.find_all { |issue| jira_tags.include?(issue[:key]) }

    puts issues
  end
end
