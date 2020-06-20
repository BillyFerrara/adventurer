class Adventurer::Character

  @@all = []

  def self.all
    @@all
  end

  def self.mass_create_from_race_api(racearr)
    racearr.each do |racehash|
      self.new(racehash["name"], racehash["url"])
    end
  end

  def self.mass_create_from_class_api(classarr)
    classarr.each do |classhash|
      self.new(classhash["name"], classhash["url"])
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
