class JobHunter::Scraper
  attr_accessor :url, :q, :co, :l, :radius

  # def initialize(query='', country ='', location ='', radius ='')
  #   @q = query
  #   @co = country
  #   @l = location
  #   @radius = radius
  # end

  def scrape_jobs
    url = "http://api.indeed.com/ads/apisearch?publisher=3881286689960538&#{q}&#{l}&sort=&#{radius}&st=&jt=&start=&limit=&fromage=&filter=&latlong=1&#{co}&chnl=&userip=1.2.3.4&useragent=Mozilla/%2F4.0%28Firefox%29&v=2"
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
    jobs_array
  end

  # def self.options(array_of_key_words)
  #
  # end

end # end of class
