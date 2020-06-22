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
    sleep(3)
    puts "\n\n\n"
  end

  def get_races_data
    Adventurer::APIManager.get_races
  end

  def get_classes_data
    Adventurer::APIManager.get_classes
  end

  def main_loop
    puts "in main loop"
    binding.pry
  end

end
