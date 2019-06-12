require 'bundler'
require 'require_all'
require 'redd'
require 'dotenv/load'

require_all 'lib/subreddit_scraper/cli/actions'

require './lib/subreddit_scraper/cli.rb'
require_all 'lib/subreddit_scraper/concerns'
require_all 'lib/subreddit_scraper/cli'
require_all 'lib/subreddit_scraper'

module SubredditScaper
  class Error < StandardError; end
end