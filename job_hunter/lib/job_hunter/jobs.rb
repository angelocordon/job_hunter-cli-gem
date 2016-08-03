class JobHunter::Jobs
  attr_accessor :name, :company, :city, :state, :country, :url, :description, :date_posted, :post_duration

  @@all = []

  # takes in an argument of a hash and sets that new student's attributes using the key/value pairs of that hash.
  def initialize(jobs_hash)
    jobs_hash.each do |title, string|
     self.send("#{title}=", string)
    end
    @@all << self
    # binding.pry
  end

  def self.create_from_collection(jobs_array)
    jobs_array.each do |jobs_hash|
      self.new(jobs_hash) # mass assignment It's taking a hash with key and value pairs as arguments
      # and setting them equal to the attributes that the class has
      # handing it off to initialize
      # binding.pry
    end
  end

  def self.all
    @@all
  end

  def print_jobs
    self.class.all.each do |attribute|
      puts attribute.name
      puts attribute.location
      puts attribute.description
      binding.pry
    end

  end
end
