require 'spec_helper'

describe Subreddit do
  it "tracks all posts by subreddit" do
    Post.new("More Memes", @subreddit, @user)
    expect(@subreddit.posts.include?(@post)).to equal(true)
    expect(@subreddit.posts.size).to equal(2)
  end

  it "tracks all subreddits" do
    new_subreddit = Subreddit.new("programming", "A subreddit for programming")
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

  it "can find by name" do
    new_subreddit = Subreddit.new("programming", "A subreddit for programming")
    expect(Subreddit.find_by_name("programming")).to equal(new_subreddit)    
  end

  it "can find by url" do
    new_subreddit = Subreddit.new("programming", "A subreddit for programming")
    expect(Subreddit.find_by_url("/r/programming")).to equal(new_subreddit)    
  end

  it "can find or create by name" do
    expect(Subreddit.find_or_create_by_name_and_description("programmerhumor",  "Not everybody understands the humor of programmers.")).to equal(@subreddit)
    Subreddit.find_or_create_by_name_and_description("programming",  "A subreddit for programming")
    expect(Subreddit.all.size).to equal(2)    
  end
end