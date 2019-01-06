module SubredditScraper
  module Menu
    module MainMenu
      def main_menu
        puts "Main Menu"
        puts "Please enter an option"
        puts ""
        puts "1. Scrape from URL"
        puts "2. Display Subreddit Menu"
        puts "3. Display Post Menu"
        puts "4. Display User Menu"
        puts "5. Exit"
        main_menu_select(gets)
      end
      
      def main_menu_select(choice)
        case choice.strip.to_i
        when 1
          scrape
        when 2
          subreddit_menu
        when 3
          post_menu
        when 4
          user_menu
        when 5
          return 0
        else
          puts "Error please try again"
          sleep(2)
        end
        main_menu
      end
      
      def scrape
        puts "Please enter Subreddit name"
        if (Scraper.scrapeSubredditFromName(gets.strip))
          puts "..."
          puts "Scraped Subreddit"
          sleep(2)
        else
          puts "..."
          puts "Error scraping Subreddit, try again"
          sleep(2)
        end
      end
    end
  end
end