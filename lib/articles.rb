class Article
  # This Class is used to build objects for both the UFO news page and the MUFON news page
  # some elements have been commented out but left in for future development options

  attr_accessor :article_title, :article_date, :article_text #, :article_url, :comments_url    -- for future development

  @@all = []

  def initialize(article_title, article_info, article_text)
    if !@@all.include?(article_title)
      @article_title = article_title
      @article_date = article_info
      @article_text = article_text
      # @article_url = article_url   -- for future development
      # @comments_url = comments_url   -- for future development

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