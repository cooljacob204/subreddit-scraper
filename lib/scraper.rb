module SubredditScraper
  class Scraper
    def self.scrapeSubredditFromUrl(url)
    end

    def self.scrapeSubredditFromFile(path)
      html = File.read(path)
      page = Nokogiri::HTML(html)
      scrapeSubreddit(page)
    end

    private

    def self.scrapeSubreddit(page)
      subredditName = page.css('h1.redditname').text
      description = page.css('blockquote').text.strip

      subreddit = Subreddit.find_or_create_by_name_and_description(subredditName, description)

      page.css('.thing').each do |post|
        next if !post.css('time')[0] # indicates there is an advertisment
        title = post.css('a.title').text
        date = post.css('time')[0]['datetime']
        author = post.css('a.author').text
        link = post.css('a.title')[0]['href']
        user = User.find_or_create_by_name(author)

        Post.new(title, subreddit, user, :date => date, :link => link)
      end
    end
  end
end