require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  # Test validations
  test "Valid" do
    comment = comments(:valid)
    assert comment.save
  end
  
  test "No article_id" do
    comment = comments(:article_error)
    assert !comment.save
  end
  
  test "No Poster" do
    comment = comments(:poster_error)
    assert !comment.save
  end
  
  test "No Body" do
    comment = comments(:body_error)
    assert !comment.save
  end
  
end

