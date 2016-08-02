require 'pry'
class JobHunter::Scraper
  #  attr_accessor

  def initialize()
    @@all =[]
  end

  def self.scrape_jobs(url)
    # parse XLM with Nokogiri
    # save information as an array of hashes with metaprogramming
    # take the string of HTML returned by open-uri's open method and convert it into a NodeSet (aka, a bunch of nested "nodes")
    doc = Nokogiri::XML(open(url))
    # job_name = doc.css("query").text
    job_name = doc.css("jobtitle").text
    job_company = doc.css("company").text
    job_location = doc.css("location").text
    country = doc.css("country").text
    job_url = doc.css("url").text
    job_description = doc.css("snippet").text
    job_date_posted = doc.css("date").text
    elapsed_duration_of_job_post = doc.css("formattedRelativeTime").text


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
    puts doc
  end

  def self.options(array_of_key_words)

  end

end # end of class
