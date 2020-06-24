class Adventurer::APIManager

  BASE_URL = "https://www.dnd5eapi.co/api/"

  def self.get_races
    # puts "MAKING A NETWORK REQUEST"

    url = BASE_URL + "races"
    res = HTTParty.get(url)
    racearr = res["results"]
    #binding.pry
    Adventurer::Character.mass_create_from_race_api(racearr)
  end


  def self.get_race_details(race)
    # puts "\nLOADING...\n"


    url = "https://www.dnd5eapi.co#{race.url}"
    res = HTTParty.get(url)

    race.age = res["age"]
    race.alignment = res["alignment"]
    race.size = res["size_description"]
    race.language = res["language_desc"]
    #add race proficiencies

  end

  def self.get_classes
    # puts "MAKING ANOTHER REQUEST"

    url2 = BASE_URL + "classes"
    res2 = HTTParty.get(url2)
    classarr = res2["results"]
    Adventurer::Character.mass_create_from_classes_api(classarr)
  end

end
