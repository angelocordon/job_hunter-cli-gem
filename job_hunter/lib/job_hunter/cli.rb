# CLI controller
# Decoupling
#  - CLI creates the:
#     - Scraper object the Scraper object creates the
#      - Jobs object and the Jobs object prints out on the CLI
# each input should define a function
# should have diferent input
# so first input should save as query
# second input should save a location
# third as postal code
# fourth as radius
# should all save to the same instance of Scraper class inside of start or in different method

class JobHunter::CLI

  def start
    input =""
    search_input =""
    input.downcase!
    search_input.downcase!
    welcome_prompt
    scraper = JobHunter::Scraper.new
    while input !="exit"
      input = gets
      if input
          scraper.q = "q=" + input
      else
        nil
      end
      input = gets
      if input
        scraper.co = "co=" + input
      else
        nil
      end
      input = gets
      if input
        scraper.l = "l=" + input
      else
        nil
      end
      input = gets
      if input
        scraper.radius = "radius=" + input
      else
        nil
      end
      scraper.scrape_jobs
        jobs_array = scraper.scrape_jobs
        jobs_hash = JobHunter::Jobs.create_from_collection(jobs_array)
        job_hunter = JobHunter::Jobs.new(jobs_hash)
        job_hunter.print_jobs
        # binding.pry
    end # end of while statement

  end
  #
  # def welcome_prompt
  #   puts "Welcome to Job_Hunter The One stop shop for finding the exact job fit!"
  #   puts "To customize your job search enter any or all of the options below."
  #   # puts "Type numbers 1 to 4 to start. Then enter any of the corresponding key letters / words. "
  #   puts ""
  #
  def welcome_prompt
    puts "1. Name of job"
    puts "2. Country"
    puts "3. A postal code or a city"
    puts "4. A number for distance from search location"
  end


  # def show_jobs

  # end

  # def print_job_details
  #
  # end

end
