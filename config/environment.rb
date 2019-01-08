
require 'bundler'
require 'require_all'
require 'redd'
require 'dotenv/load'

require_all 'lib/concerns' # load first

require './lib/menu/main_menu.rb' # menu needs these to be loaded first
require './lib/menu/post_menu.rb'
require './lib/menu/subreddit_menu.rb'
require './lib/menu/user_menu.rb'

require_all 'lib/menu' # load after other menu parts are loaded

require_all 'lib' # load last

Bundler.require
include SubredditScraper

require 'pry'