require_relative "../config/environment.rb"

RSpec.configure do |config|
  # some (optional) config here

  config.before(:each) do
    User.all.clear
    Post.all.clear
    Subreddit.all.clear
    @user = User.new("cooljacob204")
    @subreddit = Subreddit.new("programmerhumor", "/r/programmerhumor", "Not everybody understands the humor of programmers.")
    @post = Post.new("Meme", @subreddit, @user)
  end
end