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
      input = get_race_choice
      case input
      when "exit"
        break
      when "invalid"
        next
      else
        puts input
        #display_single_race(input)
      end
    puts "in main loop"
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
      return input.to_i
    else
      puts "Enter the number of your desired race or 'exit' to exit "
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

  # def display_classes
  #   classes = Adventurer::Character.all
  #   classes.each.with_index(1) do |clas, index|
  #     puts "#{index}. #{clas.name}"
  #   end
  # end

  def display_instructions
    puts <<-INST
    Please enter the number of your character's desired race
    INST
  end

end
