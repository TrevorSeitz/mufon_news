class Article

  attr_accessor :article_title, :article_date, :article_text, :article_url, :comments_url

  @@all = []

  def initialize(article_title, article_info, article_text, article_url, comments_url)
    @article_title = article_title
    @article_date = article_info
    @article_text = article_text
    @article_url = article_url
    @comments_url = comments_url
    @@all << self
  end

  def self.all
    @@all
  end

  def display_summary
    counter = 0
    self.all.each do |article|
      counter += 1
      puts "#{counter}. #{@article_title}  -  #{@article_date}"
    end
  end

end
