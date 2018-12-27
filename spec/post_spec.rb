require 'spec_helper'

describe Post do
  it "can track all posts" do
    Post.new("More Memes", @subreddit, @user)
    expect(Post.all.include?(@post)).to equal(true)
    expect(Post.all.size).to equal(2)
  end
  it "has an User" do
    expect(@post.user == @user).to equal(true)
  end

  it "has a Subreddit" do
    expect(@post.user == @user).to equal(true)
  end

  it "has a title and subject" do
    expect(@post.title == "Meme").to equal(true)
  end

  it "Can initialize with a Url" do
    new_post = Post.new("Test Meme", @subreddit, @user, :url => "lfp2.gg")
    expect(new_post.url == "lfp2.gg").to equal(true)
  end

  it "Can intialize with text" do
    new_post = Post.new("Test Meme", @subreddit, @user, :text => "testing the text")
    expect(new_post.text == "testing the text").to equal(true)
  end
end