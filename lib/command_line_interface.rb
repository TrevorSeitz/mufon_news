require_relative "../lib/scraper.rb"
require_relative "../lib/articles.rb"
require 'nokogiri'

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

    while user_input != "exit"
      puts `clear`
      puts "Welcome to the MUFON News Scraper!"
      puts "What would you like to do?"
      puts "1. UFO news"
      puts "2. MUFON news"
      puts "3. List of the last 20 UFO Reports"
      puts ""
      puts "type 'exit' to exit"
      puts ""
      puts error

      user_input = gets.chomp.downcase

      case user_input
      when "1"
        Article.reset
        Scraper.new(BASE_PATH + "ufo-news")
        puts `clear`
        puts "Welcome to MUFON's UFO news"
        display_story_list
      when "2"
        Article.reset
        Scraper.new(BASE_PATH + "mufon-news")
        puts `clear`
        puts "Welcome to MUFON news"
        display_story_list
      when "3"
        break
      else 
        error = "\nI'm sorry, that option is not available. \nPlease choos an availble option from the list"
      end
    end
    puts `clear`
    abort
  end
 

  def run
    article_info

  end

  def display_story_list
    continue = ""
    user_input = ""

    while user_input != "exit"
    error = ""
    counter = 0
        puts ""
      Article.all.each do |article|
        counter += 1
        puts "#{counter}. #{article.article_title}  -  #{article.article_date}"
      end
      puts ""
      puts "please choose a story between 1 & #{counter}"
      puts ""
      puts "type exit to return to the main menu"
      puts "or 'quit' to quit"
      puts ""
      puts error
    user_input = gets.chomp.downcase
    if user_input == "exit"
      puts `clear`
      menu
    elsif user_input == "quit"
      puts `clear`
      abort
    end
    index = user_input.to_i - 1
    display_story(index)
    end
    
  end

  def display_story(index)
    continue = ""
    while continue != "exit"
      puts `clear`
      puts "#{Article.all[index].article_title}  -  #{Article.all[index].article_date}"
      puts ""
      puts wrap(Article.all[index].article_text.gsub("by Roger Marsh", "by Roger Marsh \n").gsub("READ MORE", ""))
      puts ""
      puts "type 'exit' to return to the story list"
      continue  = gets.chomp.downcase
    end
    puts `clear`
    display_story_list
  end

end
