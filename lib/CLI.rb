class Adventurer::CLI

  def start
    introduction
    get_races_data
    get_classes_data
    main_loop
  end

  def introduction
    puts "\n\n\n"
    puts "Welcome Adventurer!"
    sleep(2)
    puts "\n\n\n"
  end

  def get_races_data
    Adventurer::APIManager.get_races
  end

  def get_classes_data
    Adventurer::APIManager.get_classes
  end

  def main_loop
    loop do
      menu
    end
    puts "in main loop"

  end

  def menu
    display_race
    #display_class
    # display_instructions
    binding.pry
  end

  def display_race
    race = Adventurer::Character.all
    race.each do |race|
      puts race.name
    end
  end
end
