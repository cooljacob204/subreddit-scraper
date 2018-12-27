require 'spec_helper'

describe User do
  it "tracks all posts by user" do
    Post.new("More Memes", @subreddit, @user)
    expect(@user.posts.include?(@post)).to equal(true)
    expect(@user.posts.size).to equal(2)
  end

  it "tracks all users" do
    new_user = User.new("jfed")
    expect(User.all.include?(new_user)).to equal(true)
    expect(User.all.size).to equal(2)
  end
  
  it "has a name" do
    expect(@user.username == "cooljacob204").to equal(true)
  end
end