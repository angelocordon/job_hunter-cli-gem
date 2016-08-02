require 'open-uri'
require 'nokogiri' # I added this
require 'pry'
class JobHunter::Scraper


  def self.scrape_jobs(url)
    # save information as an array of hashes with metaprogramming
    # take the string of HTML returned by open-uri's open method and convert it into a NodeSet (aka, a bunch of nested "nodes")
    jobs_array = []
    jobs_hash = {}
    doc = Nokogiri::XML(open(url))
    # job_name = doc.css("query").text
    doc.css("result").each do |job_result|
      jobs_hash = {name: result.css("jobtitle").text,
          company: job_result.css("company").text,
          location: job_result.css("location").text,
          country: job_result.css("country").text,
          url: job_result.css("url").text,
          description: job_result.css("snippet").text,
          date_posted: job_result.css("date").text,
          post_duration: job_result.css("formattedRelativeTime").text}
      jobs_array << jobs_hash
    end
    puts jobs_array
    binding.pry
    # jobs_list=[]
    # jobs_hash={}
    # index = doc.css(".roster-cards-container").each do |student|
    #   student.css(".student-card a").each do |student_detail|
    #      hash={name: student_detail.css("h4.student-name").text,
    #            location: student_detail.css("p.student-location").text,
    #            profile_url: "./fixtures/student-site/#{student_detail['href']}"}
    #           # binding.pry
        #  jobs_list << jobs_hash
    #   end
    # end
    # jobs_list
    # binding.pry
  end

  def self.options(array_of_key_words)

  end

end # end of class
