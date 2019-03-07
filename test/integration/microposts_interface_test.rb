require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "micropost interface" do
    log_in_as(@user)

    #
    # 自分のプロフィール画面のインタフェースについて
    #
    get user_path(@user)
    first_page = @user.microposts.paginate(page: 1)
    # first_page.each do |micropost|
    #   assert_select 'a[href=?]', micropost_path(micropost), text: "Delete"
    # end

    #
    # ホーム画面のインタフェースについて
    #
    get root_path
    first_page = Micropost.paginate(page: 1)
    first_page.each do |micropost|
      if @user == micropost.user
        #assert_select 'a[href=?]', micropost_path(micropost), text: "Delete"
      else
        assert_select 'a[href=?]', micropost_path(micropost), text: "Delete", count:0
      end
    end

    #
    # 無効な送信
    #
    get new_micropost_path
    assert_template 'microposts/new'
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: {micropost: {
          title: "",
          content: ""
        }}
    end
    assert_template 'microposts/new'

    assert_no_difference 'Micropost.count' do
      post microposts_path, params: {micropost: {
          title: "valid",
          content: ""
        }}
    end
    assert_template 'microposts/new'

    assert_no_difference 'Micropost.count' do
      post microposts_path, params: {micropost: {
          title: "",
          content: "valid"
        }}
    end
    assert_template 'microposts/new'

    #
    # 有効な送信
    #
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: {micropost: {
          title: "valid",
          content: "valid",
          price: "300円"
        }}
    end
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_match "valid", response.body

    #
    # 投稿の削除
    #
    #assert_select 'a', text: "Delete"
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    get user_path(users(:archer))
    assert_select 'a', text: "Delete", count:0
  end

end
