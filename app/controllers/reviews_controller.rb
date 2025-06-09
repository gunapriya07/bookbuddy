class ReviewsController < ApplicationController
  before_action :set_book
  before_action :set_review, only: %i[show edit update destroy]

  def index
    @reviews = @book.reviews
  end


  def create
    @review = @book.reviews.build(review_params)

    if @review.save
      redirect_to book_path(@book), notice: "Review was successfully created."
    else
      render :new
    end
  end

  def new
    @review = @book.reviews.build
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @book, notice: "Review was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to @book, notice: "Review was successfully destroyed.", status: :see_other
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_review
    @review = @book.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
