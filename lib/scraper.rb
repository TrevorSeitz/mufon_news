require 'open-uri'
require 'pry'

class Scraper

  def initialize(site_url)
    @doc = Nokogiri::HTML(open(site_url))
    parse(@doc)
  end

  def parse(nokogiri_file)
    nokogiri_file.css(".blog-post").each do |article|
      # binding.pry
      if article.css(".paragraph").text != ""
        @article_junk = article.css("h2 a").text,
        @article_title = article.css("h2 a").text,
        @article_info = article.css(".blog-date .date-text").first.children.text.gsub("\n\t\t", "").gsub("\n\t", ""),
        @article_text = article.css(".paragraph").text,
        @article_url = article.css(".blog-link @href").first.value, #find href for article
        @comments_url = article.css(".blog-comments a @href").first.value,
        Article.new(@article_title, @article_info, @article_text, @article_url, @comments_url)
      end
    end
  end

end