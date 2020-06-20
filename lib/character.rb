class Adventurer::Character

  @@all = []

  def self.all
    @@all
  end

  def self.mass_create_from_api(racearr)
    racearr.each do |racehash|
      self.new(racehash["name"], racehash["url"])
      
    end
  end

  attr_accessor :name, :url

  def initialize(name, url)
    @name, @url = name, url
    save
  end

  def save
    @@all << self
  end



end
