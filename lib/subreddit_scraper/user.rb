module SubredditScraper
  class User
    attr_reader :name
    attr_accessor :posts
    extend Memorable::ClassMethods
    extend Findable
    include Memorable::InstanceMethods
    
    @@all = []

    def initialize(name)
      super()
      @posts = []
      @name = name
    end

    def self.all
      @@all
    end

    def self.find_or_create_by_name(name)
      user = find_by_name(name)

      if !user 
        user = self.new(name)
      end

      user
    end
  end
end