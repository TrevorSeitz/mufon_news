require_relative "../lib/scraper.rb"
require_relative "../lib/articles.rb"
require 'nokogiri'

class CommandLineInterface
  BASE_PATH = "http://www.mufon.com/ufo-news"

  def initialize
    menu
  end

  def wrap(s, width=125)
	  s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1\n")
	end

  def menu
    user_input = ""

    while user_input != "exit"
      puts `clear`
      puts "Welcome to the MUFON News Scraper!"
      puts "What would you like to do?"
      puts "1. UFO news"
      puts "2. MUFON news"
      puts "3. List of the last 20 UFO Reports"
      puts "type 'exit' to exit"

      user_input = gets.chomp.downcase

      case user_input
      when "1"
        Scraper.new(BASE_PATH)
        display_summary
      when "2"
        break
      end
    end
    puts `clear`
    abort
  end
 

  def run
    article_info
  end

  def make_article
    article_array = Scraper.scrape_news_page(BASE_PATH)
    Article.create_from_collection(article_array)
  end

  def add_attributes_to_articles
    Article.all.each do |article|
      attributes = Scraper.scrape_news_page(BASE_PATH)
      # student.add_student_attributes(attributes)
    end
  end

  def display_summary
    counter = 0
    continue = ""
    user_input = ""

    while user_input != "exit"
        puts `clear`
        puts "Welcome to MUFON's UFO news"
        puts ""
      Article.all.each do |article|
        counter += 1
        puts "#{counter}. #{article.article_title}  -  #{article.article_date}"
      end
      puts ""
      puts "type exit to return to the main menu"
      puts "or 'quit' to quit"
    user_input = gets.chomp.downcase
    if user_input == "exit"
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
    display_summary
  end

end
