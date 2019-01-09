module SubredditScraper
  class Comment
    attr_reader :comment, :user, :post
    extend Memorable::ClassMethods
    include Memorable::InstanceMethods

    @@all = []
    def initialize(comment, user, post)
      super()
      @comment = comment
      @user = user
      @post = post
    end

    def self.all
      @@all
    end
  end
end