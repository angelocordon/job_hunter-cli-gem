# Controller

class JobHunterCli::CLI

  def start
    input =""
    input.downcase!
    invalid = "invalid"
    puts ""
    puts "  ---------------------------------- | WELCOME TO JOB HUNTER |------------------------------------ "
    puts "         If you press enter without input then search will return its default values             "
    puts "           Job Hunter shows you only the most recent jobs posted on Indeed.com                   "
    puts ""
    scraper = JobHunterCli::Scraper.new

    until input =="exit"
      # check for input not equal to exit to prevent the cli from not exiting when type exit after prompt
      if input !="exit"
      puts "1. Enter the max number of the search results you want return. Defaults to 10 if not specified"
        input = gets.strip
        scraper.limit = "limit=" + input
      end

      if input!="exit"
      puts "2. Enter any query or name of job role"
      input = gets.strip
          scraper.q = "q=" + input
      end

      if input!="exit"
      puts "3. Enter initals or name of country. Defaults to US if not specified"
      input = gets.strip
        scraper.co = "co=" + input
      end

      if input!="exit"
      puts "4. Enter a postal code or a city"
        input = gets.strip
        scraper.l = "l=" + input
      end

      if input!="exit"
      puts "5. Enter a number for distance from search location. Defaults to 25 if not specified"
        input = gets.strip
        scraper.radius = "radius=" + input
      end

      if input != "exit"
        scraper.scrape_jobs  # start scrape
        jobs_array = scraper.scrape_jobs  # return the array of hash objects from scrape
        counter=0 # apply numbering to results
        jobs_array.each do |a|
          puts "|" + "#{counter+=1}" +"|"
          a.each do |key,value|
            puts "#{key.capitalize}: #{value}"
          end # end of second each enumerable
          puts ""
        end # end of first each enumerable
      else
        puts "Search Ended"
      end # end of last if statement on line 47
    end  # end of until statement

  end # end of start method

end
