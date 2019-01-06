module SubredditScraper
  class Scraper
    def self.scrapeSubredditFromName(name)
      begin
        session = Redd.it(
          user_agent: 'Redd:RandomBot (by /u/cooljacob204)',
          client_id: ENV['CLIENT_ID'],
          secret: ENV['SECRET'] 
          )
          subredditToParse = session.subreddit(name)
        rescue
          return false
        end
        subreddit = Subreddit.find_or_create_by_name_and_description(
          subredditToParse.title,
          subredditToParse.description,
        )
        subredditToParse.hot.each do |post|
          Post.new(
            post.title,
            subreddit,
            User.find_or_create_by_name(post.author.name),
            :date => post.created,
            :link => post.url
          )
        end
      true
    end
  end
end