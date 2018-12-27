module SubredditScraper
  class Post
    attr_reader :title, :subreddit, :user, :text, :url

    @@all = []
    def initialize(title, subreddit, user, **args)
      @title = title
      @subreddit = subreddit
      @subreddit.posts << self
      @user = user
      @user.posts << self

      @url = args[:url]
      @text = args[:text]

      @@all << self
    end

    def self.all
      @@all
    end
  end
end