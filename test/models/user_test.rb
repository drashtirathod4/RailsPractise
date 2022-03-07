require "test_helper"

class UserTest < ActiveSupport::TestCase
  def test_the_truth
    assert true
    puts "Tested!"
  end

  test "should not save user without email" do
    user = User.new
    # assert assures that Test is true
    assert user.save,  "Saved the user without a email"
    # assert_not assures that Test is false
    # assert_not user.save,  "Saved the user without a email"
  end

  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    # some_undefined_variable
    # assert true

    assert_raises(NameError) do
      some_undefined_variable
    end
  end

  def setup 
    @user = User.new(email: "drashti@mail.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "shouldn't save without name" do
    @user.name = ""
    assert @user.save
  end
  
  test "should be unique" do
    @user.save
    @user2 = User.new(email: "drashtir21@gmail.com")
    assert @user2.save
  end
end
