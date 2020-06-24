class Adventurer::CLI

  def start
    introduction
    get_races_data
    get_classes_data
    race_loop
    class_loop
  end

  def introduction
    puts "\nWelcome To The Fantasic World Of Dungeons & Dragons, Adventurer!\n"
    puts "------------------------------------------------------------------"
    sleep(3)
    puts "\n\n"
  end

  def get_races_data
    Adventurer::APIManager.get_races
  end

  def get_classes_data
    Adventurer::APIManager.get_classes
  end

  def race_loop
    loop do
      race_menu
      race_input = get_race_choice
      case race_input
      when "classes"
        break
      when "invalid"
        next
      # when "classes"
      #   class_loop
      #   class_input = get_class_choice
      else
        display_single_race(race_input)
      end
    end
  end

  def race_menu
    display_race
    #display_classes
    race_display_instructions
    #binding.pry
  end

  def class_loop
    loop do
      class_menu
      class_input = get_class_choice
      case class_input
      when "exit"
        break
      when "invalid"
        next
      else
        display_single_class(class_input)
      end
    end
  end

  def class_menu
    display_classes
    class_display_instructions
    #binding.pry
  end

  def get_race_choice
    race_input = gets.strip.downcase
    return race_input if race_input == "classes"
    if race_input.to_i.between?(1,9)
      return race_input.to_i - 1
    else
      puts "Enter the number of your desired race or 'exit' to exit"
      return "invalid"
      end
  end

  def display_race
    race = Adventurer::Character.all[0,9]
    race.each.with_index(1) do |rac, index|
      puts "#{index}. #{rac.name}"
      puts "------------"
    end
  end

  def display_single_race(i)
    race_obj = Adventurer::Character.all[i]
    Adventurer::APIManager.get_race_details(race_obj)
    puts "\n\n"
    puts race_obj.name.upcase
    puts race_obj.race_details
    puts "\nPress Enter to return to the previous screen"
    gets
  end

  def get_class_choice
    input = gets.strip.downcase
    return input if input == "exit"
    if input.to_i.between?(1,11)
      return input.to_i - 1
    else
      puts "Enter the number of your desired class or 'exit' to exit"
      return "invalid"
    end
  end

  def display_classes
    classes = Adventurer::Character.all[10,21]
    classes.each.with_index(1) do |clas, index|
      puts "#{index}. #{clas.name}"
      puts "-------"
    end
  end

  def display_single_class(i)
    class_obj = Adventurer::Character.all[i]
    Adventurer::APIManager.get_class_details(class_obj)
    puts "\n\n"
    puts class_obj.name.upcase
    puts class_obj.class_details
    puts "\nPress Enter to return to the previous screen"
    gets
  end

  def race_display_instructions
    puts <<-INST
    Please enter the race number you would like to learn more about
    --------------------------------------------------------------------
    To learn about classes enter "classes"
    INST
  end

  def class_display_instructions
    puts <<-INST
    Please enter the class number you would like to learn more about
    --------------------------------------------------------------------
    To exit enter 'exit'
    INST
  end

end
