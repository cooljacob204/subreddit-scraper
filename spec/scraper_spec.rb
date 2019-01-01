require 'spec_helper'

describe Scraper do
  it "Intializes from file" do
    Scraper.scrapeSubredditFromFile('fixtures/ProgrammerHumor.html')
    expect(Post.count).to equal(27)
  end

  xit "Initializes from Url" do
    Scraper.scrapeSubredditFromUrl("reddit.com/r/funny")
    expect(Post.count).to be > 20
  end

  it "scraper returns false on bad url or file" do
    expect(Scraper.scrapeSubredditFromFile('fixtures/ProgrammerssHumor.html')).to equal(false)
    expect(Scraper.scrapeSubredditFromFile('google.com')).to equal(false)
  end
end