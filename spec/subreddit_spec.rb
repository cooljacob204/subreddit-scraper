require 'spec_helper'

describe Subreddit do
  it "tracks all posts by subreddit" do
    Post.new("More Memes", @subreddit, @user)
    expect(@subreddit.posts.include?(@post)).to equal(true)
    expect(@subreddit.posts.size).to equal(2)
  end

  it "tracks all subreddits" do
    new_subreddit = Subreddit.new("programming", "/r/programming", "A subreddit for programming")
    expect(Subreddit.all.include?(new_subreddit)).to equal(true)
    expect(Subreddit.all.size).to equal(2)
  end
  
  it "has a name" do
    expect(@subreddit.name == "programmerhumor").to equal(true)
  end

  it "has a url" do
    expect(@subreddit.url == "/r/programmerhumor").to equal(true)    
  end

  it "has a description" do
    expect(@subreddit.description == "Not everybody understands the humor of programmers.").to equal(true)
  end
end