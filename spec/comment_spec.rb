require 'spec_helper'

describe Comment do
  it "tracks all comments" do
    Comment.new("test", @user, @post)
    expect(Comment.count).to equal(1)
  end
end