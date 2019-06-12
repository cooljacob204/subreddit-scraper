module SubredditScraper
  module Menu
    module Actions
      def list_users(users)
        users.sort_by{|i| i.name.downcase}.each_with_index do |user, index| 
          puts user.name
        end
        puts ""
        puts "Press enter to continue"
        gets
      end

      def list_users_by_subreddit
        print "Subreddits scraped are: "
        Subreddit.all.sort_by{|i| i.name.downcase}.each{|i| print "#{i.name} "}
        puts "\n"
        puts "Please enter subreddit name"
        subreddit = Subreddit.find_by_name(gets.strip)
        puts ""
        if subreddit
          subreddit.posts.map{|i| i.user.name}.sort.uniq.each{|name| puts name}
          puts ""
          puts "Press enter to continue"
          gets
        else
          puts "Error please try again"
          sleep(2)
        end
      end

      def list_posts_by_user
        puts "Please enter a user's name"
        user = User.find_by_name(gets.strip)
        puts ""
        if user
          puts "---"
          user.posts.sort_by{|i| i.title.downcase}.each do |post| 
              puts post.title, post.subreddit.name
              puts "---"
          end
          puts ""
          puts "Press enter to continue"
          gets
        else
          puts "User not found please try again"
          sleep(2)
        end
      end

      def list_posts_by_subreddit
        print "Subreddits scraped are: "
        Subreddit.all.sort_by{|i| i.name.downcase}.each{|i| print "#{i.name} "}
        puts "\n"
        puts "Please enter subreddit name"
        subreddit = Subreddit.find_by_name(gets.strip)
        puts ""
        if subreddit
          subreddit.posts.sort_by{|i| i.title.downcase}.each{|i| puts i.title, "Author: #{i.user.name}", "---"}
          puts ""
          puts "Press enter to continue"
          gets
        else
          puts "Error please try again"
          sleep(2)
        end
      end

      def list_comments_by_post
        puts "Please enter a post's title"
        post = Post.find_by_title(gets.strip)
        puts ""
        if post
          puts "---"
          post.comments.each do |comment| 
              puts "Author: #{comment.user.name}\n", comment.comment
              puts "---"
          end
          puts ""
          puts "Press enter to continue"
          gets
        else
          puts "Post not found please try again"
          sleep(2)
        end
      end
      
      def scrape
        puts "Please enter Subreddit name"
        if (Scraper.scrape_subreddit_from_name(gets.strip))
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