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
    url = "https://www.dnd5eapi.co#{race.url}"
    res = HTTParty.get(url)

    race.age = res["age"]
    race.alignment = res["alignment"]
    race.size = res["size_description"]
    race.language = res["language_desc"]
    #add race proficiencies
  end

  def self.get_classes
    url2 = BASE_URL + "classes"
    res2 = HTTParty.get(url2)
    classarr = res2["results"]
    Adventurer::Character.mass_create_from_classes_api(classarr)
  end

  def self.get_class_details(clas)
    url = "https://www.dnd5eapi.co#{clas.url}"
    res = HTTParty.get(url)

    url2 = "https://www.dnd5eapi.co#{clas.url}/starting-equipment/"
    res2 = HTTParty.get(url2)

    clas.proficiency = res["proficiencies"].map {|hash| hash["name"]}
    clas.hit_die = res["hit_die"]
    clas.equipment = res2["starting_equipment"].map {|hash| hash["item"]["name"]}
    # clas.cantrip = res["info"].map {|hash| hash["desc"]}
  end

end
