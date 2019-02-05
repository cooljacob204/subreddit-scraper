# Subreddit Downloader

This is an app for downloading data from subreddits. Originally a Nokogiri Scraper. It now uses an Redd, a Reddit API wrapper, to download a Subreddits front page.

## Usage

`Scraper.scrape_subreddit_from_name(name)` 

This method takes in a string that is a Subreddit's name and scrapes it's front page. It stores the Subreddit's information in four types of objects: Subreddit, Users, Posts and Comments.

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
