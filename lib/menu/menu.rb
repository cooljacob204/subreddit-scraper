module SubredditScraper
  module Menu
    def self.before(*names) # used to append methods
      names.each do |name|
        m = instance_method(name)
        define_method(name) do |*args, &block|  
          yield
          m.bind(self).(*args, &block)
        end
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
        Scraper.scrap_post_comments(post) if !post.comments[0]
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

    include MainMenu # adding all functionality from other menus
    include SubredditMenu
    include UserMenu
    include PostMenu

    before(*instance_methods){Gem.win_platform? ? (system "cls") : (system "clear")} # appending clearing the console to all methods to keep the console clear
  end
end