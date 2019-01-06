module SubredditScraper
  module Menu
    module PostMenu
      def post_menu
        puts "User Menu"
        puts "Please enter an option"
        puts ""
        puts "1. List Posts"
        puts "2. List Posts by Subreddit"
        puts "3. List Posts by User"
        puts "4. Exit"
        post_menu_select(gets)
      end

      def post_menu_select(choice)
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
          return 0
        else
          puts "Error please try again"
        end
        post_menu
      end
    end
  end
end