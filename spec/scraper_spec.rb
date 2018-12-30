require 'spec_helper'

describe Scraper do
  it "Intializes from file" do
    Scraper.scrapeSubredditFromFile('fixtures/ProgrammerHumor.html')
    expect(Post.count).to equal(27)
  end

  it "Initializes from Url" do
    Scraper.scrapeSubredditFromUrl("reddit.com/r/funny")
    expect(Post.count).to be > 20
  end
end