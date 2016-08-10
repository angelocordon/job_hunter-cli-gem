class JobHunterCli::Job
  attr_accessor :job_role, :company, :city, :state, :country, :url, :description, :date_posted, :post_duration
  @@jobs = []

  def initialize(params = {}) # default argument, when instantiated the
    @job_role = params[:job_role]
    @company = params[:company]
    @city = params[:city]
    @state = params[:state]
    @country = params[:country]
    @url = params[:url]
    @description = params[:description]
    @date_posted = params[:date_posted]
    @post_duration = params[:post_duration]
    @@jobs << self
  end

  def self.all
    @@jobs
  end

end
