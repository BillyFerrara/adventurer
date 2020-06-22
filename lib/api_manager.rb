class Adventurer::APIManager

  BASE_URL = "https://www.dnd5eapi.co/api/"

  def self.get_races
    puts "MAKING A NETWORK REQUEST"

    url = BASE_URL + "races"
    res = HTTParty.get(url)
    racearr = res["results"]
    Adventurer::Character.mass_create_from_race_api(racearr)
  end


#alter the key :name to something else then initialize the new value = nil 
  def self.get_classes
    puts "MAKING ANOTHER REQUEST"

    url2 = BASE_URL + "classes"
    res2 = HTTParty.get(url2)
    classarr = res2["results"]
    Adventurer::Character.mass_create_from_class_api(classarr)
  end



end
