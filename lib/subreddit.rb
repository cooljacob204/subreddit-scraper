module SubredditScraper
  class Subreddit
    attr_reader :name, :url, :description
    attr_accessor :posts
    extend Memorable::ClassMethods
    extend Findable
    include Memorable::InstanceMethods

    @@all = []

    def initialize(name, description)
      super()
      @posts = []
      @name = name
      @url = "/r/#{name}"
      @description = description
    end

    def self.all
      @@all
    end

    def self.find_by_url(url)
      all.find{|i| i.url == url}
    end

    def self.find_or_create_by_name_and_description(name, description)
      subreddit = find_by_name(name)

      if !subreddit 
        subreddit = self.new(name, description)
      end

      subreddit
    end
  end
end