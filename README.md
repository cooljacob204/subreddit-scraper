# Subreddit Scraper

This is an app for scraping data from subreddits. It uses Nokogiri and Open-Uri.

## Usage

`Scraper.scrape_subreddit_from_name(name)` 

This method takes in a string that is a Subreddit's name and scraps it's front page. It stores the Subreddit's information in three types of objects: Subreddit, Users and Posts.

`Scraper.scrap_post_comments(post)`

This method takes in a Post type and scrapes the comments from that post. It stores the comments in Comment objects.

## Object Relation
These are the 4 primary objects used to store data.

### Subreddit
 * Has many Posts
 * Class Method #all keeps track of all created subreddits in a session.
 
### User
 * Has Many Posts
 * Class Method #all keeps track of all created subreddits in a session.
 
### Post
 * Belongs to Subreddit
 * Belongs to a User
 * Has many Comments
 * Class Method #all keeps track of all created subreddits in a session.
 
### Comments
 * Belongs to Post
 * Belongs to User
 * Class Method #all keeps track of all created subreddits in a session.
