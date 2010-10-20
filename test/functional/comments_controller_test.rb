require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  
  def setup
    @article = articles(:valid)
    @article.save
  end
  
  test "should get index" do
    get :index
    assert_redirected_to articles_path
  end

  test "should get new" do
    get :new, :article_id => @article.id
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, :artcile_id => @article.id, :comment => { :poster_name => 'Joe Blogs', :body => 'This is my comment' }
    end

    assert_redirected_to article_path(@article)
  end

  test "should show comment" do
    get :show, :article_id => @article.id, :id => comments(:valid).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :article_id => @article.id, :id => comments(:valid).to_param
    assert_response :success
  end

  test "should update comment" do
    put :update, :id => comments(:valid).to_param, :article_id => @article.id, :comment => { :body => 'Something different' }
    assert_redirected_to article_path(@article)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, :id => comments(:valid).to_param
    end

    assert_redirected_to articles_url
  end
end
