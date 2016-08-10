class JobHunterCli::Scraper
  # save instace variables to assign in teh CLI class when creating a new Scraper instance
  attr_accessor :q, :co, :l, :radius, :uri, :limit

  def scrape_jobs
    # indeed.com api uses XML. To parse in XLM use Nokogiri
    uri = "http://api.indeed.com/ads/apisearch?publisher=3881286689960538&#{@q}&#{@l}&sort=date&#{@radius}&st=&jt=&start=&#{@limit}&fromage=&filter=&latlong=1&#{@co}&chnl=&userip=1.2.3.4&useragent=Mozilla/%2F4.0%28Firefox%29&v=2"

    doc = Nokogiri::XML(open(uri))
    doc.css("result").each do |job_result|
      JobHunterCli::Job.new({
        job_role: job_result.css("jobtitle").text,
        company: job_result.css("company").text,
        city: job_result.css("city").text,
        state: job_result.css("state").text,
        country: job_result.css("country").text,
        url: job_result.css("url").text,
        description: job_result.css("snippet").text,
        date_posted: job_result.css("date").text,
        post_duration: job_result.css("formattedRelativeTime").text
      })
    end # end of each statemen
  end

end
