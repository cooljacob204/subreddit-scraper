require 'bundler'
require 'require_all'
Bundler.require
require_all 'lib'

include SubredditScraper

require 'pry'