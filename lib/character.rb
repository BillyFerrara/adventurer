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

  def self.mass_create_from_classes_api(classarr)
    classarr.each do |classhash|
      #changed (classhash["name"], classhash["url"])
      self.new(classhash["classes"], classhash["url"])
    end
  end

  #both class and race objects end up in @@all ... idk if this is a problem yet

  attr_accessor :name, :url

  def initialize(name=nil, classes= nil, url=nil)
    @name, @classes, @url = name, classes, url
    save
  end

  def save
    @@all << self
  end



end
