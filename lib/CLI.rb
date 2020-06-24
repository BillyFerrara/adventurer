class Adventurer::CLI

  def start
    introduction
    get_races_data
    get_classes_data
    main_loop
  end

  def introduction
    puts "\nWelcome Adventurer!\n"
    puts "---------------------"
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
      input = get_race_choice
      case input
      when "exit"
        break
      when "invalid"
        next
      else
        display_single_race(input)
      end
    end
  end

  def menu
    display_race
    #display_classes
    display_instructions
    #binding.pry
  end

  def get_race_choice
    input = gets.strip.downcase
    return input if input == "exit"
    if input.to_i.between?(1,9)
      return input.to_i - 1
    else
      puts "Enter the number of your desired race or 'exit' to exit"
      return "invalid"
    end
  end

  def display_race
    race = Adventurer::Character.all[0,9]
    race.each.with_index(1) do |rac, index|
      puts "#{index}. #{rac.name}"
      puts "-------"
    end
  end

  def display_single_race(i)
    race_obj = Adventurer::Character.all[i]
    Adventurer::APIManager.get_race_details(race_obj)
    puts race_obj.race_details
    puts "\nEnter any key to continue"
    gets
  end

  # display_classes works!
  # def display_classes
  #   classes = Adventurer::Character.all[10,21]
  #   classes.each.with_index(1) do |clas, index|
  #     puts "#{index}. #{clas.name}"
  #     puts "-------"
  #   end
  # end

  def display_instructions
    puts <<-INST
    Please enter the number of your character's desired race or 'exit' to quit.
    INST
  end

end
