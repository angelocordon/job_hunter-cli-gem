
class JobHunter::CLI

  def start
    input =""
    search_input =""
    input.downcase!
    search_input.downcase!
    # welcome_prompt
    scraper = JobHunter::Scraper.new
    while input !="exit"
      puts "1. Name of job"
      input = gets.strip
      if input
          scraper.q = "q=" + input
      else
        nil
      end
      puts "2. Country"
      input = gets.strip
      if input
        scraper.co = "co=" + input
      else
        nil
      end
      puts "3. A postal code or a city"
      input = gets.strip
      if input
        scraper.l = "l=" + input
      else
        nil
      end
      puts "4. A number for distance from search location"
      input = gets.strip
      if input
        scraper.radius = "radius=" + input
      else
        nil
      end
      scraper.scrape_jobs
       jobs_array = scraper.scrape_jobs
       counter=0
       jobs_array.each do |a|
         puts "|" + "#{counter+=1}" +"|"
         a.each do |key,value|
           puts "#{key}: #{value}"
         end
         puts ""
       end

    end # end of while statement

  end

  def welcome_prompt
    puts "1. Name of job"
    puts "2. Country"
    puts "3. A postal code or a city"
    puts "4. A number for distance from search location"
  end

end
