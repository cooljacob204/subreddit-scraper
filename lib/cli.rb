require_all 'lib/menu'

module SubredditScraper
  class Cli
    include Menu    
    def start
      Gem.win_platform? ? (system "cls") : (system "clear")
      puts "Welcome to my Subreddit Scraper"
      puts "Press enter to continue"
      gets
      main_menu
    end
  end
end