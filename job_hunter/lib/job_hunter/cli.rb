# CLI controller
# Decoupling
#  - CLI communicates with:
#     - Scraper
#     - Jobs

class JobHunter::CLI

  def welcome_prompt
    puts "Welcome to Job_Hunter The One stop shop for finding the exact job fit!"
    puts "To customize your job search enter any or all of the options below."
    puts "Type any of the key letters / words from 1 to 9 to start."
    puts ""

    puts "1. q - Name of job."
    puts "2. co - Location based on Country."
    puts "3. l - A postal code or a city."
    puts "4. radius - A number for distance from search location."
  end
#
#
# # psuedocode
   JobHunter::Scraper.new(url)
#   if type q then save input as "q"
    if input = "q"
      search_input.gets
#   if type co then save input as string "co"
#   if type l then save input as string "l"
#   if type radius then save input as string "radius"
#   this information gets stored in an instance of the Scraper class as the attributes.
#   Each of the 4 atributes gets passed in as an argument in the scraper url
#   Then returns the output in the form of an instance of the jobs object below
#
#
#
#   def start
#     input = nil
#      while input != "exit"
#        if
#        elsif condition
#        elsif condition
#        elsif condition
#        elsif condition
#        elsif condition
#        elsif condition
#        else
#        end
#    end

end
