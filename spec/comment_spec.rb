require 'spec_helper'

describe Comment do
  it 'tracks all comments' do
    Comment.new("test", @user, @post)
    expect(Comment.count).to equal(1)
  end
  it 'belongs to a user' do
    comment = Comment.new("test", @user, @post)
    expect(comment.user).to equal(@user)
  end
  it 'belongs to a post' do
    comment = Comment.new("test", @user, @post)
    expect(comment.post).to equal(@post)
  end
end