require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  # Test validations
  test "Valid" do
    article = articles(:valid)
    assert article.save
  end
  
  test "No Title" do
    article = articles(:title_error)
    assert !article.save
  end
  
  test "No Body" do
    article = articles(:body_error)
    assert !article.save
  end
  
end
