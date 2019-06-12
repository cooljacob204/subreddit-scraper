module SubredditScraper
  module Menu
    class MainMenu < Cli
      class << self
        def start
          puts "Welcome to my Subreddit Scraper"
          puts "Press enter to continue"
          gets
          menu
        end

        def menu
          puts "Main Menu"
          puts "Please enter an option"
          puts ""
          puts "1. Scrape from URL"
          puts "2. Display Subreddit Menu"
          puts "3. Display Post Menu"
          puts "4. Display User Menu"
          puts "5. Exit"
          menu_select(gets)
        end
        
        def menu_select(choice)
          case choice.strip.to_i
          when 1
            scrape
          when 2
            SubredditMenu.menu
          when 3
            PostMenu.menu
          when 4
            UserMenu.menu
          when 5
            return 0
          else
            puts "Error please try again"
            sleep(2)
          end
          menu
        end
      end

      before
    end
  end
end