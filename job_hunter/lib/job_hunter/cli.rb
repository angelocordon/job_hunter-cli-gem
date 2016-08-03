# CLI controller
# Decoupling
#  - CLI creates the:
#     - Scraper object the Scraper object creates the
#      - Jobs object and the Jobs object prints out on the CLI

class JobHunter::CLI

  def start
    input =""
    search_input =""
    input.downcase!
    search_input.downcase!
    welcome_prompt
    while input !="exit"
      # def create_jobs_array
      input = gets
      scraper = JobHunter::Scraper.new
      # if input == "q" || input == "co" || input == "l" || input == "radius"
      #   search_input = gets.gsub(/\s+/, "")
      # end
      if input == 1
        search_input = gets
        if search_input
          scraper.q = "q=" + search_input
        else
          scraper.q =""
        end

      elsif input == 2
        search_input = gets
        if search_input
          scraper.co = "co=" + search_input
        else
          scraper.q =""
        end

      elsif input == "3"
        search_input = gets
        if search_input
          scraper.l = "l=" + search_input
        else
          scraper.l =""
        end

      elsif input == "4"
          search_input = gets
        if search_input
              scraper.radius = "radius=" + search_input
        else
          scraper.radius =""
        end
      end

      if input != 1 || 2 || 3 || 4
        puts "Oops! Looks like you entered the wrong key word. Try again!"
      end
        scraper.scrape_jobs
        show_jobs
    end
  end

  def welcome_prompt
    puts "Welcome to Job_Hunter The One stop shop for finding the exact job fit!"
    puts "To customize your job search enter any or all of the options below."
    puts "Type numbers 1 to 4 to start. Then enter any of the corresponding key letters / words. "
    puts ""

    puts "1. q - Name of job."
    puts "2. co - Location based on Country."
    puts "3. l - A postal code or a city."
    puts "4. radius - A number for distance from search location."
  end


  def show_jobs
    # jobs_array = JobHunter::Scraper.new.scrape_jobs
    # jobs_hash = JobHunter::Jobs.create_from_collection(jobs_array)
    # job_hunter = JobHunter::Jobs.new(jobs_hash)
    JobHunter::Jobs.print_jobs
  end

  # def print_job_details
  #
  # end

end
