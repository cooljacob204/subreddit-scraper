module SubredditScraper
  class Scraper
    def self.scrapeSubredditFromUrl(url)
      begin
        url = stripUrl(url)
        page = Nokogiri::HTML(open(url))
        scrapeSubreddit(page)
      rescue
        return false
      end
      true
    end

    def self.scrapeSubredditFromFile(path)
      begin
        html = File.read(path)
        page = Nokogiri::HTML(html)
        scrapeSubreddit(page)
      rescue
        return false
      end
      true
    end

    private

    def self.stripUrl(url)
      strippedUrl = "https://old.reddit.com"
      strippedUrl << /\/r\/[a-zA-Z0-9\-_]*/.match(url).to_s
      strippedUrl
    end
    
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