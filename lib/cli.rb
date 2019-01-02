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
      puts "Welcome to my Subreddit Scraper"
      puts "Press enter to continue"
      gets
      main_menu
    end

    def main_menu
      puts "Main Menu"
      puts "Please enter an option"
      puts ""
      puts "1. Scrape from URL"
      puts "2. Scrape from File"
      puts "3. Display Subreddit Menu"
      puts "4. Display Post Menu"
      puts "5. Display User Menu"
      puts "6. Exit"
      main_menu_select(gets)
    end
    
    def main_menu_select(choice)
      case choice.strip.to_i
      when 1
        scrape("url")
      when 2
        scrape("file")
      when 3
        subreddit_menu
      when 4
        post_menu
      when 5
        user_menu
      when 6
        return 0
      else
        puts "Error please try again"
        sleep(2)
      end
      main_menu
    end
    
    def scrape(type)
      if type == "url"
        puts "Enter URL"
      else
        puts "Enter File Path"
      end

      if (type == "url" ? Scraper.scrapeSubredditFromUrl(gets.strip) : Scraper.scrapeSubredditFromFile(gets.strip))
        puts "..."
        puts "Scraped Subreddit"
        sleep(2)
      else
        puts "..."
        puts "Error scraping Subreddit, try again"
        sleep(2)
      end
    end
    
    def list_users(users)
      users.sort_by{|i| i.name.downcase}.each_with_index do |user, index| 
        puts user.name
      end
      puts ""
      puts "Press enter to continue"
      gets
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
      subreddit_menu_select(gets)
    end

    def subreddit_menu_select(choice)
       case choice.strip.to_i
       when 1
        Subreddit.all.sort_by{|i| i.name.downcase}.each{|i| puts i.name}
        puts ""
        puts "Press enter to continue"
        gets
       when 2
        return 0
       else
        puts "Error please try again"
        sleep(2)
       end
       subreddit_menu
    end
    
    def user_menu
      puts "User Menu"
      puts "Please enter an option"
      puts ""
      puts "1. List Users"
      puts "2. List Users by Subreddit"
      puts "3. List Posts by User"
      puts "4. Exit"
      user_menu_select(gets)
    end

    def list_users_by_subreddit
      print "Subreddits scraped are: "
      Subreddit.all.sort_by{|i| i.name.downcase}.each{|i| print "#{i.name} "}
      puts "\n"
      puts "Please enter subreddit name"
      subreddit = Subreddit.find_by_name(gets.strip)
      puts ""
      if !!subreddit
        subreddit.posts.sort_by{|i| i.user.name.downcase}.each do |i| 
          puts i.user.name
        end
        puts ""
        puts "Press enter to continue"
        gets
      else
        puts "Error please try again"
        sleep(2)
      end
    end

    def user_menu_select(choice)
      case choice.strip.to_i
      when 1
        list_users(User.all)
      when 2
        list_users_by_subreddit
      when 3
      when 4
        return 0
      else
        puts "Error please try again"
        sleep(2)
      end
      user_menu
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