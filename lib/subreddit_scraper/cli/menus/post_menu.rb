module SubredditScraper
  module Menu
    class PostMenu < Cli
      class << self
        def menu
          puts "User Menu"
          puts "Please enter an option"
          puts ""
          puts "1. List Posts"
          puts "2. List Posts by Subreddit"
          puts "3. List Posts by User"
          puts "4. List Comments in a Post"
          puts "5. Exit"
          menu_select(gets)
        end

        def menu_select(choice)
          case choice.strip.to_i
          when 1
            Post.all.each{|i| puts i.title; puts "Subreddit: #{i.subreddit.name}, Author: #{i.user.name}\n---"}
            puts ""
            puts "Press enter to continue"
            gets
          when 2
            list_posts_by_subreddit
          when 3
            list_posts_by_user
          when 4
            list_comments_by_post
          when 5
            return 0
          else
            puts "Error please try again"
          end
          menu
        end
      end
      
      before
    end
  end
end