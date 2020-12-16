require 'test_helper'
require 'database_cleaner/active_record'
#DatabaseCleaner.strategy = :truncation

class UserTest < ActiveSupport::TestCase
  # def setup
  #   puts("setup")
  # end

  # def before
  #   puts("before")
  #   DatabaseCleaner.start
  # end

  # def after
  #   puts("after")
  #   DatabaseCleaner.clean
  # end

  test "test if user has expected fields" do
    user = User.new(username: "user1", email: "user1@test.co", password_hash: "password")
    assert user.valid?
    #assert user.save
  end

  test "test if user is without username" do
    user = User.new(email: "user2@test.co", password_hash: "password")
    assert_not user.valid?
    #assert_not user.save
  end

  test "test if user is without email" do
    user = User.new(username:"user3",password_hash: "password")
    assert_not user.valid?
    #assert_not user.save
  end

  test "test if user is without password" do
    user = User.new(username:"user4", email: "user4@test.co",)
    assert_not user.valid?
    #assert_not user.save
  end

  test "test if user username is unique" do
    user = User.new(username:"user4", email: "user@test.co", password_hash: "password")
    assert user.valid?
    #assert_not user.save
  end

end
