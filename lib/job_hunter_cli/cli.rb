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
    user_input
  end

  def user_input
    input =nil
    if input != "exit"
      scraper = JobHunterCli::Scraper.new # instantiate the scraper class and save it in a local variable

      puts "1. Enter the max number of the search results you want return. Defaults to 10 if not specified"
      input = gets.strip
      scraper.limit = "limit=" + input

      puts "2. Enter any query or name of job role"
      input = gets.strip
      scraper.q = "q=" + input

      puts "3. Enter initals or name of country. Defaults to US if not specified"
      input = gets.strip
      scraper.co = "co=" + input

      puts "4. Enter a postal code or a city"
      input = gets.strip
      scraper.l = "l=" + input

      puts "5. Enter a number for distance from search location. Defaults to 25 if not specified"
      input = gets.strip
      scraper.radius = "radius=" + input

      scraper.scrape_jobs  # start scrape
      print_jobs
    end
    prompt_after_search
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
      self.user_input
    end
  end

end # end of class
