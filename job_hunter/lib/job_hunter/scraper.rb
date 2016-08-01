require 'pry'
class JobHunter::Scraper
  #  attr_accessor

  def initialize()

  end

  def self.scrape_jobs(url)
    # parse XLM with Nokogiri
    # save information as an array of hashes with metaprogramming
    # take the string of HTML returned by open-uri's open method and convert it into a NodeSet (aka, a bunch of nested "nodes")
    doc = Nokogiri::XML(open(url))
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
