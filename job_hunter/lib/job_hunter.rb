require 'open-uri'
require 'nokogiri'
require 'pry'

require "../lib/job_hunter/scraper"
require "../lib/job_hunter/version"
require "../lib/job_hunter/jobs"
require "../lib/job_hunter/cli"

#this sets up the JobHunter Module as having access to all the JobHunter::*FILES*
module JobHunter
end
