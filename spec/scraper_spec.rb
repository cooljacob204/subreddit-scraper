require 'spec_helper'

describe Scraper do
  it "scrapes from a subreddit name" do
    Scraper.scrape_subreddit_from_name("funny")
    expect(Post.count).to be > 20
  end
end