module SubredditScraper
  class Post
    attr_reader :title, :subreddit, :user, :text, :link, :date
    extend Memorable::ClassMethods
    include Memorable::InstanceMethods

    @@all = []
    def initialize(title, subreddit, user, **args)
      super()
      @title = title
      @subreddit = subreddit
      @subreddit.posts << self
      @user = user
      @user.posts << self

      @link = args[:link]
      @date = args[:date]
    end

    def self.all
      @@all
    end
  end
end