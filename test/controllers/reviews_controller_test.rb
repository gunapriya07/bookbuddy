require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @review = reviews(:one)
  end

  test "should get index" do
    get book_reviews_url(@book)
    assert_response :success
  end

  test "should get new" do
    get new_book_review_url(@book)
    assert_response :success
  end

  test "should create review" do
    assert_difference("Review.count") do
      post book_reviews_url(@book), params: { review: { rating: 5, comment: "Great!" } }
    end
    assert_redirected_to book_path(@book)
  end

  test "should show review" do
    get book_review_url(@book, @review)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_review_url(@book, @review)
    assert_response :success
  end

  test "should update review" do
    patch book_review_url(@book, @review), params: {
      review: {
        rating: 4,
        comment: "Updated comment"
      }
    }
    assert_redirected_to book_path(@book)
  end

  test "should destroy review" do
    assert_difference("Review.count", -1) do
      delete book_review_url(@book, @review)
    end
    assert_redirected_to book_path(@book)
  end
end
