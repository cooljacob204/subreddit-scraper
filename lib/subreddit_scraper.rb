require 'bundler'
require 'require_all'
require 'redd'
require 'dotenv/load'

require_all 'lib/subreddit_scraper/concerns' # load first

require './lib/subreddit_scraper/menu/main_menu.rb' # menu needs these to be loaded first
require './lib/subreddit_scraper/menu/post_menu.rb'
require './lib/subreddit_scraper/menu/subreddit_menu.rb'
require './lib/subreddit_scraper/menu/user_menu.rb'

require_all 'lib/subreddit_scraper/menu' # load after other menu parts are loaded
require_all 'lib/subreddit_scraper' # load last

module SubredditScaper
  class Error < StandardError; end
end