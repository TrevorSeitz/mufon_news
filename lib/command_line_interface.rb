class CommandLineInterface
  BASE_PATH = "http://www.mufon.com/"

  def initialize
    menu
  end

  def wrap(s, width=125)
	  s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1\n")
	end

  def menu
    user_input = ""
    error = ""
      # Main CLI Menu 
    while user_input != "exit"
      puts `clear`
      puts "Welcome to the MUFON News Scraper!"
      puts "What would you like to do?"
      puts "1. UFO news"
      puts "2. MUFON news"
      puts "3. List of the latest UFO Reports"
      puts ""
      puts "type 'exit' to exit"
      puts ""
      puts error #only used if invalid input entered

      user_input = gets.chomp.downcase

      case user_input
        when "1"
          Article.reset
          Scraper.new(BASE_PATH + "ufo-news")
          puts `clear` # clears the terminal before displaying story menu
          puts "Welcome to MUFON's UFO news"
          display_story_list # UFO news and MUFON news display in the same format
        when "2"
          Article.reset
          Scraper.new(BASE_PATH + "mufon-news")
          puts `clear`# clears the terminal before displaying story menu
          puts "Welcome to MUFON news"
          display_story_list # UFO news and MUFON news display in the same format
        when "3"
          Sighting.reset
          Scraper.new("https://mufoncms.com/last_20_report.html")
          puts `clear` # clears the terminal before displaying report
          puts "Welcome to the MUFON Case Management System - MOST RECENT SIGHTING REPORTS"
          display_sightings
        else 
          error = "\nI'm sorry, that option is not available. \nPlease choose an availble option from the list"
      end
    end
    puts `clear` # clears the terminal before quiting
    abort
  end

    # the Menu for both UFO news & MUFON news
    # offers the option to return to the main menu or to quit
  def display_story_list
    user_input = ""

    while user_input != "exit"
      error = ""
     
      puts ""
      Article.all.each_with_index do |article, index|
          puts "#{index + 1}. #{article.article_title}  -  #{article.article_date}"
      end
      puts ""
      puts "Please choose a story"
      puts ""
      puts "Type exit to return to the main menu"
      puts "or 'quit' to quit"
      puts ""
      puts error
      user_input = gets.chomp.downcase
      if user_input == "exit"
        puts `clear` # clears the terminal before displaying the main menu
        menu
      elsif user_input == "quit"
        puts `clear` # clears the terminal before quiting
        abort
      end
      display_story(user_input.to_i - 1)
    end
  end

    # The display method for both UFO news stories and MUFON news stories 
    # offers the option to return to the main menu or to quit
  def display_story(index)
    user_input = ""
    while user_input != "exit"
      puts `clear`  # clears the terminal before displaying the story
      puts "#{Article.all[index].article_title}  -  #{Article.all[index].article_date}"
      puts ""
      puts wrap(Article.all[index].article_text.gsub("by Roger Marsh", "by Roger Marsh \n").gsub("READ MORE", ""))
      puts ""
      
      puts "type 'exit' to return to the story list"
      user_input  = gets.chomp.downcase
      puts `clear`# clears the terminal before displaying the story list
      display_story_list
    end
  end

    # Displays the table of recent sightings as a list 
  def display_sightings
    user_input = ""

    while user_input != "exit"
      error = ""
      counter = 0
      puts `clear` # Clears the terminal before displaying the list of recent sightings
      puts ""
      # Sighting.all.each do |row|
      #   counter += 1
      #   puts counter
      Sighting.all.each_with_index do |row, index|
        puts index + 1
        puts "Case # #{row.case_number} | Date of Event: #{row.date_of_event} | Date Reported: #{row.date_submitted}"
        puts "Location:  #{row.city} - #{row.state}"  
        puts ""
        puts wrap(row.description, 75)
        puts "-----------------------------------------------------------------------------"
        # seperates the sightings in the list
        puts "\n"
      end
      
      puts ""
      puts "type exit to return to the main menu"
      puts "or 'quit' to quit"
      puts ""
      user_input = gets.chomp.downcase
      if user_input == "exit"
        puts `clear`  # clears the terminal before displaying the main menu
        menu
      elsif user_input == "quit"
        puts `clear`  # clears the terminal before quiting
        abort
      end
    end
  end
end