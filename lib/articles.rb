class Article

  attr_accessor :article_title, :article_date, :article_text, :article_url, :comments_url

  @@all = []

  def initialize(article_title, article_info, article_text, article_url, comments_url)
    if !@@all.include?(article_title)
      @article_title = article_title
      @article_date = article_info
      @article_text = article_text
      @article_url = article_url
      @comments_url = comments_url
      @@all << self
    end
  end

  def self.all
    @@all
  end

  def self.reset
    @@all = []
  end

end
