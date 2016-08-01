require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative "job_hunter/scraper"
require_relative "job_hunter/version"
require_relative "job_hunter/cli"
require_relative "job_hunter/jobs"

#this sets up the JobHunter Module as having access to all the JobHunter::*FILES*
module JobHunter
end
