class Scraper

  def initialize(site_url)
    # Decides which scraper to use to 
    @doc = Nokogiri::HTML(open(site_url))
    if site_url.include? "news"
      parse_news(@doc)
    elsif site_url.include? "report"
      parse_report(@doc)
    end
  end
  
  def parse_news(nokogiri_file)
    # Pulls the elements from the UFO news page and the MUFON news page
    nokogiri_file.css(".blog-post").each do |article|
      if article.css(".paragraph").text != ""
        @article_junk = article.css("h2 a").text, # without this line of code - @article_title = nil
        @article_title = article.css("h2 a").text,
        @article_info = article.css(".blog-date .date-text").first.children.text.gsub("\n\t\t", "").gsub("\n\t", ""),
        @article_text = article.css(".paragraph").text,
        # @article_url = article.css(".blog-link @href").first.value, #find href for article
        # @comments_url = article.css(".blog-comments a @href").first.value.gsub("//", ""),
        Article.new(@article_title, @article_info, @article_text) #, @article_url, @comments_url)
      end
    end
  end

  def parse_report(nokogiri_file)
    # Pulls the elements from the Recent Sightings page
    counter = 0
    nokogiri_file.css("tr").each do |row|
      counter += 1
      if counter > 3 # this is required to get past the 3 unwanted "tr" elements in the table
        # there are 2 blank rows and a row of headers in the table
        @case_number = row.css("td")[0].text
        @date_submitted = row.css("td")[1].text
        @date_of_event = row.css("td")[2].text
        @description = row.css("td")[3].text.gsub("{td}", "")
        @city = row.css("td")[4].text
        @state = row.css("td")[5].text
        @junk = row.css("td")[6].text
        Sighting.new(@case_number, @date_submitted, @date_of_event, @description, @city, @state)
      end
    end
  end
end