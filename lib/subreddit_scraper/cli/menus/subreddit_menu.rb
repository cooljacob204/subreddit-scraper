module SubredditScraper
  module Menu
    class SubredditMenu < Cli
      class << self
        def menu
          puts "Subreddit Menu"
          puts "Please enter an option"
          puts ""
          puts "1. List Subreddits"
          puts "2. Exit"
          menu_select(gets)
        end

        def menu_select(choice)
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
          menu
        end
      end
      
      before
    end
  end
end