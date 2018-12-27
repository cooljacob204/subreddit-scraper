module SubredditScraper
  class User
    attr_reader :username
    attr_accessor :posts

    @@all = []

    def initialize(username)
      @posts = []
      @username = username

      @@all << self
    end

    def self.all
      @@all
    end
  end
end