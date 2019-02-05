module SubredditScraper
  class Scraper
    def self.scrape_subreddit_from_name(name)
      session = Redd.it(
        user_agent: 'Redd:RandomBot (by /u/cooljacob204)',
        client_id: ENV['CLIENT_ID'],
        secret: ENV['SECRET'] 
        )
      begin
        subreddit_to_parse = session.subreddit(name)
        subreddit = Subreddit.find_or_create_by_name_and_description(
          subreddit_to_parse.title,
          subreddit_to_parse.description,
          )
          subreddit_to_parse.hot.each do |post|
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