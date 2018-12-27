module SubredditScraper
  class Subreddit
    attr_reader :name, :url, :description
    attr_accessor :posts

    @@all = []

    def initialize(name, url, description)
      @posts = []
      @name = name
      @url = url
      @description = description

      @@all << self
    end

    def self.all
      @@all
    end
  end
end