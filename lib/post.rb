module SubredditScraper
  class Post
    attr_reader :title, :subreddit, :user, :text, :link, :date, :comments_url
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
      @comments_url = args[:comments]
    end

    def self.all
      @@all
    end

    def self.find_by_title(title)
      all.detect{|a| a.title == title}
    end
    
    def comments
      Comment.all.select{|i| i.post == self}
    end
  end
end