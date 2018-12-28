require 'bundler'
require 'require_all'
require 'nokogiri'
Bundler.require
require_all 'lib'

include SubredditScraper

require 'pry'