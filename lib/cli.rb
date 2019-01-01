module SubredditScraper
  class Cli
    def self.before(*names)
      names.each do |name|
        m = instance_method(name)
        define_method(name) do |*args, &block|  
          yield
          m.bind(self).(*args, &block)
        end
      end
    end
    
    def start
      puts "Welcome to my Subreddit Scrapper"
      puts "Press enter to continue"
      gets
      main_menu
    end

    def main_menu
      puts "Main Menu"
      puts "Please enter an option"
      puts ""
      puts "1. Scrap from URL"
      puts "2. Scrap from File"
      puts "3. Display Subreddit Menu"
      puts "4. Display Post Menu"
      puts "5. Display User Menu"
      puts "6. Exit"
      main_menu_select(gets)
    end
    
    def main_menu_select(choice)
      case choice.strip.to_i
      when 1
        scrape_from_url
      when 2
        scrape_from_file
      when 3
        list_users
      when 4
        list_subreddits_by_user
      when 5
        list_posts_by_user
      when 6
        return 0
      else
        puts "Error please try again"
      end
      main_menu
    end
    
    def scrape_from_url
      puts "Enter URL"
      if Scraper.scrapeSubredditFromUrl(gets.strip)
        puts "..."
        puts "Scraped Subreddit"
        sleep(3)
      else
        puts "..."
        puts "Error scraping Subreddit, try again"
        sleep(3)
      end
    end

    def scrape_from_file

    end
    
    def list_users

    end

    def list_subreddits_by_user
      
    end
    
    def list_posts_by_user
      
    end
    
    def subreddit_menu
      puts "Subreddit Menu"
      puts "Please enter an option"
      puts ""
      puts "1. List Subreddits"
      puts "2. Exit"
    end
    
    def user_menu
      puts "User Menu"
      puts "Please enter an option"
      puts ""
      puts "1. List Users"
      puts "2. List Users by Subreddit"
      puts "3. List Posts by User"
      puts "4. Exit"
    end
    
    def post_menu
      puts "User Menu"
      puts "Please enter an option"
      puts ""
      puts "1. List Posts"
      puts "2. List Posts by Subreddit"
      puts "3. List Posts by User"
      puts "4. Exit"
    end
    
    before(*instance_methods){Gem.win_platform? ? (system "cls") : (system "clear")}
  end
end