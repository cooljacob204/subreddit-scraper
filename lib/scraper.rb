module SubredditScraper
  class Scraper
    def self.scrapeSubredditFromName(name)
      session = Redd.it(
        user_agent: 'Redd:RandomBot (by /u/cooljacob204)',
        client_id: ENV['CLIENT_ID'],
        secret: ENV['SECRET'] 
        )
      begin
        subredditToParse = session.subreddit(name)
        subreddit = Subreddit.find_or_create_by_name_and_description(
          subredditToParse.title,
          subredditToParse.description,
          )
          subredditToParse.hot.each do |post|
            newpost = Post.new(
            post.title,
            subreddit,
            User.find_or_create_by_name(post.author.name),
            :date => post.created,
            :link => post.url
            )
            post.comments.each do |comment|
              if comment.is_a?(Redd::Models::Comment) #checking that it is a indeed a comment
                Comment.new(
                  comment.body,
                  User.find_or_create_by_name(comment.author.name),
                  newpost
                  )
              end
            end
          end
      rescue
        return false
      end
      true
    end
  end
end