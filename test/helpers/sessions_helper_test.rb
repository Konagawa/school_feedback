require "test_helper"

class SessionsHelperTest < ActionView::TestCase
  #渡されたユーザーをrememberメソッドで記憶する
  def setup
    @user = users(:michael)
    remember(@user)
  end
#currnet_userが渡されたユーザーと同じであることを確認する
  test "current user returns right user when session is nil" do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  test "current user returns nil when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end