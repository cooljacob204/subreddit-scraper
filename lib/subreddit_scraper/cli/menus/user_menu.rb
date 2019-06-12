module SubredditScraper
  module Menu
    class UserMenu < Cli
      class << self
        def menu
          puts "User Menu"
          puts "Please enter an option"
          puts ""
          puts "1. List Users"
          puts "2. List Users by Subreddit"
          puts "3. List Posts by User"
          puts "4. Exit"
          menu_select(gets)
        end

        def menu_select(choice)
          case choice.strip.to_i
          when 1
            list_users(User.all)
          when 2
            list_users_by_subreddit
          when 3
            list_posts_by_user
          when 4
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