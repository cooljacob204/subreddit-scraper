require 'spec_helper'

describe Scraper do
  it "Intializes" do
    Scraper.scrapeSubredditFromFile('fixtures/ProgrammerHumor.html')
  end
end