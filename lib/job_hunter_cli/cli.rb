# Controller
# For review
class JobHunterCli::CLI

  def start
    puts ""
    puts "  ---------------------------------- | WELCOME TO JOB HUNTER |-------------------------------- "
    puts "            Job Hunter shows you only the most recent jobs posted on Indeed.com                "
    puts "  -------------------------------------------------------------------------------------------- "
    puts ""
    puts "        Note: If you press enter without input then search will return its default values       "
    puts "                          Press exit anytime to exit search and start over                    "
    puts ""
    define_scraper
  end

  def define_scraper
      scraper = JobHunterCli::Scraper.new # instantiate the scraper class and save it in a local variable

      puts "1. Enter the max number of the search results you want return. Defaults to 10 if not specified"
      scraper.limit = scraper_queries("limit")
      puts "2. Enter any query or name of job role"
      scraper.q = scraper_queries("q")
      puts "3. Enter initals or name of country. Defaults to US if not specified"
      scraper.co = scraper_queries("co")
      puts "4. Enter a postal code or a city"
      scraper.l = scraper_queries("l")
      puts "5. Enter a number for distance from search location. Defaults to 25 if not specified"
      scraper.radius = scraper_queries("radius")
      scraper.scrape_jobs  # start scrape
      print_jobs
      prompt_after_search
  end

  def scraper_queries(query_type)
    input = gets.strip
    "#{query_type}=#{input}"
  end

  def print_jobs
    counter = 0 # apply numbering to results
    JobHunterCli::Job.all.each do |job_details|
      puts ""
      puts "#{counter+=1}. " + job_details.job_role
      puts "    • " + job_details.company
      puts "    • " + job_details.city + ", " + job_details.state + " - " +job_details.country
      puts "    • " + job_details.date_posted
      puts "    • " + job_details.post_duration
      puts "    • " + job_details.description
      puts "    • " + job_details.url
    end # end of second each enumerable
  end # end of print_jobs method

  def prompt_after_search
    puts ""
    puts "--------------------| Search Completed |----------------------"
    puts "    Type 'start' to start over or 'exit' to exit search    "
    input = gets.strip
    if input == "exit"
      puts "Search Ended...."
    elsif input == "start"
      puts "Enter New Search"
      self.define_scraper
    end
  end

end # end of class
