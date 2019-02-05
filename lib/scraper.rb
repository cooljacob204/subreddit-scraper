module SubredditScraper
  class Scraper
    
    def self.scrape_subreddit_from_name(name)
      url = "https://old.reddit.com/r/#{name.strip}"
      page = Nokogiri::HTML(open(url))
      scrape_subreddit(page)
    end

    def self.scrap_post_comments(post)
      page = Nokogiri::HTML(open(post.comments_url))
      page.css('.thing').each do |comment|
          next if !comment.css('div.md').text
          comment_text = comment.css('div.md').text
          user = User.find_or_create_by_name(comment.css('a.author').text)
          Comment.new(comment_text, user, post)
      end
    end

    private

    def self.scrape_subreddit(page)
      subreddit_name = page.css('h1.redditname').text
      description = page.css('blockquote').text.strip

      subreddit = Subreddit.find_or_create_by_name_and_description(subreddit_name, description)

      page.css('.thing').each do |post|
        next if !post.css('time')[0] || !post.css('a.comments')[0]['href']# indicates there is an advertisement
        title = post.css('a.title').text
        date = post.css('time')[0]['datetime']
        author = post.css('a.author').text
        link = post.css('a.title')[0]['href']
        user = User.find_or_create_by_name(author)
        comments = post.css('a.comments')[0]['href']
        Post.new(title, subreddit, user, :date => date, :link => link, :comments => comments)
      end
    end
  end
end