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
    # welcome_prompt
    puts "1. Name of job."
    while input !="exit"
  #     # def create_jobs_array
      input = gets
      scraper = JobHunter::Scraper.new
  #   #   # if input == "q" || input == "co" || input == "l" || input == "radius"
  #   #   #   search_input = gets.gsub(/\s+/, "")
  #   #   # end
      if input
        # search_input = gets
        # if search_input
          scraper.q = "q=" + input
        # else
        #   scraper.q =""
        # end
        jobs_array = scraper.scrape_jobs
        jobs_hash = JobHunter::Jobs.create_from_collection(jobs_array)
        # binding.pry
        job_hunter = JobHunter::Jobs.new(jobs_hash)
        job_hunter.print_jobs
      end
    end
  #     # show_jobs
  #   #
  #   #   elsif input == 2
  #   #     search_input = gets
  #   #     if search_input
  #   #       scraper.co = "co=" + search_input
  #   #     else
  #   #       scraper.q =""
  #   #     end
  #   #
  #   #   elsif input == 3
  #   #     search_input = gets
  #   #     if search_input
  #   #       scraper.l = "l=" + search_input
  #   #     else
  #   #       scraper.l =""
  #   #     end
  #   #
  #   #   elsif input == 4
  #   #       search_input = gets
  #   #     if search_input
  #   #           scraper.radius = "radius=" + search_input
  #   #     else
  #   #       scraper.radius =""
  #   #     end
  #   #
  #   #   else
  #   #     puts "Oops! Looks like you entered the wrong key word. Try again!"
  #   #   end
  #   #     scraper.scrape_jobs
  #   #     show_jobs
  #   # end
  #   # binding.pry
  #   end
  end
  #
  # def welcome_prompt
  #   puts "Welcome to Job_Hunter The One stop shop for finding the exact job fit!"
  #   puts "To customize your job search enter any or all of the options below."
  #   # puts "Type numbers 1 to 4 to start. Then enter any of the corresponding key letters / words. "
  #   puts ""
  #
  # def welcome_prompt
  #   puts "1. Name of job."
  #   puts "2. co - Location based on Country."
  #   puts "3. l - A postal code or a city."
  #   puts "4. radius - A number for distance from search location."
  # end


  # def show_jobs

  # end

  # def print_job_details
  #
  # end

end
