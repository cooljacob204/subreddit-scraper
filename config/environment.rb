require 'bundler'
require 'require_all'
require 'redd'
require 'dotenv/load'

Bundler.require
require_all 'lib'

include SubredditScraper

require 'pry'