require 'bundler'
require 'require_all'
require 'nokogiri'
require 'open-uri'
Bundler.require
require_all 'lib'

include SubredditScraper

require 'pry'