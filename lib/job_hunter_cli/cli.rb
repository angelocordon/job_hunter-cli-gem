# Controller

class JobHunterCli::CLI

  def start
    input =""
    input.downcase!
    invalid = "invalid"
    puts ""
    puts " --------------  Welcome to Job Hunter  --------------- "
    puts "| If you do not type any input then search will default |"
    puts ""
    scraper = JobHunterCli::Scraper.new

    until input =="exit"

      # check for input not equal to exit to prevent the cli from not exiting when type exit after prompt
      puts "1. Enter the max number of the search results you want return"
      if input && input!="exit"
        input = gets.strip
        scraper.limit = "limit=" + input
      end

      puts "2. Enter any query or name of job role"
      if input && input!="exit"
      input = gets.strip
          scraper.q = "q=" + input
      end

      puts "3. Enter initals or name of country"
      if input && input!="exit"
      input = gets.strip
        scraper.co = "co=" + input
      end

      puts "4. Enter a postal code or a city"
      if input && input!="exit"
        input = gets.strip
        scraper.l = "l=" + input
      end

      puts "5. Enter a number for distance from search location"
      if input && input!="exit"
        input = gets.strip
        scraper.radius = "radius=" + input
      end

      if input !="exit"
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
        puts "Exit"
      end # end of if statement
    end  # end of until statement

  end # end of start method

end
