class JobHunter::Scraper
  attr_accessor :query, :country, :location, :radius, :url

  def initialize(url)
    @path = path
    @query = query
    @country = country
    @radius = radius
  end

  def self.scrape_jobs(url)
    # save information as an array of hashes with metaprogramming
    # take the string of HTML returned by open-uri's open method and convert it into a NodeSet (aka, a bunch of nested "nodes")
    jobs_array = []
    jobs_hash = {}
    doc = Nokogiri::XML(open(url))
    # job_name = doc.css("query").text
    doc.css("result").each do |job_result|
      jobs_hash = {name: job_result.css("jobtitle").text,
          company: job_result.css("company").text,
          location: job_result.css("city").text + "," + job_result.css("state").text,
          country: job_result.css("country").text,
          url: job_result.css("url").text,
          description: job_result.css("snippet").text,
          date_posted: job_result.css("date").text,
          post_duration: job_result.css("formattedRelativeTime").text}
      jobs_array << jobs_hash
    end
    puts jobs_array
    binding.pry
  end

  def self.options(array_of_key_words)

  end

end # end of class
