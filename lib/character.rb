class Adventurer::Character

  @@all = []

  def self.all
    @@all
  end

  def self.mass_create_from_race_api(racearr)
    racearr.each do |racehash|
      # binding.pry
       self.new(racehash["name"], racehash["url"])
    end
  end

  def self.mass_create_from_classes_api(classarr)
    classarr.each do |classhash|
      self.new(classhash["name"], classhash["url"])
    end
  end


   attr_accessor :name, :url, :age, :alignment, :size, :language

  def initialize(name=nil, url=nil)
    @name, @url = name, url
    save
  end

  def save
    @@all << self
  end

  def race_details
    <<-DESC
    Age: #{self.age}
    -----------------
    Alignment: #{self.alignment}
    -----------------
    Size: #{self.size}
    -----------------
    Language: #{self.language}
    DESC
  end

end
