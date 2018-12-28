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
    expect(@user.name == "cooljacob204").to equal(true)
  end

  it "can find by name" do
    expect(User.find_by_name("cooljacob204")).to equal(@user)
  end

  it "can find or create by name" do
    expect(User.find_or_create_by_name("cooljacob204")).to equal(@user)
    User.find_or_create_by_name("jfed")
    expect(User.all.size).to equal(2)    
  end
end