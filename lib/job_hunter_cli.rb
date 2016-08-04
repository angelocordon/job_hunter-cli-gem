require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative "job_hunter_cli/version"
require_relative "job_hunter_cli/scraper"
require_relative "job_hunter_cli/cli"
require_relative "job_hunter_cli/jobs"

#this sets up the JobHunter Module as having access to all the JobHunter::*FILES*
module JobHunterCli
end
