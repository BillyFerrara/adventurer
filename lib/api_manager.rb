class Adventurer::APIManager

  BASE_URL = "https://www.dnd5eapi.co/api/"

  def self.get_races
    puts "MAKING A NETWORK REQUEST"

    url = BASE_URL + "races"
    res = HTTParty.get(url)
    racearr = res["results"]
    Adventurer::Character.mass_create_from_api(racearr) 
  end



end
